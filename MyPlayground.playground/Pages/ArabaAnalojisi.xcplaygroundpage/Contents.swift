//: [Previous](@previous)

import Foundation



class Araba {
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    
    func calistir() {
        calisiyorMu = true
    }
    
    func durdur() {
        calisiyorMu = false
    }
    
    func hizlan(kacKM:Int) {
        hiz! += kacKM
    }
    
    func yavasla(kacKM:Int) {
        hiz! -= kacKM
    }
    
    func bilgiAl() {
        print("Renk: \(renk!)")
        print("Hız: \(hiz!)")
        print("Çalışıyor Mu?: \(calisiyorMu!)")
    }
    
}

var bmw = Araba()

bmw.renk = "Kırmızı"
bmw.hiz = 100
bmw.calistir()
bmw.bilgiAl()

bmw.durdur()
bmw.bilgiAl()

bmw.hizlan(kacKM: 40)
bmw.bilgiAl()

bmw.yavasla(kacKM: 30)
bmw.bilgiAl()

/*
bmw.renk = "Kırmızı"
bmw.hiz = 10
bmw.calisiyorMu = true

print(bmw.renk!)
print(bmw.hiz!)
print(bmw.calisiyorMu!)
 */




