//
//  tipAmountLabel.swift
//  Unit4_TipCalculator
//
//  Created by Yumi Machino on 2021/01/07.
//

import Foundation
import UIKit

class tipAmountLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
        self.backgroundColor = .white
        self.text = "00.00"
        self.font = self.font.withSize(30)
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
