//
//  SymptomViewController.swift
//  KALA kwk 2022
//
//  Created by Scholar on 7/1/22.
//

import UIKit

class SymptomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var crampSuggest : [String] = ["Use a heating pad!", "Take a hot bath!", "Exercise for 30 minutes!"]
  
     
     var migraineSuggest : [String] = ["Take some ibuprofen!", "Spend some time in the dark!", "Take a nap!"]
     
     var achesSuggest : [String] = ["Try some yoga!","Use a heating pad!",
   "Drink some water!"]
     
     var acneSuggest : [String] = ["Try witch hazel or aloe vera!", "Cut out junk food from your diet!", "Steam your face to get rid of toxins!"]
    
    @IBOutlet weak var crampShowSug: UILabel!
    
    @IBOutlet weak var migraineShowSug: UILabel!
    
    @IBOutlet weak var achesShowSug: UILabel!
    
    @IBOutlet weak var acneShowSug: UILabel!
    
    
    @IBAction func cramps(_ sender: Any) {
        let randomNumber = Int.random(in :0...2)
        crampShowSug.text = crampSuggest[randomNumber]
    }
    
    @IBAction func migraines(_ sender: Any) {
        let randomNumber = Int.random(in :0...2)
        migraineShowSug.text = migraineSuggest[randomNumber]
    }
    @IBAction func aches(_ sender: Any) {
        let randomNumber = Int.random(in :0...2)
        achesShowSug.text = achesSuggest[randomNumber]
    }
     @IBAction func acne(_ sender: Any) {
         let randomNumber = Int.random(in :0...2)
         acneShowSug.text = acneSuggest[randomNumber]
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
