//
//  ViewController.swift
//  Tomato Mode
//
//  Created by Oz Tamir on 6/12/14.
//  Copyright (c) 2014 Oz Tamir. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, SFRoundProgressCounterViewDelegate  {
    
    var screenHeight: CGFloat = 0
    //var tableView: UITableView!
    //var progView: UAProgressView!
    var progView: SFRoundProgressCounterView!
    var remainLabel: UILabel!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.screenHeight = UIScreen.mainScreen().bounds.height
        self.view.backgroundColor = UIColor.redColor()
        
        // Setup frames for each subview
        let progFrame = CGRectMake(50.0, self.view.bounds.size.height / 4 , self.view.bounds.size.width - 100, self.view.bounds.size.width - 100)
        
        let remainingFrame = CGRectMake(0, 20 + self.view.bounds.size.width, self.view.bounds.size.width, self.view.bounds.size.height / 4)
        
        //let
        
        
        // Add the counter
//        let progView = UAProgressView(frame: progFrame)
//        progView.setProgress(0.5, animated: true)
//        self.progView = progView
//        self.view.addSubview(self.progView)
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
        
        
        
        
        
        
        
        
        
        
        
        
    }
        
}
