//: [Previous](@previous)

import Foundation

var number = 0

while number <= 10 {
    print(number)
    number += 1
}

var characterAlive = true

while characterAlive == true {
    print("Karakter Yaşıyor")
    characterAlive = false
}


//For Loop

var myFruitArray = ["Banana","Apple","Orange"]

for fruit in myFruitArray {
    print(fruit)
}

var myNumbers = [10,20,30,40,50,60]

for num in myNumbers {
    print(num / 5)
}

for mynewinteger in 1 ... 5 {
    print(mynewinteger)
}
