//: [Previous](@previous)

import Foundation

var myName: String?

myName?.uppercased()

var myAge = "10"

var myInteger = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge) {
    print(myNumber * 5)
} else {
    print("Wrong input")
}
