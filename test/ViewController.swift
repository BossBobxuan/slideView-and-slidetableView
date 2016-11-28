//
//  ViewController.swift
//  test
//
//  Created by Bossxuan on 16/11/25.
//  Copyright © 2016年 Bossxuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
        {
            didSet
            {
                tableview.backgroundColor = UIColor.blue
                tableview.delegate = self
                tableview.dataSource = self
                tableview.isScrollEnabled = false
            }
        }
 

    @IBAction func click(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            
            self.tableview.center = CGPoint(x: 50, y: self.view.frame.height / 2)
            self.isshow = true
        })
    }
    var isgo = false // 侧栏是否处于移动状态
    var isshow = false //侧栏是否已经展示
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        layout()
        NotificationCenter.default.addObserver(self, selector: "screenchange:", name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    func screenchange(_ notification: NSNotification)
    {
        layout()
        tableview.reloadData()
    }
    func layout()
    {
        tableview.frame = CGRect(x: -100, y: 0, width: 100, height: self.view.frame.height - 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            if !tableview.frame.contains(touch.location(in: self.view))
            {
                if isshow
                {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.tableview.center = CGPoint(x: -50, y: self.view.frame.height / 2)
                    })
                    isgo = false
                    isshow = false
                }
            }
            if touch.location(in: self.view).x < 10
            {
                if !isshow
                {
                    print("ok")
                    isgo = true
                }
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            if isgo
            {
                if touch.location(in: self.view).x < 100
                {
                    self.tableview.center = CGPoint(x: touch.location(in: self.view).x - 50, y: self.view.frame.height / 2)
                    isshow = true
                    
                }
            
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isshow
        {
            if self.tableview.center.x < 50
            {
                let time = (50 - self.tableview.center.x) / 200
                UIView.animate(withDuration: TimeInterval(time), animations: {
                     self.tableview.center = CGPoint(x: 50, y: self.view.frame.height / 2)
                })
            }
        }
        isgo = false
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "basic", for: indexPath) as! basicTableViewCell
        let url = Bundle.main.path(forResource: "DeitelBlue", ofType: "png", inDirectory: nil)
//        cell.imageview?.image = UIImage(named: "DeitelBlue.png")
        cell.imageview?.image = UIImage(contentsOfFile: url!)
        print(indexPath.row)
        if indexPath.row == 0
        {
            cell.btn.setTitle("222", for: .normal)
        }else
        {
            cell.btn.setTitle("111", for: .normal)
        }
        
        cell.btn.addTarget(self, action: "btndown:", for: .touchUpInside)
        if indexPath.row > 0
        {
            print((cell.btn.target(forAction: "btndown:", withSender: nil) as! ViewController).isshow)
        }
//        let btn = UIButton(type: .system)
//        btn.frame = cell.contentView.frame
//            
//        btn.setTitle("click", for: .normal)
//        
//        cell.contentView.addSubview(btn)
//        cell.addSubview(btn)
        
        return cell
    }
    func btndown(_ sender: UIButton)
    {
        if sender.currentTitle == "222"
        {
            print("segue")
            performSegue(withIdentifier: "123", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return 6
      
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6
    }
    
    
}

