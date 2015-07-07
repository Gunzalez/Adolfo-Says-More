//
//  CardViewController.swift
//  Adolfo Says More
//
//  Created by Segun Konibire on 02/07/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    var card: String!
    
    var hideOverride = defaultMeans
    
    var tempMeaning: String!
    
    @IBOutlet var cardLabel: UILabel!
    
    @IBOutlet var meansLabel: UILabel!
    
    @IBOutlet var bailButton: UIButton!
    
    @IBAction func bailOutButtonPressed(sender: AnyObject) {
        
        var textOfButtonPressed = bailButton.titleLabel!.text
        
        if textOfButtonPressed == "Hide" {
            
            bailButton.setTitle("Show", forState: UIControlState.Normal)
            
            meansLabel.text = replaceStoryPoints(hideOverride)
            
        } else {
            
            meansLabel.text = replaceStoryPoints(tempMeaning)
            
            bailButton.setTitle("Hide", forState: UIControlState.Normal)
        }
        
    }
    
    
    @IBAction func donePressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
        
    }
    
    
    func replaceStoryPoints(meaning: String) -> String {
        
        var theCard = " " + card + " "
        
        var newString = meaning.stringByReplacingOccurrencesOfString(" # ", withString: theCard)
        
        return newString
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
   
        cardLabel.text = card
        
        var favourites = [Array<String>]()
        
        if adolfoMeans.count > 0 {
            
            hideOverride = adolfoMeans[0][0]
            
            for singleMeaning in adolfoMeans {
                
                if singleMeaning[1] == "yes" {
                    
                    favourites.append(singleMeaning)
                    
                }
                
            }
            
            if favourites.isEmpty {
                
                favourites = adolfoMeans
                
            }
            
            var randomNumber = Int(arc4random_uniform(UInt32(favourites.count)))
            
            meansLabel.text = replaceStoryPoints(favourites[randomNumber][0])
            
            tempMeaning = favourites[randomNumber][0]
            
            
        } else {
            
            meansLabel.text = replaceStoryPoints(defaultMeans)
            
            tempMeaning = defaultMeans
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}
