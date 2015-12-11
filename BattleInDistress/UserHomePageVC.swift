//
//  UserHomePageVC.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/9/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
import Alamofire
class UserHomePageVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var indexrowcv = 0
    @IBOutlet weak var BattleTV: UITableView!
    
    @IBOutlet weak var DistressButtonCV: UICollectionView!
    
    
    @IBAction func LogoutButtonPressed(sender: AnyObject)
    {
      UserDataSingleton.battleobj.removeAll()
        UserDataSingleton.DistressData.removeAll()
        UserDataSingleton.currentuser = nil
        let lpvc = self.storyboard?.instantiateViewControllerWithIdentifier("LoginVC")
        as! ViewController
        self.presentViewController(lpvc, animated: true, completion: nil)
    }
    
    @IBAction func AddBattlesButtonPressed(sender: AnyObject)
    {
        let abvc = self.storyboard?.instantiateViewControllerWithIdentifier("AddBattlesVC") as! AddBattlesVC
        self.presentViewController(abvc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        
        
        BattleTV.reloadData()
        DistressButtonCV.reloadData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        let query = PFQuery(className: "BattleData")
        query.whereKey("owner_id", equalTo: UserDataSingleton.currentuser!)
        query.findObjectsInBackgroundWithBlock { (battledata : [PFObject]?, error: NSError?) -> Void in
            if(battledata != nil)
            {
                UserDataSingleton.battleobj = battledata!
                self.BattleTV.reloadData()
            }
            else
            {
                print("None Found")
            }
        }
        
        let distressquery = PFQuery(className: "UserData")
        distressquery.whereKey("owner_id", equalTo: UserDataSingleton.currentuser!)
        distressquery.findObjectsInBackgroundWithBlock { (distressdata : [PFObject]?, error: NSError?) -> Void in
            if(distressdata != nil)
            {
                UserDataSingleton.DistressData = distressdata!
               
            }
            else
            {
                print("None Found")
            }
        }

    }










    //****************************************************
    //Begin TableView Controllers

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserDataSingleton.battleobj.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("battlecell", forIndexPath: indexPath) as! BattleTableCell
        //update this code to fill the labels with the proper values
        
        cell.BattleNameLabel.text = UserDataSingleton.battleobj[indexPath.row].objectForKey("BattleName") as? String
        cell.BattlePhoneLabel.text = UserDataSingleton.battleobj[indexPath.row].objectForKey("BattlePhone") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        self.indexrowcv = indexPath.row
        print(indexrowcv)
    }
    
    
    
    //End TableView Controllers 
    //****************************************************
    
    
    
    
    
    
    // Begin CollectionView controllers
    //***************
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        // #warning Incomplete implementation, return the number of items
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CheckUp", forIndexPath: indexPath) as! DistressCell
        cell.DistressLabelType.text = UserDataSingleton.celltypes[indexPath.row]
        cell.backgroundColor = UIColor.redColor()
        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        if(indexPath.row == 0)
        {
            let parameters = [
                "To": UserDataSingleton.battleobj[indexrowcv].objectForKey("BattlePhone")as! String,
                "From" : "12196413121",
                "Body": ("\(UserDataSingleton.battleobj[indexrowcv].objectForKey("BattleName")!) it's \(UserDataSingleton.DistressData[0].objectForKey("FullName")!) from warrior point. How are you doing?"),]
            
            /* Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/AC9fd80a3c5c2573ad7f4c0b9db42a1e4b/Messages.json",
            parameters: parameters, encoding: .URL ).authenticate(user:"SK7465c312e3d4fff5384627da9c52cd42", password:"hCkJV4BMITO08gcTdtilnDPunE6cPL3M")
            print("success")
            */
             UserDataSingleton.showAlert("\(UserDataSingleton.celltypes[indexPath.row]) Sent", message: ("\(parameters["Body"]!)"), presentingViewController: self, onScreenDelay: 2)

        }
        else if(indexPath.row == 1)
        {
            let parameters = [
                "To": UserDataSingleton.battleobj[indexrowcv].objectForKey("BattlePhone")as! String,
                "From" : "12196413121",
                "Body": ("\(UserDataSingleton.battleobj[indexrowcv].objectForKey("BattleName")!) it's \(UserDataSingleton.DistressData[0].objectForKey("FullName")!) from warrior point. How are you doing?"),]
            
            /* Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/AC9fd80a3c5c2573ad7f4c0b9db42a1e4b/Messages.json",
            parameters: parameters, encoding: .URL ).authenticate(user:"SK7465c312e3d4fff5384627da9c52cd42", password:"hCkJV4BMITO08gcTdtilnDPunE6cPL3M")
            print("success")
            */
            UserDataSingleton.showAlert("\(UserDataSingleton.celltypes[indexPath.row]) Sent", message: ("\(parameters["Body"]!)"), presentingViewController: self, onScreenDelay: 2)

        }
        else if(indexPath.row == 2)
        {
            let parameters = [
                "To": UserDataSingleton.battleobj[indexrowcv].objectForKey("BattlePhone")as! String,
                "From" : "12196413121",
                "Body": ("\(UserDataSingleton.battleobj[indexrowcv].objectForKey("BattleName")!) it's \(UserDataSingleton.DistressData[0].objectForKey("FullName")!) from warrior point. I need Help"),]
            
            /* Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/AC9fd80a3c5c2573ad7f4c0b9db42a1e4b/Messages.json",
            parameters: parameters, encoding: .URL ).authenticate(user:"SK7465c312e3d4fff5384627da9c52cd42", password:"hCkJV4BMITO08gcTdtilnDPunE6cPL3M")
            print("success")
            */
             UserDataSingleton.showAlert("\(UserDataSingleton.celltypes[indexPath.row]) Sent", message: ("\(parameters["Body"]!)"), presentingViewController: self, onScreenDelay: 2)

        }
        else if(indexPath.row == 3)
        {
            
            for(var i = 0; i < UserDataSingleton.battleobj.count; i++)
            {
                let parameters = [
                    "To": UserDataSingleton.battleobj[indexrowcv].objectForKey("BattlePhone")as! String,
                    "From" : "12196413121",
                    "Body": ("\(UserDataSingleton.battleobj[i].objectForKey("BattleName")!) it's \(UserDataSingleton.DistressData[0].objectForKey("FullName")!) from warrior point. We have a battle in distress!"),]
           /*  Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/AC9fd80a3c5c2573ad7f4c0b9db42a1e4b/Messages.json",
            parameters: parameters, encoding: .URL ).authenticate(user:"SK7465c312e3d4fff5384627da9c52cd42", password:"hCkJV4BMITO08gcTdtilnDPunE6cPL3M")
            */
            print("success")
            }
             UserDataSingleton.showAlert("\(UserDataSingleton.celltypes[indexPath.row]) Sent", message: "Battle in Distress", presentingViewController: self, onScreenDelay: 2)

        }
        
        
    }
    
    
        //End CollectionView Controllers for distressCV
    
    
    
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
