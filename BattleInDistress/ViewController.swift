//
//  ViewController.swift
//  RememberMe
//
//  Created by Nicholas Largen on 12/1/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils
import FBSDKCoreKit
import ParseFacebookUtilsV4

class ViewController: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func CreateButtonPressed(sender: AnyObject)
    {
        let rgvc = self.storyboard?.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterVC
        self.presentViewController(rgvc, animated: true, completion: nil)
    }
    
    @IBAction func LoginButtonPressed(sender: AnyObject)
    {
        PFUser.logInWithUsernameInBackground(usernameTF.text!, password: passwordTF.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil
            {
                
                print("login successful")
                UserDataSingleton.currentuser = PFUser.currentUser()
                let divc = self.storyboard?.instantiateViewControllerWithIdentifier("DistressInfoVC") as! DistressInfoVC
                self.presentViewController(divc, animated: true, completion: nil)
                
                // Do stuff after successful login.
            } else
            {
                // The login failed. Check error to see why.
            }
        }
    }
    
    @IBAction func FacebookLoginButtonPressed(sender: AnyObject)
    {
        PFFacebookUtils.logInInBackgroundWithReadPermissions(nil){
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                    UserDataSingleton.currentuser = PFUser.currentUser()
                    let divc = self.storyboard?.instantiateViewControllerWithIdentifier("DistressInfoVC") as! DistressInfoVC
                    self.presentViewController(divc, animated: true, completion: nil)
                }
                else {
                    print("User logged in through Facebook!")
                    UserDataSingleton.currentuser = PFUser.currentUser()
                    let divc = self.storyboard?.instantiateViewControllerWithIdentifier("DistressInfoVC") as! DistressInfoVC
                    self.presentViewController(divc, animated: true, completion: nil)
                    
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        }
        
    }
    @IBAction func TwitterLoginButton(sender: AnyObject)
    {
        PFTwitterUtils.logInWithBlock { (user: PFUser?, error: NSError?) -> Void in
            if(user != nil)
            {
                if user!.isNew
                {
                    UserDataSingleton.currentuser = PFUser.currentUser()
                    print("User signed up and logged in with Twitter!")
                    let divc = self.storyboard?.instantiateViewControllerWithIdentifier("DistressInfoVC") as! DistressInfoVC
                    self.presentViewController(divc, animated: true, completion: nil)
                }
                else
                {
                    UserDataSingleton.currentuser = PFUser.currentUser()
                    
                    let query = PFQuery(className: "UserData")
                    query.whereKey("owner_id", equalTo: UserDataSingleton.currentuser!)
                    query.findObjectsInBackgroundWithBlock { (userdata : [PFObject]?, error: NSError?) -> Void in
                        if(userdata != nil)
                        {
                           
                            print("User logged in with Twitter!")
                            let uhvc = self.storyboard?.instantiateViewControllerWithIdentifier("UserHomePageVC") as! UserHomePageVC
                            self.presentViewController(uhvc, animated: true, completion: nil)
                            }
                        else
                        {
                            print("None Found")
                        }
                    }
                    
                    
                }
            }
            else
            {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.usernameTF.becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

