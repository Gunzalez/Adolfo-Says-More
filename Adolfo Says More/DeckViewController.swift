//
//  FirstViewController.swift
//  Adolfo Says More
//
//  Created by Segun Konibire on 02/07/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

var adolfoMeans = [Array<String>]()

let defaultMeans = "Adolfo thinks you should add stuff to the list."

let maxMeaning: Int = 20

class DeckViewController: UIViewController {
    
    var card: String!
    
    
    @IBAction func cardTapped(sender: AnyObject) {
        
        var button = sender as! UIButton
        
        card = button.titleLabel?.text;
        
        performSegueWithIdentifier("showCard", sender: sender)
                
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showCard") {
            
            var viewController = segue.destinationViewController as! CardViewController
            
            viewController.card = card
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //NSUserDefaults.standardUserDefaults().removeObjectForKey("adolfoMeans") // TODO REMOVE
        
        if NSUserDefaults.standardUserDefaults().objectForKey("adolfoMeans") != nil {
            
            adolfoMeans = NSUserDefaults.standardUserDefaults().objectForKey("adolfoMeans") as! [Array<String>];
            
        } else {
            
            var newMeaning = [String]()
            newMeaning.append("I would rather be at home watching Game of Thrones")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("Actually, I have no idea but I just said that so I don't look stupid")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("Er, I wasn't actually listening but 8 is as good as any")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("I've done this many times before, and this is an accurate estimate")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
            newMeaning.removeAll()
            newMeaning.append("Where am I, what am I doing here, who are these people?")
            newMeaning.append("no")
            adolfoMeans.append(newMeaning)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

}

