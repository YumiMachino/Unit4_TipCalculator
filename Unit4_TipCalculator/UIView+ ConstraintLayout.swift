//
//  UIView+ ConstraintLayout.swift
//  Unit4_TipCalculator
//
//  Created by Yumi Machino on 2021/01/07.
//

import UIKit


struct AnchoredConstraints {
        var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    func matchParent(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        if let superBottomAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: -padding.right).isActive = true
        }
    }

    func setStackConstraint(padding:UIEdgeInsets = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        
//        if let superTopAnchor = superview?.topAnchor {
//            self.topAnchor.constraint(equalTo: superTopAnchor, constant: 150).isActive = true
//        }
//        if let superBottomAnchor = superview?.bottomAnchor {
//            self.bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -100).isActive = true
//        }
        if let superHeightAnchor = superview?.heightAnchor {
            self.heightAnchor.constraint(equalTo: superHeightAnchor, multiplier: 0.7).isActive = true
        }
        
        if let superWidthAnchor = superview?.widthAnchor {
            self.widthAnchor.constraint(equalTo: superWidthAnchor, multiplier: 0.8).isActive = true
        }
        if let superCenterXAnchor = superview?.centerXAnchor {
            self.centerXAnchor.constraint(equalTo: superCenterXAnchor).isActive = true
        }
        if let superCenterYAnchor = superview?.centerYAnchor {
            self.centerYAnchor.constraint(equalTo: superCenterYAnchor).isActive = true
        }
    }
    
    func setContentConstraint(padding:UIEdgeInsets = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: 0).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: 0).isActive = true
        }
    }

    
    @discardableResult
    func anchors(topAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let topAnchor = topAnchor {
            anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
        }
        if let bottomAnchor = bottomAnchor {
            anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        }
        if let leadingAnchor = leadingAnchor {
            anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
        }
        if let trailingAnchor = trailingAnchor {
            anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.bottom, anchoredConstraints.leading, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
 
    
    
}

