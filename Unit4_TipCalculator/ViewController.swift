//
//  ViewController.swift
//  Unit4_TipCalculator
//
//  Created by Yumi Machino on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    var billAmountTxtField = TextField()
    var calcTipButton = calculateTipButton(text: "Calculate Tips")
    var tipAmountlb = tipAmountLabel()
    var tipPercentageTextField = TextField()
    var tipPercentApplied: Double = 0.0
    
    var totalAmountlb: UILabel = {
        let lb = UILabel()
        lb.text = "TotalAmount"
        lb.font = lb.font.withSize(12)
        lb.backgroundColor = .white
        return lb
    }()
    var tipPercentagelb: UILabel = {
        let lb = UILabel()
        lb.text = "Tip Percentage"
        lb.font = lb.font.withSize(12)
        lb.backgroundColor = .white
        return lb
    }()
    var dollarSign: UILabel = {
        let lb = UILabel()
        lb.text = "$"
        lb.font = lb.font.withSize(30)
        lb.backgroundColor = .white
        lb.textAlignment = .right
        return lb
    }()
    
    lazy var totalAmountStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dollarSign, tipAmountlb])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    var tipSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .systemTeal
        return slider
    }()
    
    
    
    fileprivate func registerKeyBoardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.backgroundColor = .cyan
        scrollView.matchParent()
        
        initialSetup()
        registerKeyBoardNotification()
        
        // make keyboard disappear
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(gestureRecognizer)
       
        
    }

    
    
    func initialSetup(){
        let stackView = UIStackView(arrangedSubviews: [totalAmountStack,totalAmountlb,billAmountTxtField,tipPercentagelb,tipSlider,tipPercentageTextField,calcTipButton])
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.backgroundColor = .systemYellow
        
        stackView.setStackConstraint()

//        tipAmountlb.setContentConstraint()
        totalAmountStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50).isActive = true
        totalAmountStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50).isActive = true
        
        billAmountTxtField.setContentConstraint()
        tipSlider.setContentConstraint()

        calcTipButton.setContentConstraint()
        tipPercentageTextField.setContentConstraint()
        totalAmountlb.setContentConstraint()
        tipPercentagelb.setContentConstraint()

        calcTipButton.addTarget(self, action: #selector(calcTipButtonPressed(_:)), for: .touchUpInside)
        billAmountTxtField.placeholder = "Bill Amount"
        tipPercentageTextField.placeholder = "Tip percentage"
        
        tipSlider.addTarget(self,action: #selector(tipSliderMoved(_:)), for: .valueChanged)
 
    }
    
    
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

