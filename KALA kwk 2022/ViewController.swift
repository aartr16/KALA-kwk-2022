//
//  ViewController.swift
//  KALA kwk 2022
//
//  Created by Scholar on 6/28/22.
// I WAS HERE!! - Lily Windmiller :D
// I WAS ALSO HERE :)- ANAIYAAA
import UIKit

import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    @IBOutlet weak var days: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        days.text = String(getDays())
    }
    
    @IBAction func periodEducation(_ sender: Any) {
    let safariVC = SFSafariViewController(url: NSURL(string: "https://period-action.org/education")! as URL)
    self.present(safariVC, animated: true, completion: nil)
    safariVC.delegate = self
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
              controller.dismiss(animated: true, completion: nil)
          }

    
    override func viewWillAppear(_ animated: Bool) {
        days.text = String(getDays())
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

}

