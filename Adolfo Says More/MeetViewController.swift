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
        
        state["title"] = "Adolfo in the week"
        state["image"] = "adolfo-day.png"
        state["slogan"] = "Monday to Thursday"
        stateList.append(state)
        
        state["title"] = "Adolfo at weekend"
        state["image"] = "adolfo-night.png"
        state["slogan"] = "Then on Friday"
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
            
            setNextImage()
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                
                imageView.image = UIImage(named: stateToShow["image"]!)
                self.title = stateToShow["title"]
                self.sloganLabel.text = stateToShow["slogan"]
                //println("Swiped right")
                
            case UISwipeGestureRecognizerDirection.Left:
                
                imageView.image = UIImage(named: stateToShow["image"]!)
                self.title = stateToShow["title"]
                self.sloganLabel.text = stateToShow["slogan"]
                
            default:
                break
            }
        }
        
        
    }
    
    func setNextImage(){
        
        if currentState == 0 {
            
            currentState = 1
            
        } else if currentState == 1 {
            
            currentState = 0
        }
            
        stateToShow["title"] = stateList[currentState]["title"]
        stateToShow["image"] = stateList[currentState]["image"]
        stateToShow["slogan"] = stateList[currentState]["slogan"]
        
    }
    
    

}
