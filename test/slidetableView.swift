//
//  slidetableView.swift
//  test
//
//  Created by Bossxuan on 16/11/28.
//  Copyright © 2016年 Bossxuan. All rights reserved.
//

import UIKit

class slidetableView: UIView {
    var tableView : UITableView!
    
    var isshow : Bool = false
    fileprivate var gesture : UITapGestureRecognizer!     /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    init(frame: CGRect,delegate : UIViewController) {
        super.init(frame: frame)
        self.center = CGPoint(x: -self.frame.width / 2 + 10, y: self.frame.height / 2)
        self.backgroundColor = UIColor.clear
        tableView = UITableView()
        tableView.delegate = delegate as! UITableViewDelegate
        tableView.dataSource = delegate as! UITableViewDataSource
        self.addSubview(tableView!)
        self.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: "gesturehappen:"))
        gesture = UITapGestureRecognizer(target: self, action: "needCancel:")

        
    }
    override func layoutSubviews() {
        tableView.frame = CGRect(x: -self.frame.width , y: 0  , width: self.frame.width, height: self.frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func gesturehappen(_ sender : UISwipeGestureRecognizer)
    {
        if !isshow
        {
            if sender.direction == .right
            {
               
                    UIView.animate(withDuration: 0.5, animations: {self.tableView.center.x = self.frame.width / 2
                        self.center.x = self.frame.width / 2
                    }, completion: {(_) in
                        self.superview?.addGestureRecognizer(self.gesture)
                        
                        self.isshow = true
                    })
                
            }
            
        }
    }
    func needCancel(_ sender : UITapGestureRecognizer)
    {
        let rect = convert(self.frame, to: self.superview)
        if !rect.contains(sender.location(in: self.superview))
        {
           if isshow
           {
            UIView.animate(withDuration: 0.5, animations: {self.tableView.center.x = -self.frame.width / 2
                self.center.x = -self.frame.width / 2 + 10}, completion: {(_) in self.isshow = false
                self.superview?.removeGestureRecognizer(self.gesture)
            })
            }
        }
    }

}
