//
//  ViewController.swift
//  Gratuity Calculator
//
//  Created by Willis, David James on 8/29/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//  Command + Shift + 0 = Built-in Documentation
//

import UIKit

class ViewController: UIViewController {
    
    // DECLARE IBOUTLETS
    
    @IBOutlet var lblTipPercentOutput: UILabel!
    @IBOutlet var lblTipAmountOutput: UILabel!
    @IBOutlet var lblTotalAmountOutput: UILabel!
    
    // DECLARE ATTRIBUTES //
    
    var gratuityCalc = Gratuity(tipPercent: 0.15, billAmount: 0.00)
    
    // NUMBER FORMATTERS
    
    let decimalFormatter: NumberFormatter = {
        // Create variable numFormDec to receive the NumberFormatter class properties
        let numFormDec = NumberFormatter()
        // Styles are predetermined sets of values for certain properties (from Apple Developer website)
        // Assigning a decimal value to this instance of the NumberFormatter class
        numFormDec.numberStyle = .decimal
        
        // Ensures that the Tip Amount and Total Amount labels show two decimals at the end and no more (no less either)
        numFormDec.minimumFractionDigits = 2 // Minimum of two decimal places
        numFormDec.maximumFractionDigits = 2 // Maximum of two decimal places
        
        // Return numFormDec for use
        return numFormDec
    }() // End
    
    let percentFormatter: NumberFormatter = {
        // Create variable numFormPerc to receive NumberFormatter class properties
        let numFormPerc = NumberFormatter()
        // Assigning a percentage value to this instance of the NumberFormatter class so will end in percentage on the label
        numFormPerc.numberStyle = .percent
        
        // Return numFormPerc for use
        return numFormPerc
    }()
    
    // LIFECYCLE FUNCTIONS

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Allow user to dismiss the keyboard by tapping outside of it
        //Create an object that recognizes taps
        //endEditing portion helps it actually update after the user clicks or taps out of the textfield
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        // Needed so we don't interfere with other tap controls
        //Will make sure that taps do not interfere with other tap gestures such as dragging items around, etc.
        tap.cancelsTouchesInView = false
        
        // Adds the tap object to the current view
        self.view.addGestureRecognizer(tap)
        
        lblTipPercentOutput.text = "50%"
        lblTipAmountOutput.text = "0.00"
        lblTotalAmountOutput.text = "0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // DECLARE IBACTIONS
    
    @IBAction func txtBillAmountUp(_ sender: UITextView) {
        //print("Bill Amount Updated!")
        //print("The bill amount is \(sender.text)")
        
        // Create billCurrentValue variable to receive the text current inputted unto the UITextView textfield box
        let billCurrentValue = sender.text

        // if the billCurrentValue (or the textfield entry box) isn't empty (filled with some text), then run if the following statements
        if billCurrentValue != "" {
            // The instance of the Gratuity class called earlier will receive the value currently inputted into the textfield box
            gratuityCalc.billAmount = NSDecimalNumber(string: billCurrentValue)
            
            // lblTipAmountOuput label will then receive the current tipAmount based on the slider in the next function, which updates the tipAmount variable from the Gratuity class
            lblTipAmountOutput.text = decimalFormatter.string(from: gratuityCalc.tipAmount)
            
            // lblTotalAmountOutput label will receive the current totalBillAmount based on a calculation done in the next function (bill plus tip ammount), which updates the totalBillAmount variable from the Gratuity class
            lblTotalAmountOutput.text = decimalFormatter.string(from: gratuityCalc.totalBillAmount)
        } else {
            // If the textfield box is empty, then the lblTipAmountOutput and lblTotalAmountOutput labels will say "0.00"
            lblTipAmountOutput.text = "0.00"
            lblTotalAmountOutput.text = "0.00"
        } // End
        
    } // End
    
    @IBAction func slideTipPercentUpdated(_ sender: UISlider) {
        //print("Tip Percentage Updated!")

        // Create sliderCurrentValue variable to receive the current slider value (wherever the circle is on the horizontal line)
        var sliderCurrentValue = sender.value
        
        // If the sliderCurrentValue is not multiplied by 100 and rounded off then divided by 100 once again, then there will be intervals from 70% to 71% (and any 1% interval) that will be updated in the Tip Amount and Total Amount labels with uneven numbers as if the slider is calculating 70.1, 70.2, 70.3 ... 70.9 ... 71, which distorts the users view of an estimated tip percentage based on whole numbers
        // round(sliderCurrentValue) doesn't work because then the tip percentage will be either 0% or 100%
        sliderCurrentValue = round(sliderCurrentValue * 100.0) / 100.0
        
        // The instance of the Gratuity class called earlier will receive the value current position of the slider
        gratuityCalc.tipPercent = NSDecimalNumber(value: sliderCurrentValue)
        
        //lblTipPercentOutput label will then receive the current tipPercent based on the slider position, outputted as text to the right of the slider
        lblTipPercentOutput.text = percentFormatter.string(from: gratuityCalc.tipPercent)
        
        // lblTipAmountOutput label will receive the current tipAmount by addressing the formula in the Gratuity class (taking the current billAmount * tipPercent to receive the total tipAmount
        lblTipAmountOutput.text = decimalFormatter.string(from: gratuityCalc.tipAmount)
        
        // lblTotalAmountOutput label will receive the current totalBillAmount by addressing the formula in the Gratuity class (taking the total tipAmount calculated a step before and adding it to the billAmount for the totalBillAmount
        lblTotalAmountOutput.text = decimalFormatter.string(from: gratuityCalc.totalBillAmount)
    }
    
}

