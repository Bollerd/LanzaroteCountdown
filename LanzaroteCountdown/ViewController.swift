//
//  ViewController.swift
//  LanzaroteCountdown
//
//  Created by Dirk Boller on 15.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
  
    var images:[BackgroundImage] = []
    var currentImage = 0
    let maxImage = 4
    var timeCalc = TimeCalculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeImages()
        
        var timer = NSTimer()
        var imgReset = NSTimer()
  
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("timeUntilDeparture"), userInfo: nil, repeats: true)
        
        imgReset = NSTimer.scheduledTimerWithTimeInterval(10.0, target:self, selector: Selector("changeBackground"), userInfo: nil, repeats: true)
        
        setBadgeIcon()
        //setCountdownPosition()     "currently not used as not working
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setCountdownPosition() {
        var bounds: CGRect = UIScreen.mainScreen().bounds
        var width:CGFloat = bounds.size.width
        var height:CGFloat = bounds.size.height
        println( "\(width)" )
        println( "\(height)" )
        countDownLabel.center = CGPoint(x: width * 1.0 / 2.0, y: height - 350.0)
    }
    
    func setBadgeIcon() {
        let settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)

        let application = UIApplication.sharedApplication()
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound | UIUserNotificationType.Alert |
            UIUserNotificationType.Badge, categories: nil
            ))
        
        computeDateTime()
        application.applicationIconBadgeNumber = timeCalc.day
    }
    
    func changeBackground() {
        if self.currentImage < self.maxImage
        {
            self.currentImage = self.currentImage + 1
        }
        else
        {
            self.currentImage = 0
        }
        self.image.image = self.images[currentImage].image
        self.headerLabel.textColor = self.images[currentImage].titleColor
        self.countDownLabel.textColor = self.images[currentImage].counterColor
        self.headerLabel.text = self.images[currentImage].title
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
            {
                self.image.image = self.images[self.currentImage].image
                
            }, completion: { (finished: Bool) -> () in
        })
    }
    
    func timeUntilDeparture() {
        computeDateTime()
        var output = ""
        
        if timeCalc.year > 1 {
            output = "\(timeCalc.year) Jahre "
        } else if timeCalc.year == 1 {
           output = "\(timeCalc.year) Jahr "
        }
        
        if timeCalc.month > 1 {
            output = checkEmpty(output) + "\(timeCalc.month) Monate "
        } else if timeCalc.month == 1 {
            output =  checkEmpty(output) + "\(timeCalc.month) Monat "
        }
        
        if timeCalc.day > 1 {
            output = checkEmpty(output)
+ "\(timeCalc.day) Tage "
        } else if timeCalc.year == 1 {
            output =  checkEmpty(output)
+ "\(timeCalc.year) Tag "
        }
        
        if timeCalc.hour > 1 {
            output = checkEmpty(output)
 + "\(timeCalc.hour) Stunden "
        } else if timeCalc.hour == 1 {
            output =  checkEmpty(output)
+ "\(timeCalc.hour) Stunde "
        }
        
        if timeCalc.minute > 1 {
            output = checkEmpty(output) + "\(timeCalc.minute) Minuten "
        } else if timeCalc.minute == 1 {
             output = checkEmpty(output) + "\(timeCalc.minute) Minute "
        }
        
        if timeCalc.second > 1 {
            output = checkEmpty(output) + "\(timeCalc.second) Sekunden "
        } else if timeCalc.second == 1 {
            output =  checkEmpty(output) + "\(timeCalc.second) Sekunde "
        }
        
        countDownLabel.text = output
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
    
    func initializeImages() {
        // create my background images
        var img1 = BackgroundImage()
        img1.title = "Los Hervideros"
        img1.counterColor = UIColor.blackColor()
        img1.titleColor = UIColor.blackColor()
        img1.image = UIImage(named:"brandung.jpg")
        images.append(img1)
        
        var img2 = BackgroundImage()
        img2.title = "Weinreben"
        img2.counterColor = UIColor.blackColor() //UIColor.whiteColor()
        img2.titleColor = UIColor.blackColor() //UIColor.whiteColor()
        img2.image = UIImage(named:"winreben.jpg")
        images.append(img2)
        
        var img3 = BackgroundImage()
        img3.title = "Timanfaya"
        img3.counterColor = UIColor.blackColor() //UIColor.whiteColor()
        img3.titleColor = UIColor.blackColor() //UIColor.whiteColor()
        img3.image = UIImage(named:"vulkan.jpg")
        images.append(img3)
        
        var img4 = BackgroundImage()
        img4.title = "Jameo del Aqua"
        img4.counterColor = UIColor.blackColor()
        img4.titleColor = UIColor.blackColor() // UIColor.whiteColor()
        img4.image = UIImage(named:"jameo.jpg")
        images.append(img4)
        
        var img5 = BackgroundImage()
        img5.title = "El Golfo"
        img5.counterColor = UIColor.blackColor() //UIColor.whiteColor()
        img5.titleColor = UIColor.blackColor()
        img5.image = UIImage(named:"el_golfo.jpg")
        images.append(img5)
    }
    
    func checkEmpty(piv_input:String) -> String {
        var output = piv_input
        
        if output != "" {
            output += "\n"
        }
        return output
    }
    
}

