//
//  MeetViewController.swift
//  Adolfo Says More
//
//  Created by Segun Konibire on 14/07/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class MeetViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var sloganLabel: UILabel!
    
    var state: Dictionary<String, String> = [:]
    
    var stateToShow: Dictionary<String, String> = [:]
    
    var stateList: Array<Dictionary<String,String>> = []
    
    var currentState: Int! = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        state["title"] = "Adolfo by day"
        state["image"] = "adolfo-day.png"
        state["slogan"] = "Monday to Thursday..."
        stateList.append(state)
        
        state["title"] = "Adolfo at night"
        state["image"] = "adolfo-night.png"
        state["slogan"] = "...but then on Friday"
        stateList.append(state)
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                
                imageView.image = UIImage(named: stateList[0]["image"]!)
                self.sloganLabel.text = stateList[0]["slogan"]
                self.navigationItem.title = stateList[0]["title"]
                
            case UISwipeGestureRecognizerDirection.Left:
                
                imageView.image = UIImage(named: stateList[1]["image"]!)
                self.sloganLabel.text = stateList[1]["slogan"]
                self.navigationItem.title = stateList[1]["title"]
                
            default:
                break
            }
        }
        
        
    }

}
