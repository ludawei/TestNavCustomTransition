//
//  NavController.swift
//  TestNavCustomTransition
//
//  Created by 卢大维 on 15/1/30.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit

class NavController: UINavigationController, UINavigationControllerDelegate {
    
    var leftOut:LeftOutTransAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.leftOut = LeftOutTransAnimation()
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewController.isKindOfClass(ViewController1.self)
        {
            if animated {
                let from = self.topViewController
                let to = viewController
                
//                let screenSize = UIScreen.mainScreen().bounds.size
//                let finalFrame = to.view.frame
                
//                to.view.frame = CGRectOffset(finalFrame, -screenSize.width, 0)
                to.view.alpha = 0
                
                let duration = 0.3
                
                let weakSuper: Void = super.pushViewController(viewController, animated: false)
                UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                    to.view.frame = finalFrame;
//                    from?.view.setX(from!.view.x() + from!.view.width()/2)
                    to.view.alpha = 1.0
                    from.view.alpha = 0.0
                    }) { (finished) -> Void in
                        weakSuper
                        from.view.alpha = 1.0
                }
            }
        }
        else
        {
            super.pushViewController(viewController, animated: animated)
        }
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (toVC.isKindOfClass(ViewController2.self) && operation == UINavigationControllerOperation.Push) {
            return leftOut;
        }
        return nil;
    }
}
