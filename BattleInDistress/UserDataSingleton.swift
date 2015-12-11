//
//  UserDataSingleton.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/9/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
class UserDataSingleton: NSObject
{
    static var currentuser : PFUser?
    
    // info for adding battles 
    static var battleobj = [PFObject]()
    static var battlename : String?
    static var battleemail : String?
    static var battlePhone : String?
    
    //info for user side distress call
    
    static var DistressData = [PFObject]()
    static var userName : String?
    static var userMOS : String?
    static var userLocation : String?
    static var userPhoneNumber : String?
    static var userEmail : String? 
    
    static var celltypes = ["Check In", " Check Up" , "Find Help", "Send Help"]
    
    
    
    static func showAlert(title: String, message: String, presentingViewController: UIViewController, onScreenDelay: Double)
    {
        let av = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        presentingViewController.presentViewController(av, animated: true, completion: { () -> Void in
            let delay = onScreenDelay * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
                presentingViewController.dismissViewControllerAnimated(true, completion: nil)
            })
        })
        
    }


}
