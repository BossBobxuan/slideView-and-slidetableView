//
//  scrollViewController.swift
//  test
//
//  Created by Bossxuan on 16/11/25.
//  Copyright © 2016年 Bossxuan. All rights reserved.
//

import UIKit
import UserNotifications

class scrollViewController: UIViewController {
    fileprivate let key : [String] = ["全部","户外","室内","安静","激烈"]
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var controllview: UIScrollView!
    
    @IBAction func swipeleft(_ sender: UISwipeGestureRecognizer)
    {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.controllview.contentOffset = CGPoint(x: self.view.frame.width, y: 0)
            
        }){
            (isok) in self.segment.selectedSegmentIndex = 1
          }
    
        
    }
    @IBAction func swiperight(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.controllview.contentOffset = CGPoint(x: 0, y: 0)
            
        }){
            (isok) in self.segment.selectedSegmentIndex = 0
          }
    }
    
    func sendnotification()
    {
        self.registerNotification(10)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< 5
        {
            let btn = UIButton(type: .system)
            btn.frame = CGRect(x: CGFloat(i * 60 + i * 10), y: scroll.bounds.origin.y, width: 60, height: scroll.frame.size.height)
            btn.setTitle(key[i], for: .normal)
            if btn.currentTitle == key[3]
            {
                btn.addTarget(self, action: "sendnotification", for: .touchUpInside)
            }
            scroll.addSubview(btn)
        }
        firstView.frame = CGRect(x: 0, y: 0, width: controllview.frame.width, height: controllview.frame.height)
        secondView.frame = CGRect(x: controllview.frame.width, y: 0, width: controllview.frame.width, height: controllview.frame.height)
        controllview.contentSize = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height)
        scroll.contentSize = CGSize(width: 350, height: scroll.frame.size.height)
        segment.selectedSegmentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotification(_ alerttime: TimeInterval) -> Void {
        let center = UNUserNotificationCenter.current()
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "test", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "body", arguments: nil)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: alerttime, repeats: false)
        let request = UNNotificationRequest(identifier: "testnotification", content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: {(error)  in })
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
