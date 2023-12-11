import UIKit

class Araba {
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    
    init() {
        print("Boş init metodu çalıştı")
    }
    
    init(renk:String,hiz:Int,calisiyorMu:Bool) {
        self.renk = renk
        self.hiz = hiz
        self.calisiyorMu = calisiyorMu
        print("Dolu init metodu çalıştı")
    }
    
    func hizlan(km:Int) {
        hiz! += km
    }

    func yavasla(km:Int) {
        hiz! -= km
    }
    
    func renkDegis(color:String) {
        renk = color
    }
    
    func calistir() { //Side effect
        calisiyorMu = true
        hiz = 5
    }
    
    func durdur() {
        calisiyorMu = false
        hiz = 0
    }
    
    
    func bilgiAl() {
        print("---------------")
        print("Renk: \(renk!)")
        print("Hız: \(hiz!)")
        print("Çalışıyor Mu?: \(calisiyorMu!)")
    }
    
}

var d = Araba(renk: "Mavi", hiz: 200, calisiyorMu: true)

d.bilgiAl()



//Nesne oluşturma
var bmw = Araba()

//Değer atama
bmw.renk = "Kırmızı"
bmw.hiz = 100
bmw.calisiyorMu = true

//Değer okuma
bmw.bilgiAl()
bmw.hizlan(km: 20)
bmw.bilgiAl()

bmw.yavasla(km: 5)
bmw.bilgiAl()

bmw.renkDegis(color: "Mor")
bmw.bilgiAl()




var sahin = Araba()

sahin.renk = "Beyaz"
sahin.hiz = 0
sahin.calisiyorMu = false

//Değer okuma
sahin.bilgiAl()
sahin.calistir()
sahin.bilgiAl()
