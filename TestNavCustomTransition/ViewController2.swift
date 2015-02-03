//
//  ViewController2.swift
//  TestNavCustomTransition
//
//  Created by 卢大维 on 15/2/2.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func click() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.yellowColor()
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.view.backgroundColor = UIColor.purpleColor()
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.navigationController == nil {
            let button = UIButton(frame: CGRectMake(30, 100, 100, 30))
            button.setTitle("button", forState: UIControlState.Normal)
            button.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
