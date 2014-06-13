//
//  PastPeriodsView.swift
//  Tomato Mode
//
//  Created by Oz Tamir on 6/13/14.
//  Copyright (c) 2014 Oz Tamir. All rights reserved.
//

import UIKit

class PastPeriodsView: UIView {
    
    var counterLabel: UILabel!
    var label: UILabel!
    var prog: M13ProgressViewSegmentedBar!
    
    init(frame: CGRect, labelText: String) {
        super.init(frame: frame)
        // Initialization code
        
        // Setup frames for subviews
        let progFrame = CGRectMake((frame.width - 50) / 4, 60, (frame.width + 50) / 2, 20)
        let labelFrame = CGRectMake(0, 35, frame.width, 20)
        let counterLabelFrame = CGRectMake(0, 5, frame.width, 30)
        
        // Set background color
        self.backgroundColor = UIColor(red: 0.95, green: 0.69, blue: 0.69, alpha: 1.0)
        
        // Add counter bar
        let prog = M13ProgressViewSegmentedBar(frame: progFrame)
        prog.setProgress(0.0, animated: true)
        self.prog = prog
        self.addSubview(self.prog)
        
        // Add label
        let label = UILabel(frame: labelFrame)
        label.text = labelText
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        self.label = label
        self.addSubview(self.label)
        
        // Add the counter label
        let counterLabel = UILabel(frame: counterLabelFrame)
        counterLabel.text = "0 / 1"
        counterLabel.backgroundColor = UIColor.clearColor()
        counterLabel.textAlignment = NSTextAlignment.Center
        counterLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        self.counterLabel = counterLabel
        self.addSubview(self.counterLabel)
        
    }

}
