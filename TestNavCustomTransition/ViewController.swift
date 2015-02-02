//
//  ViewController.swift
//  TestNavCustomTransition
//
//  Created by 卢大维 on 15/1/30.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    
    let datas = ["override", "UIViewControllerContextTransitioning", "UIStoryboardSegue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = datas[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            let controller = ViewController1()
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
        else if indexPath.row == 1 {
            let controller = ViewController2()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else if indexPath.row == 2 {
            let controller = ViewController3()
            
            let segue:SecondSegue = SecondSegue(identifier: "", source: self, destination: controller, performHandler: { () -> Void in
                
            })
            segue.perform()
        }
    }
}

