//
//  billAmountTextField.swift
//  Unit4_TipCalculator
//
//  Created by Yumi Machino on 2021/01/06.
//

import Foundation
import UIKit

class TextField: UITextField {
    
//    var mainView: UIView!{
//        didSet{
//            mainView.addSubview(self)
//            self.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.8).isActive = true
//        }
//    }
    
    override init(frame: CGRect){
        super.init(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
       
        self.backgroundColor = .white
        self.font = UIFont.init(name: "HelveticaNeue-CondensedBlack", size: 18.0)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    
