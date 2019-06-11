//
//  SlideUpAnimator.swift
//  SlideUpAnimator
//
//  Created by Alfredo Uzumaki on 6/11/19.
//  Copyright © 2019 Alfredo Uzumaki. All rights reserved.
//

import UIKit

extension UIView {
    
    func hideAllSubViews() {
        self.subviews.forEach({$0.isHidden = true})
    }
    
    func slideUpViews(delay: Double, comple:(()->())? = nil) {
        if self.subviews.count <= 1  { return }
        for i in 0..<self.subviews.count {
            self.subviews[i].alpha = 0
        }
        self.reloadInputViews()
        self.layoutIfNeeded()
        self.subviews.forEach({$0.isHidden = false})
        for i in 0..<self.subviews.count {
            if self.subviews.count <= i  { return }
            let v = self.subviews[i]
            DispatchQueue.main.asyncAfter(deadline: .now() + delay + Double(Double(i) * 0.05)) {
                if self.subviews.count <= i  { return }
                let defaultYPosition = v.frame.origin.y
                v.frame = CGRect(x: v.frame.origin.x, y: defaultYPosition + 100, width: v.frame.width, height: v.frame.height)
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                    v.frame = CGRect(x: v.frame.origin.x, y: defaultYPosition, width: v.frame.width, height: v.frame.height)
                    v.alpha = 1
                },completion: { _ in
                    comple?()
                })
            }
        }
    }
    
    func slideLeftViews(delay: Double, comple:(()->())? = nil) {
        if self.subviews.count <= 1  { return }
        for i in 0..<self.subviews.count {
            self.subviews[i].alpha = 0
        }
        self.reloadInputViews()
        self.layoutIfNeeded()
        self.subviews.forEach({$0.isHidden = false})
        for i in 0..<self.subviews.count {
            if self.subviews.count <= i  { return }
            let v = self.subviews[i]
            DispatchQueue.main.asyncAfter(deadline: .now() + delay + Double(Double(i) * 0.05)) {
                if self.subviews.count <= i  { return }
                let defaultXPosition = v.frame.origin.x
                v.frame = CGRect(x: defaultXPosition + 100, y: v.frame.origin.y, width: v.frame.width, height: v.frame.height)
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                    v.frame = CGRect(x: defaultXPosition, y: v.frame.origin.y, width: v.frame.width, height: v.frame.height)
                    v.alpha = 1
                },completion: { _ in
                    comple?()
                })
            }
        }
    }
    
    func slideUpViewsQuickly(delay: Double, comple:(()->())? = nil) {
        if self.subviews.count <= 1  { return }
        for i in 0..<self.subviews.count {
            self.subviews[i].transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.subviews[i].alpha = 0
        }
        self.reloadInputViews()
        self.layoutIfNeeded()
        self.subviews.forEach({$0.isHidden = false})
        for i in 0..<self.subviews.count {
            let v = self.subviews[i]
            if self.subviews.count <= i  { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + delay + Double(Double(i) * 0.05)) {
                if self.subviews.count <= i  { return }
                let defaultYPosition = v.frame.origin.y
                v.frame = CGRect(x: v.frame.origin.x, y: defaultYPosition + 40, width: v.frame.width, height: v.frame.height)
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                    v.frame = CGRect(x: v.frame.origin.x, y: defaultYPosition, width: v.frame.width, height: v.frame.height)
                    v.alpha = 1
                    v.transform = CGAffineTransform(scaleX: 1, y: 1)
                },completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.reloadInputViews()
                        self.layoutIfNeeded()
                    })
                    comple?()
                })
            }
        }
    }
    
    func hideOutView(comple:(()->())? = nil) {
        UIView.animate(withDuration: 0.3, animations: {
            self.subviews.forEach({$0.alpha = 0})
        }) { (finished) in
            comple?()
        }
    }
}
