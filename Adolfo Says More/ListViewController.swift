//
//  ListViewController.swift
//  Adolfo Says More
//
//  Created by Segun Konibire on 02/07/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    @IBOutlet var addBarItem: UIBarButtonItem!
    
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return adolfoMeans.count
    
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = adolfoMeans[indexPath.row][0]
        
        if adolfoMeans[indexPath.row][1] == "yes" {
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
        } else {
            
            cell.accessoryType = UITableViewCellAccessoryType.None
            
        }
        
        return cell
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "editItem") {
            
            var navController = segue.destinationViewController as! UINavigationController
            
            var viewController = navController.topViewController as! ItemViewController
            
            var selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
            
            viewController.meaningIndex = selectedIndex!.row
            
            viewController.navigationItem.title = "Edit"
            
        }
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        if adolfoMeans.count >= maxMeaning {
            
            self.addBarItem.enabled = false
            
        } else {
            
            self.addBarItem.enabled = true
            
        }
        
        self.tableView.reloadData()
        
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            adolfoMeans.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(adolfoMeans, forKey: "adolfoMeans");
            
            if adolfoMeans.count >= maxMeaning {
                
                self.addBarItem.enabled = false
                
            } else {
                
                self.addBarItem.enabled = true
                
            }
            
            self.tableView.reloadData()
            
        }
    }



    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    


}
