//
//  ViewController.swift
//  504Words
//
//  Created by MAC os on 1/31/21.
//

import UIKit
import UserNotifications
import Hero
class ViewController: UIViewController {
    @IBOutlet weak var bottonView: UIView!
    
    @IBOutlet weak var Lessons: UIButton!
    @IBOutlet weak var Quiz: UIButton!
    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleNotification()
        
        setGradiant2(viewprime: Lessons, Red: 43/255.0, Green: 88/255.0, Blue: 118/255.0)
        setGradiant2(viewprime: Quiz, Red: 151/255.0, Green: 150/255.0, Blue: 212/255.0)
    }
    
    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "wanna know another words today"
        content.body = "chech todays lesson"
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }
 
    func setGradiant2(viewprime : UIButton , Red: CGFloat , Green: CGFloat , Blue: CGFloat ){
        let colorTop =  UIColor(red:Red, green: Green, blue: Blue, alpha: 1.0).cgColor
        let colorBottom = UIColor(red:Green, green: 14.0/255.0, blue: Green, alpha: 1.0).cgColor
        //
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewprime.bounds
        viewprime.layer.cornerRadius = 20
        viewprime.layer.masksToBounds = true
         UIView.animate(withDuration: 2,delay:0, animations: {
            viewprime.layer.insertSublayer(gradientLayer, at:0)
            viewprime.alpha = 1
            
            viewprime.frame.origin.x = -300
            
        }
        )
        
    }
}
