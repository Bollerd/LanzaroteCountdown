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
    var timeCalc = CountdownTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeImages()
        timeCalc.initTimer()
        
        var timer = Timer()
        var imgReset = Timer()
  
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(ViewController.timeUntilDeparture), userInfo: nil, repeats: true)
        imgReset = Timer.scheduledTimer(timeInterval: 10.0, target:self, selector: #selector(ViewController.changeBackground), userInfo: nil, repeats: true)
        
        setBadgeIcon()
        //setCountdownPosition()     "currently not used as not working
    }

   /*
    // tried to set position dynamically, but didn't worked. So currently removed
    func setCountdownPosition() {
        var bounds: CGRect = UIScreen.mainScreen().bounds
        var width:CGFloat = bounds.size.width
        var height:CGFloat = bounds.size.height
        println( "\(width)" )
        println( "\(height)" )
        countDownLabel.center = CGPoint(x: width * 1.0 / 2.0, y: height - 350.0)
    }
    */
    
    func setBadgeIcon() {
        let settings = UIUserNotificationSettings(types: UIUserNotificationType.badge, categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)

        let application = UIApplication.shared
        
    //    application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [UIUserNotificationType.Badge, UIUserNotificationType.Alert, UIUserNotificationType.Sound], categories: nil))  -> SWIFT 3 UPGRAGE - seems not required
        application.applicationIconBadgeNumber = timeCalc.totalDays
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
        
        UIView.transition(with: self.view, duration: 2, options: UIViewAnimationOptions.transitionCrossDissolve, animations:
            {
                self.image.image = self.images[self.currentImage].image
                
            }, completion: { (finished: Bool) -> () in
        })
    }
    
    func timeUntilDeparture() {
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
            output = checkEmpty(output) + "\(timeCalc.day) Tage "
        } else if timeCalc.year == 1 {
            output =  checkEmpty(output) + "\(timeCalc.year) Tag "
        }
        
        if timeCalc.hour > 1 {
            output = checkEmpty(output) + "\(timeCalc.hour) Stunden "
        } else if timeCalc.hour == 1 {
            output =  checkEmpty(output) + "\(timeCalc.hour) Stunde "
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
    
    func initializeImages() {
        // create my background images
        var img1 = BackgroundImage()
        img1.title = "Los Hervideros"
        img1.counterColor = UIColor.black
        img1.titleColor = UIColor.black
        img1.image = UIImage(named:"brandung.jpg")
        images.append(img1)
        
        var img2 = BackgroundImage()
        img2.title = "Weinreben"
        img2.counterColor = UIColor.black //UIColor.whiteColor()
        img2.titleColor = UIColor.black //UIColor.whiteColor()
        img2.image = UIImage(named:"winreben.jpg")
        images.append(img2)
        
        var img3 = BackgroundImage()
        img3.title = "Timanfaya"
        img3.counterColor = UIColor.black //UIColor.whiteColor()
        img3.titleColor = UIColor.black //UIColor.whiteColor()
        img3.image = UIImage(named:"vulkan.jpg")
        images.append(img3)
        
        var img4 = BackgroundImage()
        img4.title = "Jameo del Aqua"
        img4.counterColor = UIColor.black
        img4.titleColor = UIColor.black // UIColor.whiteColor()
        img4.image = UIImage(named:"jameo.jpg")
        images.append(img4)
        
        var img5 = BackgroundImage()
        img5.title = "El Golfo"
        img5.counterColor = UIColor.black //UIColor.whiteColor()
        img5.titleColor = UIColor.black
        img5.image = UIImage(named:"el_golfo.jpg")
        images.append(img5)
    }
    
    func checkEmpty(_ piv_input:String) -> String {
        var output = piv_input
        
        if output != "" {
            output += "\n"
        }
        return output
    }
    
}

