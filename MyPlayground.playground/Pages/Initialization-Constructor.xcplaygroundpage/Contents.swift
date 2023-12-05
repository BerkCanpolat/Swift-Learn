//: [Previous](@previous)

import Foundation

class Kisiler {
    var ad:String?
    var yas:Int?
    
    init() {
        
    }
    
    init(ad:String,yas:Int) {
        self.ad = ad
        self.yas = yas
    }
}

var kisi2 = Kisiler(ad: "Berk", yas: 24)
print(kisi2.ad!)
print(kisi2.yas!)
