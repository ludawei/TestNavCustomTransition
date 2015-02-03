//
//  ViewController.swift
//  TestNavCustomTransition
//
//  Created by 卢大维 on 15/1/30.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    
    let datas = ["override+push", "UIViewControllerContextTransitioning+push", "UIStoryboardSegue+push", "UIStoryboardSegue+pres", "UIViewControllerContextTransitioning+pres", "override+pres"]
    
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
            
            let segue:SecondSegue = SecondSegue(identifier: "", source: self.navigationController!, destination: controller, performHandler: { () -> Void in
                
            })
            segue.perform()
        }
        else if(indexPath.row == 3)
        {
            let controller = ViewController3()
            
            let segue:SecondSegue = SecondSegue(identifier: "", source: self, destination: controller, performHandler: { () -> Void in
                
            })
            segue.perform()
        }
        else if(indexPath.row == 4)
        {
            let controller = ViewController2()
            controller.transitioningDelegate = self
            controller.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.presentViewController(controller, animated: true, completion: { () -> Void in
                
            })
        }
        else if(indexPath.row == 5)
        {
            let controller = ViewController1()
            controller.modalPresentationStyle = UIModalPresentationStyle.Custom
            self.presentViewController(controller, animated: true, completion: { () -> Void in
                
            })
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (presented.isKindOfClass(ViewController2.self)) {
            return LeftOutTransAnimation();
        }
        return nil;
    }
    
    override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        if viewControllerToPresent.isKindOfClass(ViewController1.self)
        {
            if flag {
                let from = self
                let to = viewControllerToPresent
                
                UIApplication.sharedApplication().keyWindow?.addSubview(to.view)
                to.view.alpha = 0.0
                
                let duration = 0.5
                
                UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    to.view.alpha = 1.0
                    from.view.alpha = 0.0
                    }) { (finished) -> Void in
                        
                        self.myFunc(viewControllerToPresent, completion: { () -> Void in
                            to.view.removeFromSuperview()
                        })
                        from.view.alpha = 1.0
                }
            }
        }
        else
        {
            super.presentViewController(viewControllerToPresent, animated: flag, completion: nil)
        }
    }
    
    func myFunc(viewControllerToPresent: UIViewController, completion: (() -> Void)?)
    {
        super.presentViewController(viewControllerToPresent, animated: false, completion: nil)
    }
}

