//: [Previous](@previous)

import Foundation

//AND &&(ve)
//OR ||(veya)

var myAge = 24

if myAge < 20 {
    print("Yaşım 20'den küçük")
} else {
    print("Yaşım 24'ten Büyük")
}

var myNewAge = 32

if myNewAge < 30 {
    print("Yaşım 30'dan Küçük")
} else if myNewAge > 30 && myNewAge < 40 {
    print("Yaşım 30'dan Büyük 40'dan Küçük")
} else {
    print("Yaşım 40'dan Fazla")
}
