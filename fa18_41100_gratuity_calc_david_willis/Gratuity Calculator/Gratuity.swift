//
//  Gratuity.swift
//  Gratuity Calculator
//
//  Created by Willis, David James on 9/5/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//

/*
 
 Command + Shift + 0 = Built-in Documentation
 
 My notes for 9.5.2018
 
 The function way:
 
 func calculateTip() {
 return self.tipPercent.multiplying(by: self.billAmount)
 // self.totalTipAmount = self.tipPercent.multiplying(by: self.billAmount)
 }
 
 Store a fixed amount in memory rather than allocate when it is needed. Will thus compute slightly
 Faster as well.
 
 UITapGestureRecognizer  - Tap outside of textfield to update entry
 
 */

import Foundation

class Gratuity: NSObject {
    var billAmount: NSDecimalNumber = 0
    var tipPercent: NSDecimalNumber = 0
    
    var tipAmount: NSDecimalNumber {
        return tipPercent.multiplying(by: billAmount)
    }
    
    var totalBillAmount: NSDecimalNumber {
        return billAmount.adding(self.tipAmount)
    }
    
    init(tipPercent: NSDecimalNumber, billAmount: NSDecimalNumber) {
        self.billAmount = billAmount
        self.tipPercent = tipPercent
    }
}
