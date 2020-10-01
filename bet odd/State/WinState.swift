//
//  WinState.swift
//  bet odd
//
//  Created by Rodrigo Santos on 21/09/20.
//

import SwiftUI
import Combine

class WinState: ObservableObject {
    var earning: String = ""
    
    var firstOdd: String = "" {
        willSet(newValue) {
            
            let earningDob = Double(earning.replacingOccurrences(of: ",", with: ".")) ?? 0
            let odd = Double(newValue.replacingOccurrences(of: ",", with: ".")) ?? 0
            
            let pay = (earningDob / odd)
            let winner = (pay * odd)
            let percent = (earningDob - pay) / 100
            
            firstOddPay = String(format: "%.2f", pay)
            firstOddWinner = String(format: "%.2f", winner)
            firstOddPercent = String(format: "%.2f", percent)
            
        }
    }
    
    var secondOdd: String = "" {
        willSet(newValue) {
            
            let earningDob = Double(earning.replacingOccurrences(of: ",", with: ".")) ?? 0
            let odd = Double(newValue.replacingOccurrences(of: ",", with: ".")) ?? 0
            
            let pay = (earningDob / odd)
            let winner = (pay * odd)
            let percent = (earningDob - pay) / 100
            
            secondOddPay = String(format: "%.2f", pay)
            secondOddWinner = String(format: "%.2f", winner)
            secondOddPercent = String(format: "%.2f", percent)
            
        }
    }
    
    @Published var firstOddPay: String?
    @Published var secondOddPay: String?
    
    @Published var firstOddWinner: String?
    @Published var secondOddWinner: String?
    
    @Published var firstOddPercent: String?
    @Published var secondOddPercent: String?
    
}

