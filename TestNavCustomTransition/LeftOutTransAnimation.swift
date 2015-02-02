//
//  LeftOutTransAnimation.swift
//  TestNavCustomTransition
//
//  Created by 卢大维 on 15/1/30.
//  Copyright (c) 2015年 weather. All rights reserved.
//

import UIKit

extension UIView {
    func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func y() -> CGFloat {
        return self.frame.origin.x
    }
    
    func width() ->CGFloat {
        return self.frame.size.width
    }
    
    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    func setX(newX:CGFloat) {
        var frame  = self.frame;
        frame.origin.x = newX;
        self.frame = frame;
    }
    
    func setY(newY:CGFloat) {
        var frame  = self.frame;
        frame.origin.y = newY;
        self.frame = frame;
    }
    
    func setWidth(newWidth:CGFloat) {
        var frame  = self.frame;
        frame.size.width = newWidth;
        self.frame = frame;
    }
    
    func setHeight(newHeight:CGFloat) {
        var frame  = self.frame;
        frame.size.height = newHeight;
        self.frame = frame;
    }
}

class LeftOutTransAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let from = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let to = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        transitionContext.containerView().addSubview(to!.view)
        
        let screenSize = UIScreen.mainScreen().bounds.size
        let finalFrame = transitionContext.finalFrameForViewController(to!)
        to?.view.frame = CGRectOffset(finalFrame, 0, -screenSize.height)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            ()
            to?.view.frame = finalFrame;
            from?.view.setY(from!.view.y() + from!.view.height())
            
        }) { (finished) -> Void in
            from?.view.setY(0)
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
