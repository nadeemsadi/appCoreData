//
//  secondVcViewController.swift
//  usreRecord
//
//  Created by Nadeem Sadiq on 2016-09-05.
//  Copyright © 2016 Nadeem Sadiq. All rights reserved.
//

import UIKit
import CoreData

class secondVcViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var myTable: UITableView!
    
    var userArray=[String]()

    override func viewDidLoad() {
        
        self.myTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.fetchData()
        self.myTable.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext=appDel.managedObjectContext
        
        do{
            let request=NSFetchRequest(entityName: "User")
            let results=try context.executeFetchRequest(request)
            
            for items in results as! [NSManagedObject]{
                
                let firstname=items.valueForKey("firstname") as! String
                let lastname=items.valueForKey("lastname") as! String
                
                self.userArray.append(firstname+" "+lastname)
            }
        }
        catch{
            print("Error while fetching")
            
        }
    }
    
    func numberOfSectionsInTableView(tableView:UITableView) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return self.userArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell=tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            as! UITableViewCell
        cell.textLabel?.text=self.userArray[indexPath.row]
        return cell
    }
}

 