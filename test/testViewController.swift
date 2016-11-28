//
//  testViewController.swift
//  test
//
//  Created by Bossxuan on 16/11/28.
//  Copyright © 2016年 Bossxuan. All rights reserved.
//

import UIKit

class testViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var slidetableview : slidetableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        slidetableview = slidetableView(frame: CGRect(x:0 , y: 0,width: 100 , height : self.view.frame.height), delegate: self)
        
        // Do any additional setup after loading the view.
        
        let slideview = slideView(height: self.view.frame.height, numberofview: 3)
        slideview.containerviews[0].backgroundColor = UIColor.blue
        slideview.containerviews[1].backgroundColor = UIColor.black
        self.view.addSubview(slideview)
        self.view.addSubview(slidetableview)
        
            
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = slidetableview.tableView.dequeueReusableCell(withIdentifier: "aaa")
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "aaa")
            return cell!
        }
        return cell!
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
