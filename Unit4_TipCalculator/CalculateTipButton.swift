//
//  CalculateTipButton.swift
//  Unit4_TipCalculator
//
//  Created by Yumi Machino on 2021/01/07.
//

import Foundation
import UIKit

class calculateTipButton: UIButton {
    
//    var mainView: UIView! {
//        didSet {
//            mainView.addSubview(self)
//            self.setConstraint()
//        }
//    }
    
    
    init(text: String = " ") {
        super.init(frame: .zero)
        self.setTitle(text , for: .normal)
        self.setTitleColor(.systemBlue, for: .normal)
        self.setTitleColor(.systemTeal, for: .highlighted)
        self.titleLabel?.font = UIFont(name: "Inter-Regular", size: 16)
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
