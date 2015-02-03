//
//  SecondSegue.swift
//  CustomSegues
//
//  Created by 卢大维 on 15/1/29.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit

class SecondSegue: UIStoryboardSegue {

    override func perform() {
        var firstVCView = sourceViewController.view as UIView!
        var thirdVCView = destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(thirdVCView, belowSubview: firstVCView)
        
        thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            firstVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
            
            }) { (Finished) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    thirdVCView.transform = CGAffineTransformIdentity
                    
                    }, completion: { (Finished) -> Void in
                        
                        firstVCView.transform = CGAffineTransformIdentity

                        if self.sourceViewController.isKindOfClass(UINavigationController.self)
                        {
                            self.sourceViewController.pushViewController(self.destinationViewController as UIViewController, animated: false)
                        }
                        else
                        {
                            self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
                        }
                        
                })
        }
    }
}
