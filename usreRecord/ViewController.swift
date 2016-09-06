//
//  ViewController.swift
//  usreRecord
//
//  Created by Nadeem Sadiq on 2016-09-05.
//  Copyright © 2016 Nadeem Sadiq. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var firstnameField: UITextField!
    
    @IBOutlet weak var lastnameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveUser(sender: AnyObject) {
        
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext=appDel.managedObjectContext
        
        let newUser=NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context)
        
        newUser.setValue(self.firstnameField.text, forKey: "firstname")
        newUser.setValue(self.lastnameField.text, forKey: "lastname")
        
        do{
            try context.save()
        }
        catch{
            print("Error while saving the data")
        }
        
    }
    
    @IBAction func showallUser(sender: AnyObject) {
    }
}

