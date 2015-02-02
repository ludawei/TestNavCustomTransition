//
//  SecondSegueUnwind.swift
//  CustomSegues
//
//  Created by 卢大维 on 15/1/29.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit

class SecondSegueUnwind: UIStoryboardSegue {
    override func perform() {
        var firstVCView = destinationViewController.view as UIView!
        var thirdVCView = sourceViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
        firstVCView.transform = CGAffineTransformScale(firstVCView.transform, 0.001, 0.001)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: thirdVCView)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
            thirdVCView.frame = CGRectOffset(thirdVCView.frame, 0.0, -screenHeight)
            
            firstVCView.transform = CGAffineTransformIdentity
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in ()
                
//                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
                (self.sourceViewController as UIViewController).navigationController?.popViewControllerAnimated(false)
        }
    }
}
