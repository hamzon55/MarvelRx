//
//  LoadingCircle.swift
//  MarvelRx
//
//  Created by Hamza on 13/12/21.
//

import Foundation
import UIKit


extension UIViewController {
    func showProgress() {
        let activity = UIActivityIndicatorView()
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }

        let backgroundAlphaView = UIView(frame: window.bounds)
        backgroundAlphaView.tag = 789
        backgroundAlphaView.backgroundColor = .clear
        window.addSubview(backgroundAlphaView)
        backgroundAlphaView.translatesAutoresizingMaskIntoConstraints = false
        backgroundAlphaView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        backgroundAlphaView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        backgroundAlphaView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        backgroundAlphaView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        backgroundAlphaView.addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: backgroundAlphaView.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: backgroundAlphaView.centerYAnchor).isActive = true
        activity.style = .white
        activity.color = UIColor.black
        activity.hidesWhenStopped = true
        activity.isHidden = false
        activity.startAnimating()
    }

    
    
    func hideProgress() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else {return}
            if let activity = window.viewWithTag(789) {
                activity.removeFromSuperview()
            }
        }
    }
}
