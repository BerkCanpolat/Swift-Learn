//: [Previous](@previous)

import Foundation

class Kisiler {
    var ad:String?
    var yas:Int?
    var adres:Adres?
    
    init(ad: String, yas: Int, adres:Adres) {
        self.ad = ad
        self.yas = yas
        self.adres = adres
    }
    
}

class Adres {
    var il:String?
    var ilce:String?
    
    init(il:String,ilce:String) {
        self.il = il
        self.ilce = ilce
    }
    
}

let adres = Adres(il: "Ankara", ilce: "Gölbaşı")

let kisi = Kisiler(ad: "Berk", yas: 24, adres: adres)

print("Kişi Ad: \(kisi.ad!)")
print("Kişi Yas: \(kisi.yas!)")
print("Kişi Adres: \(kisi.adres!.il!)")
print("Kişi Adres2: \(kisi.adres!.ilce!)")



///ÖRNEK 2
print("?***********")


class Kategoriler  {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(kategori_id:Int,kategori_ad:String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class Yonetmenler {
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(yonetmen_id:Int,yonetmen_ad:String) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id:Int?
    var film_yil:Int?
    var film_ad:String?
    var film_kategori:Kategoriler?
    var film_yonetmen:Yonetmenler?
    
    init(film_id:Int,film_yil:Int,film_ad:String,film_kategori:Kategoriler,film_yonetmen:Yonetmenler) {
        self.film_id = film_id
        self.film_yil = film_yil
        self.film_ad = film_ad
        self.film_kategori = film_kategori
        self.film_yonetmen = film_yonetmen
    }
    
}


var k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
var k2 = Kategoriler(kategori_id: 2, kategori_ad: "Komedi")
var k3 = Kategoriler(kategori_id: 3, kategori_ad: "Aksiyon")


var y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Berk")
var y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Ali Atay")
var y3 = Yonetmenler(yonetmen_id: 3, yonetmen_ad: "Nuri Bilge Ceylan")

var f1 = Filmler(film_id: 1, film_yil: 1999, film_ad: "Çayırda", film_kategori: k1, film_yonetmen: y1)
var f2 = Filmler(film_id: 2, film_yil: 2012, film_ad: "Ölümlü Dünya", film_kategori: k2, film_yonetmen: y2)
var f3 = Filmler(film_id: 3, film_yil: 2023, film_ad: "Batman", film_kategori: k3, film_yonetmen: y3)

print("Film id: \(f1.film_id!)")
print("Film ad: \(f1.film_ad!)")
print("Film yıl: \(f1.film_yil!)")
print("Film Kategori: \(f1.film_kategori!.kategori_ad!)")
print("Film Yönetmen: \(f1.film_yonetmen!.yonetmen_ad!)")
