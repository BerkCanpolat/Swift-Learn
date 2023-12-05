//: [Previous](@previous)

import Foundation

func myFunction() {
    print("Fonksiyonum çalıştı")
}

myFunction()


func mySumFunctions(x:Int, y:Int) -> Int {
    return x + y
}

let myFunctionsVariable = mySumFunctions(x: 12, y: 12)

print(myFunctionsVariable)

func logicFunction(x:Int, y:Int) -> Bool {
    if x > y {
        return true
    } else{
        return false
    }
}

logicFunction(x: 5, y: 20)


func stringFunction(x:Int,y:Int) -> String {
    if x > y {
        return "X büyüktür Y"
    } else {
        return "X küçüktür Y"
    }
}

stringFunction(x: 5, y: 12)

