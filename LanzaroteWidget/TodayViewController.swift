//
//  TodayViewController.swift
//  LanzaroteWidget
//
//  Created by Dirk Boller on 20.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var counterWidgetLabel: UILabel!
    
    var timeCalc = CountdownTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        timeCalc.initTimer()
        
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("timeUntilDeparture"), userInfo: nil, repeats: true)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func timeUntilDeparture() {
        var output = ""
        
        if timeCalc.year > 0 {
            output = "\(timeCalc.year) Jh "
        }
        
        if timeCalc.month > 0 {
            output = checkEmpty(output) + "\(timeCalc.month) Mt "
        }
        
        if timeCalc.day > 0 {
            output = checkEmpty(output)
                + "\(timeCalc.day) Tg "
        }
        
        if timeCalc.hour > 0 {
            output = checkEmpty(output)
                + "\(timeCalc.hour) Std "
        }
        
        if timeCalc.minute > 0 {
            output = checkEmpty(output) + "\(timeCalc.minute) Min "
        }
        
        if timeCalc.second > 0 {
            output = checkEmpty(output) + "\(timeCalc.second) Sek "
        }
        
        counterWidgetLabel.text = output
    }
    
    func checkEmpty(piv_input:String) -> String {
        var output = piv_input
        
        if output != "" {
            output += ""
        }
        return output
    }
}
