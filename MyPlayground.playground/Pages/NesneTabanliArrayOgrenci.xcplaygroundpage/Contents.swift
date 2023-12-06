//: [Previous](@previous)

import Foundation

class Ogrenci {
    var no:String?
    var ad:String?
    var sinif:String?
    
    init(no:String,ad:String,sinif:String) {
        self.no = no
        self.ad = ad
        self.sinif = sinif
    }
    
}

var o1 = Ogrenci(no: "123", ad: "Berk", sinif: "3C")
var o2 = Ogrenci(no: "321", ad: "Ali", sinif: "4B")
var o3 = Ogrenci(no: "435", ad: "Mırtaza", sinif: "9A")

var ogrenciListesi = [Ogrenci]()

ogrenciListesi.append(o1)
ogrenciListesi.append(o2)
ogrenciListesi.append(o3)

for ogrenci in ogrenciListesi {
    print("********")
    print("Öğrenci No: \(ogrenci.no!)")
    print("Öğrenci Ad: \(ogrenci.ad!)")
    print("Öğrenci Sınıf: \(ogrenci.sinif!)")
}


///NESNE TABANLI LİSTELEME SORT METODU

class Kisiler {
    var kisiNo:Int?
    var kisiAd:String?
    
    init(kisiNo:Int,kisiAd:String) {
        self.kisiNo = kisiNo
        self.kisiAd = kisiAd
    }
}

let k1 = Kisiler(kisiNo: 1, kisiAd: "Ahmet")
let k2 = Kisiler(kisiNo: 2, kisiAd: "Berk")
let k3 = Kisiler(kisiNo: 3, kisiAd: "Murat")

var kisilerArray = [Kisiler]()

kisilerArray.append(k1)
kisilerArray.append(k2)
kisilerArray.append(k3)

print("Önce")

for i in kisilerArray {
    print("\(i.kisiNo!) - \(i.kisiAd!)")
}

print("Sayısal Büyükten küçüğe")
// $ işareti nesnemizi işaret eder.
let siralama1 = kisilerArray.sorted(by: {$0.kisiNo! > $1.kisiNo!})

for i in siralama1 {
    print("\(i.kisiNo!) - \(i.kisiAd!)")
}

print("Sayısal Küçükten büyüğe")
let siralama2 = kisilerArray.sorted(by: {$0.kisiNo! < $1.kisiNo!})

for i in siralama2 {
    print("\(i.kisiNo!) - \(i.kisiAd!)")
}


print("Harfsel Küçükten Büyüğe")
let siralama3 = kisilerArray.sorted(by: {$0.kisiAd! < $1.kisiAd!})

for i in siralama3 {
    print("\(i.kisiNo!) - \(i.kisiAd!)")
}
