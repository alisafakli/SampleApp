//
//  Utilities.swift
//  SampleApp
//
//  Created by Ali Safakli on 12/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit


class Utilities {
    static let shared = Utilities()
    
    //Lock screen with activity indicator
    func lockScreen() {
        DispatchQueue.main.async {
            let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
            actInd.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
            actInd.center = (UIApplication.shared.keyWindow?.center)!
            actInd.hidesWhenStopped = true
            actInd.activityIndicatorViewStyle =
                UIActivityIndicatorViewStyle.whiteLarge
            UIApplication.shared.keyWindow?.addSubview(actInd)
            actInd.startAnimating()
        }
    }
    
    //Remove lock screen
    func unlockScreen() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                for sub in window.subviews {
                    if sub is  UIActivityIndicatorView {
                        sub.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    //Show alert
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    //Move background image with screen motion
    func moveBackground(vw: UIView) {
        let movement = 300
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -movement
        horizontal.maximumRelativeValue = movement
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -movement
        vertical.maximumRelativeValue = movement
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }
}

extension String {
    //Height of text in label
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.sizeToFit()
        return label.frame.height
    }

}

extension UIApplication {
    
    //Return top view controller
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
