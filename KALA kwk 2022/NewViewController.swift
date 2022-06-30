//
//  NewViewController.swift
//  KALA kwk 2022
//
//  Created by Scholar on 6/30/22.
//

import UIKit
import CoreData

class NewViewController: UIViewController {

    @IBOutlet weak var notes: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        notes.text = getNotes()
        
    }
    
    func getNotes() -> String {
        // fetch from core data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            if let coreDataNotes = try? context.fetch(Notes.fetchRequest()) as? [Notes] {
                if(coreDataNotes.count == 0) {
                    return ""
                }
                return coreDataNotes[coreDataNotes.count-1].text!
            }
          }
        // return last one
        return "this is just a test"
    }
    
    @IBAction func save(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
          if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            // we are creating a new ToDoCD object here, naming it toDo
            let notesCD = Notes(entity: Notes.entity(), insertInto: context)

            // if the titleTextField has text, we will call that text titleText
            if let notesText = notes.text {
                // we will take the titleText and assign that value to toDo.name
                // this .name and .important came from the attributes you typed in on the Core Data page!
                
                notesCD.text = notesText
            }

            try? context.save()
          }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
