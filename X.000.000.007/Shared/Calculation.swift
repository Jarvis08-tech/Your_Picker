//
//  Calculation.swift
//  X.000.000.007
//
//  Created by Develop on 19.03.22.
//

import Foundation
import SwiftUI

struct Calculation {
    var list: [ThingType] = []
    var deleteAfter = false
    let wholeAlphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var showAlert = false
    
    func unwrapDouble(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1.0) == 0 {
            return String(Int(value))
        }
        return String(value)
    }
    
    
    func safeChecker() -> Bool {
        if list.count < 200 {
            return true
        }
        return false
    }
    
    mutating func appender(thing: String) {
        list.append(ThingType(thing: thing))
        
    }
    
    mutating func picker() -> String {
        let index = Int(arc4random_uniform(UInt32(list.count)))
        if deleteAfter {
            let value = list[index].thing
            list.remove(at: index)
            return value
        }
        return list[index].thing
    }
    
    mutating func addValue(_ value: String) {
        appender(thing: value)
    }
    
    mutating func delete() {
        list.removeAll()
    }
    
    mutating func yesOrNo() {
        if safeChecker() {
            appender(thing: "Yes")
            if safeChecker() {
                appender(thing: "No")
            } else {
                showAlert = true
            }
        } else {
            showAlert = true
        }
        
        
    }
    
    mutating func numbers(start: String, end: String, count: String) {
        if var start = Double(start), let end = Double(end), let count = Double(count), count > 0 {
            if start == end {
                if safeChecker() {
                    appender(thing: unwrapDouble(start))
                    if safeChecker() {
                        appender(thing: unwrapDouble(end))
                    } else {
                        showAlert = true
                    }
                } else {
                    showAlert = true
                }
                
            } else if start < end {
                repeat {
                    if safeChecker() {
                        appender(thing: unwrapDouble(start))
                        start += count
                    } else {
                        showAlert = true
                        break
                    }
                    
                } while start <= end
                
            } else if  start > end {
                repeat {
                    if safeChecker() {
                        appender(thing: unwrapDouble(start))
                        start -= count
                    } else {
                        showAlert = true
                        break
                    }
                    
                } while start >= end
            }
        } else {
            list.append(ThingType(thing: "Invalid numbers indicated"))
        }
    }
    
    mutating func alphabet() {
        for i in wholeAlphabet {
            if safeChecker() {
                appender(thing: i)
            } else {
                showAlert = true
                break
            }
            
        }
    }
}

