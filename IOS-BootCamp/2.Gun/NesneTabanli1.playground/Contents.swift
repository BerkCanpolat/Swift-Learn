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



///FONKSİYONLAR

class Fonksiyonlar {
    //Geri dönüş değeri olmayan(void)
    func selamla() {
        let sonuc = "Merhaba Berk"
        print(sonuc)
    }
    
    //Geri dönüşü olan (return)
    func selamla1() -> String {
        let sonuc = "Merhaba Berko"
        return sonuc
    }
    
    //Parametre
    func selaml2(isim:String) {
        let sonuc = "Merhaba \(isim)"
        print(sonuc)
    }
    
    func toplama(sayi1:Int,sayi2:Int) -> Int {
        let sonuc = sayi1 + sayi2
        return sonuc
    }
    
    //Overloading
    func carpma(sayi1:Int,sayi2:Int) {
        print("Çarpma: \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Double,sayi2:Double) {
        print("Çarpma: \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Int,sayi2:Int, isim:String) {
        print("Çarpma: \(sayi1 * sayi2) - İşlemi Yapan: \(isim)")
    }
    
}


var f = Fonksiyonlar()

f.selamla()

let gelenSonuc = f.selamla1()
print(gelenSonuc)

f.selaml2(isim: "Hehe")

let gelenSonuc2 = f.toplama(sayi1: 12, sayi2: 12)
print(gelenSonuc2)


f.carpma(sayi1: 2, sayi2: 4, isim: "Berk")




///Static değişkenler ve metodlar

class Asinifi {
    static var x = 10
    
    static func metod() {
        print("Metod Çalıştı")
    }
}

let a = Asinifi()

/*print(a.x)

a.metod()

print(Asinifi().x) //Sanal nesne - virtual object - isimsiz nesne

Asinifi().metod()*/

print(Asinifi.x)

Asinifi.metod()



///ENUMERATİON(enum)

enum KonserveBoyut {
    case Kucuk
    case Orta
    case Buyuk
}

func ucretHesapl(boyut:KonserveBoyut, adet:Int) {
    switch boyut {
    case .Kucuk:
        print("Fiyat \(adet * 13)")
    case .Orta:
        print("Fiyat: \(adet * 24)")
    case .Buyuk:
        print("Fiyat \(adet * 45)")
    }
}

ucretHesapl(boyut: .Orta, adet: 100)


///COMPOSİTİON

class Kategoriler {
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
    var film_ad:String?
    var film_yil:Int?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(film_id:Int,film_ad:String,film_yil:Int,kategori:Kategoriler,yonetmen:Yonetmenler) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}

var k1 = Kategoriler(kategori_id: 1, kategori_ad: "Drama")

var y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Berk Canpolat")

var f1 = Filmler(film_id: 1, film_ad: "Ölümlü Dünya", film_yil: 2024, kategori: k1, yonetmen: y1)

print("Film id: \(f1.film_id!)")
print("Film Ad: \(f1.film_ad!)")
print("Film yıl: \(f1.film_yil!)")
print("Film Kategori: \(f1.kategori!.kategori_ad!)")
print("Film Yönetmen: \(f1.yonetmen!.yonetmen_ad!)")
