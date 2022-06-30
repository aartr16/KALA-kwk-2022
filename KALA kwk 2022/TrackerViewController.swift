//
//  TrackerViewController.swift
//  KALA kwk 2022
//
//  Created by Scholar on 6/30/22.
//

import UIKit

class TrackerViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var numDays: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        numDays.text = String(getDays())
        
    }
    
    func getDays() -> Int {
        // fetch from core data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            if let coreDataTracker = try? context.fetch(Tracker.fetchRequest()) as? [Tracker] {
                if(coreDataTracker.count != 0) {
                    return Int(coreDataTracker[coreDataTracker.count-1].numDays)
                }
            }
          }
        return 0
    }
    
    @IBAction func minus(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTracker = try? context.fetch(Tracker.fetchRequest()) as? [Tracker] {
                if(coreDataTracker.count != 0) {
                        // In my case, I only updated the first item in results
                    coreDataTracker[coreDataTracker.count-1].setValue( coreDataTracker[coreDataTracker.count-1].numDays-1, forKey: "numDays")
                    }
            }

          try? context.save()
            numDays.text = String(Int(numDays.text!)! - 1)
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTracker = try? context.fetch(Tracker.fetchRequest()) as? [Tracker] {
                if(coreDataTracker.count != 0) {
                        // In my case, I only updated the first item in results
                    coreDataTracker[coreDataTracker.count-1].setValue( coreDataTracker[coreDataTracker.count-1].numDays+1, forKey: "numDays")
                    }
            }

          try? context.save()
            numDays.text = String(Int(numDays.text!)! + 1)
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

    @IBAction func startPeriod(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

          // we are creating a new ToDoCD object here, naming it toDo
          let newTracker = Tracker(entity: Tracker.entity(), insertInto: context)

          // if the titleTextField has text, we will call that text titleText
            newTracker.isOnPeriod = true
            newTracker.numDays = 0

          try? context.save()
        }
        infoLabel.text = "your current period has lasted"
    }
    
    @IBAction func done(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTracker = try? context.fetch(Tracker.fetchRequest()) as? [Tracker] {
                if(coreDataTracker.count != 0) {
                    coreDataTracker[coreDataTracker.count-1].setValue( false, forKey: "isOnPeriod")
                    }
            }

          try? context.save()
        }
        infoLabel.text = "your previous period lasted"
    }
}
