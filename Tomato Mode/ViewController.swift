//
//  ViewController.swift
//  Tomato Mode
//
//  Created by Oz Tamir on 6/12/14.
//  Copyright (c) 2014 Oz Tamir. All rights reserved.
//

// TODO: Rename this file to 'TimerViewController'

import Foundation
import UIKit
import QuartzCore

class ViewController: UIViewController, SFRoundProgressCounterViewDelegate, RNFrostedSidebarDelegate  {
    
    var screenHeight: CGFloat = 0
    var progView: SFRoundProgressCounterView!
    var remainLabel: UILabel!
    var sideMenu: RNFrostedSidebar!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.screenHeight = UIScreen.mainScreen().bounds.height
        
        // Set gradient Backgorund
        // TODO: Choose a final background and add ability to change it
        let firstColor = UIColor(red: 0.85, green: 0.94, blue: 0.91, alpha: 1)
        let secondColor = UIColor(red: 0.84, green: 0.95, blue: 0.95, alpha: 1)
        
        var gradient = CAGradientLayer()
        gradient.colors = [firstColor.CGColor, secondColor.CGColor]
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        // Setup frames for each subview
        let progFrame = CGRectMake(50.0, self.view.bounds.size.height / 4 , self.view.bounds.size.width - 100, self.view.bounds.size.width - 100)
        let remainingFrame = CGRectMake(0, 20 + self.view.bounds.size.width, self.view.bounds.size.width, self.view.bounds.size.height / 4)
        let menuBtnFrame = CGRectMake(0, 20, 50, 50)
        let exitBtnFrame = CGRectMake(self.view.bounds.size.width - 50, 20, 50, 50)
        let workCounterFrame = CGRectMake(0, self.view.bounds.size.height - 90, self.view.bounds.size.width / 2 - 0.5, 100)
        let breaksCounterFrame = CGRectMake(self.view.bounds.size.width / 2 + 0.5, self.view.bounds.size.height - 90, self.view.bounds.size.width / 2 - 0.5, 100)
        
        
        // Add the counter
        let progView = SFRoundProgressCounterView(frame: progFrame)
        progView.delegate = self
        var interval = 25.0 * 60000
        progView.intervals = [interval]
        self.progView = progView
        self.view.addSubview(self.progView)
        
        // Add the time label
        let remainLabel = UILabel(frame: remainingFrame)
        remainLabel.backgroundColor = UIColor.clearColor()
        remainLabel.text = "0 : 00"
        remainLabel.textAlignment = NSTextAlignment.Center
        remainLabel.font = UIFont(name: "HelveticaNeue-Light", size: 46)
        self.remainLabel = remainLabel
        self.view.addSubview(self.remainLabel)
        
        // Add menu button
        let menuButtonIcon = FAKIonIcons.naviconRoundIconWithSize(35.0)
        let menuButtonImg = menuButtonIcon.imageWithSize(CGSizeMake(35,35))
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = menuBtnFrame
        button.setImage(menuButtonImg, forState: UIControlState.Normal)
        button.addTarget(self, action: "menuButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        // Add exit button
        let exitButtonIcon = FAKIonIcons.logOutIconWithSize(35.0)
        let exitButtonImg = exitButtonIcon.imageWithSize(CGSizeMake(35,35))
        let exitButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        exitButton.frame = exitBtnFrame
        exitButton.setImage(exitButtonImg, forState: UIControlState.Normal)
        exitButton.addTarget(self, action: "exitButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(exitButton)
        
        // Add the period counters
        let workCounter = PastPeriodsView(frame: workCounterFrame, labelText: "Work Periods")
        self.view.addSubview(workCounter)
        
        let breaksCounter = PastPeriodsView(frame: breaksCounterFrame, labelText: "Break Periods")
        self.view.addSubview(breaksCounter)
        
        // Setup Icons for the sidebar
        let startIcon = FAKIonIcons.playIconWithSize(70.0)
        let pauseIcon = FAKIonIcons.pauseIconWithSize(70.0)
        let resetIcon = FAKIonIcons.refreshIconWithSize(70.0)
        
        let startImg = startIcon.imageWithSize(CGSizeMake(70,70))
        let pauseImg = pauseIcon.imageWithSize(CGSizeMake(70,70))
        let resetImg = resetIcon.imageWithSize(CGSizeMake(70,70))
        
        // Setup the sidebar
        let imgs = [startImg, pauseImg, resetImg]
        let sideMenu = RNFrostedSidebar(images: imgs)
        sideMenu.delegate = self
        self.sideMenu = sideMenu
        
        
    }
    
    func exitButtonAction(sender:UIButton!){
        //TODO: Actually quit
        println("I'm out")
    }
    
    func menuButtonAction(sender:UIButton!){
        self.sideMenu.show()
    }
    
    func sidebar(sidebar: RNFrostedSidebar!, didTapItemAtIndex index: Int){
        switch index{
        case 0:
            self.progView.resume()
            self.sideMenu.dismiss()
        case 1:
            self.progView.stop()
            self.sideMenu.dismiss()
        case 2:
            self.progView.reset()
            self.sideMenu.dismiss()
        default:
            break
        }
    }
        
}
