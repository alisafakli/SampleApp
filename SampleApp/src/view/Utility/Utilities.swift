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
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
}

extension UIApplication {
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
