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
    
    var timeCalc = TimeCalculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
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
        computeDateTime()
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
    
    func computeDateTime() {
        let flightDate = NSCalendar.currentCalendar().dateWithEra(1, year: 2015, month: 3, day: 29, hour: 8, minute: 35, second: 0, nanosecond: 0)
        let nowDate = NSDate()
        
        let components = NSCalendar.currentCalendar().components(.CalendarUnitSecond |
            .CalendarUnitMinute | .CalendarUnitHour | .CalendarUnitDay |
            .CalendarUnitMonth | .CalendarUnitYear, fromDate: nowDate,
            toDate: flightDate!, options: nil)
        
        timeCalc.second = components.second
        timeCalc.minute = components.minute
        timeCalc.hour = components.hour
        timeCalc.day = components.day
        timeCalc.month = components.month
        timeCalc.year = components.year
    }
    
    func checkEmpty(piv_input:String) -> String {
        var output = piv_input
        
        if output != "" {
            output += ""
        }
        return output
    }
}
