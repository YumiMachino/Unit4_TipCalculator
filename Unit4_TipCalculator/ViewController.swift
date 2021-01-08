//
//  ViewController.swift
//  Unit4_TipCalculator
//
//  Created by Yumi Machino on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    
    // display tip amount to be paid
    var dollarSign: UILabel = {
        let lb = UILabel()
        lb.text = "$"
        lb.font = lb.font.withSize(30)
        lb.backgroundColor = .white
        lb.textAlignment = .center
        return lb
    }()
    
    var tipAmountlb = tipAmountLabel()
    
    lazy var totalAmountStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dollarSign, tipAmountlb])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    // section for total bill amount
    var totalAmountlb: UILabel = {
        let lb = UILabel()
        lb.text = "TotalAmount"
        lb.font = lb.font.withSize(12)
        lb.backgroundColor = .white
        return lb
    }()
    var billAmountTxtField = TextField()
    
    // section for percentage
    var tipPercentagelb: UILabel = {
        let lb = UILabel()
        lb.text = "Tip Percentage"
        lb.font = lb.font.withSize(12)
        lb.backgroundColor = .white
        return lb
    }()
    
    var tipSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .cyan
        return slider
    }()
    
    var tipPercentageTextField = TextField()
    
    var calcTipButton = calculateTipButton(text: "Calculate Tips")
    

    
    var tipPercentApplied: Double = 0.0
    

    
    fileprivate func registerKeyBoardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.matchParent()
      
        
        registerKeyBoardNotification()
        
        // make keyboard disappear
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        
        let stackView = UIStackView(arrangedSubviews: [totalAmountStack,totalAmountlb,billAmountTxtField,tipPercentagelb,tipSlider,tipPercentageTextField,calcTipButton])
        
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally

        stackView.backgroundColor = .white
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setStackConstraint()
    
//        stackView.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerYAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor, multiplier: 0.7).isActive = true
////
//        stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 10).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 10).isActive = true
//
//
//        stackView.anchors(topAnchor: scrollView.contentLayoutGuide.topAnchor, leadingAnchor: scrollView.contentLayoutGuide.leadingAnchor, trailingAnchor: scrollView.contentLayoutGuide.trailingAnchor, bottomAnchor: scrollView.contentLayoutGuide.bottomAnchor)
        
        
//        tipAmountlb.setContentConstraint()
        totalAmountStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50).isActive = true
        totalAmountStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50).isActive = true
//        totalAmountStack.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2).isActive = true
        
        
        billAmountTxtField.setContentConstraint()
        
//        billAmountTxtField.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.15).isActive = true
        
        tipSlider.setContentConstraint()
        
//        tipSlider.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
        
        calcTipButton.setContentConstraint()
        
//        calcTipButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.15).isActive = true
        tipPercentageTextField.setContentConstraint()
        
//        tipPercentageTextField.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2).isActive = true
        totalAmountlb.setContentConstraint()
        
//        totalAmountlb.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
      
        tipPercentagelb.setContentConstraint()
        
//        tipPercentagelb.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
        
        calcTipButton.addTarget(self, action: #selector(calcTipButtonPressed(_:)), for: .touchUpInside)
        billAmountTxtField.placeholder = "Bill Amount"
        tipPercentageTextField.placeholder = "Tip percentage"
        
        
        tipSlider.addTarget(self,action: #selector(tipSliderMoved(_:)), for: .valueChanged)
        
        
        
        
        
        
        
//        registerKeyBoardNotification()
//
//        // make keyboard disappear
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
//        view.addGestureRecognizer(gestureRecognizer)
//
        
    }

    
    
//    func initialSetup(){
//        let stackView = UIStackView(arrangedSubviews: [totalAmountStack,totalAmountlb,billAmountTxtField,tipPercentagelb,tipSlider,tipPercentageTextField,calcTipButton])
//        scrollView.addSubview(stackView)
//
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
////        stackView.spacing = 10
//        stackView.backgroundColor = .systemYellow
//
//        stackView.setStackConstraint()
//
////        tipAmountlb.setContentConstraint()
//        totalAmountStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50).isActive = true
//        totalAmountStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50).isActive = true
////        totalAmountStack.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2).isActive = true
//
//
//        billAmountTxtField.setContentConstraint()
////        billAmountTxtField.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.15).isActive = true
//
//        tipSlider.setContentConstraint()
////        tipSlider.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
//
//        calcTipButton.setContentConstraint()
////        calcTipButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.15).isActive = true
//        tipPercentageTextField.setContentConstraint()
////        tipPercentageTextField.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2).isActive = true
//        totalAmountlb.setContentConstraint()
////        totalAmountlb.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
//
//        tipPercentagelb.setContentConstraint()
////        tipPercentagelb.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
//
//        calcTipButton.addTarget(self, action: #selector(calcTipButtonPressed(_:)), for: .touchUpInside)
//        billAmountTxtField.placeholder = "Bill Amount"
//        tipPercentageTextField.placeholder = "Tip percentage"
//
//
//        tipSlider.addTarget(self,action: #selector(tipSliderMoved(_:)), for: .valueChanged)
//
//    }
    
    
    @objc
    func tipSliderMoved(_ sender: UISlider) {
        let currentTipValue = floor(sender.value * 100)/100
        tipPercentageTextField.text = "\(currentTipValue)"
        
        
        if let billAmount = billAmountTxtField.text {
            let billAmountDouble = Double(billAmount)
            if let billAmountNumeric = billAmountDouble {
                let tipAmount = billAmountNumeric * (Double(currentTipValue * 0.01))
                let tipAmountTrimmed = floor(tipAmount * 100)/100
                tipAmountlb.text = String(tipAmountTrimmed)
            }
        }
    }
    
    
    
    @objc
    func calcTipButtonPressed(_ sender : UIButton) {
       
        
        if let tipPercent = tipPercentageTextField.text {
            let tipPercentDouble = Double(tipPercent)
            if let tipPercentNumeric = tipPercentDouble {
                tipPercentApplied = tipPercentNumeric
            }
        }
    
        
        if let billAmount = billAmountTxtField.text {
            let billAmountDouble = Double(billAmount)
            if let billAmountNumeric = billAmountDouble {
                let tipAmount = billAmountNumeric * (tipPercentApplied * 0.01)
                tipAmountlb.text = String(tipAmount)
            }
        }
        
        
    }
    
    
    @objc
    func keyboardWasShown(_ notification: NSNotification) {
        // userInfo = notification dictionary and optional
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
        
        // get keyboard info
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardHeight = keyboardFrame.size.height

        // set padding
        let insets = UIEdgeInsets(top:0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = insets
        // set indicator on the right
        scrollView.scrollIndicatorInsets = insets
    }
    
    
    
    @objc
    func keyboardWillBeHidden(_ sender: NSNotification){
        // 2. When notifies, I want to ask iOS the size (height) of the keyboard
        // 3. Tell scrollview to scroll up (height)
        let insets = UIEdgeInsets.zero          // top, bottom, right, leftが0
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
        
    }


    @objc
    func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    

}

