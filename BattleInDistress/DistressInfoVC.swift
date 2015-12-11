//
//  DistressInfoVC.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/9/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
class DistressInfoVC: UIViewController {
    @IBOutlet weak var FullNameTF: UITextField!
    @IBOutlet weak var MOSTF: UITextField!
    @IBOutlet weak var PhoneNumTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var LocationTF: UITextField!

    @IBAction func SaveButtonPressed(sender: AnyObject)
    {
        let userdata = PFObject(className:"UserData")
        userdata["FullName"] = FullNameTF.text
        userdata["MOS"] = MOSTF.text
        userdata["PhoneNumber"] = PhoneNumTF.text
        userdata["Location"] = LocationTF.text
        
        userdata["owner_id"] = UserDataSingleton.currentuser
        
        userdata.saveInBackgroundWithBlock {
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
    override func viewDidLoad() {
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
