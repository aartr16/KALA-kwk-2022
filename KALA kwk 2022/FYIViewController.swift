//
//  FYIViewController.swift
//  KALA kwk 2022
//
//  Created by Scholar on 6/29/22.
//

import UIKit
import SafariServices

class FYIViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        }
    
     @IBAction func varyingCycles(_ sender: Any) {
     let safariVC = SFSafariViewController(url: NSURL(string: "https://www.mayoclinic.org/healthy-lifestyle/womens-health/in-depth/menstrual-cycle/art-20047186")! as URL)
     self.present(safariVC, animated: true, completion: nil)
     safariVC.delegate = self
     }
     @IBAction func periodEducation(_ sender: Any) {
     let safariVC = SFSafariViewController(url: NSURL(string: "https://period-action.org/education")! as URL)
     self.present(safariVC, animated: true, completion: nil)
     safariVC.delegate = self
     }
     @IBAction func tamponShortage(_ sender: Any) {
     let safariVC = SFSafariViewController(url: NSURL(string: "https://www.cnet.com/health/personal-care/tampon-shortage-means-your-brand-might-be-hard-to-find-right-now/")! as URL)
     self.present(safariVC, animated: true, completion: nil)
     safariVC.delegate = self
     }
     @IBAction func birthControlOptions(_ sender: Any) {
     let safariVC = SFSafariViewController(url: NSURL(string: "https://www.forhers.com/blog/birth-control-pill-vs-iud")! as URL)
     self.present(safariVC, animated: true, completion: nil)
     safariVC.delegate = self
     }
    
     func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
               controller.dismiss(animated: true, completion: nil)
           }
    
}
        
            
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

