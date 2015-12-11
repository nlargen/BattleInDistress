//
//  RegisterVC.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/1/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils
class RegisterVC: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmpasswordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBAction func CreateButtonPressed(sender: AnyObject)
    {
        let user = PFUser()
        user.username = usernameTF.text
        user.password = passwordTF.text
        user.email = emailTF.text
        // other fields can be set just like with PFObject
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let _ = error {
                
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                print("register successful")
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    @IBAction func CancelButton(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
