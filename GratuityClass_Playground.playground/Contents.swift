/* David Willis
   Exercise: Gratuity Class
   CIT 41100
   9.4.2018
*/

//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

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

var twenty = Gratuity(tipPercent: 0.20, billAmount: 20)
print("The original bill amount was: $\(twenty.billAmount)")
print("The tip percentage is: \(twenty.tipPercent)%")
print("The total bill amount is: $\(twenty.totalBillAmount)")
print("The total tip amount is: $\(twenty.tipAmount)\n")

var fifteen = Gratuity(tipPercent: 0.15, billAmount: 15)
print("The original bill amount was: $\(fifteen.billAmount)")
print("The tip percentage is: \(fifteen.tipPercent)%")
print("The total bill amount is: $\(fifteen.totalBillAmount)")
print("The total tip amount is: $\(fifteen.tipAmount)")
