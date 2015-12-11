//
//  AddBattlesVC.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/9/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
class AddBattlesVC: UIViewController {

    @IBOutlet weak var BattleNameTF: UITextField!
    @IBOutlet weak var BattleEmailTF: UITextField!
    @IBOutlet weak var BattlePhoneTF: UITextField!
    
    @IBAction func SubmitButtonPressed(sender: AnyObject)
    {
        let BattleData = PFObject(className:"BattleData")
        BattleData["BattleName"] = BattleNameTF.text
        BattleData["BattleEmail"] = BattleEmailTF.text
        BattleData["BattlePhone"] = BattlePhoneTF.text
        BattleData["owner_id"] = UserDataSingleton.currentuser
        
        BattleData.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("saved")
                
                let uhvc = self.storyboard?.instantiateViewControllerWithIdentifier("UserHomePageVC") as! UserHomePageVC
                self.presentViewController(uhvc, animated: true, completion: nil)
                
            }
            else
            {
                print("save error")
                // There was a problem, check error.description
            }
        }

        
    }
    
    
    @IBAction func CancelButtonPressed(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
