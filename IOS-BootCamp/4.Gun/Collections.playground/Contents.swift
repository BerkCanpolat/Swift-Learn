import UIKit

///Array
var numaralar = [10,20,30]
var meyveler = [String]()


///Veri ekleme
meyveler.append("elma")
meyveler.append("muz")
meyveler.append("Kiraz")
print(meyveler)


///Güncelleme

meyveler[0] = "Yeni Elma"
print(meyveler)


///Insert
meyveler.insert("KİVİ", at: 0)
print(meyveler)


///Veri Okuma

print(meyveler[2])
let m = meyveler[0]
print(m)

print("Boyut: \(meyveler.count)")
print("Boş Kontrol: \(meyveler.isEmpty)")


for meyve in meyveler {
    print("Döngü: \(meyve)")
}

for(indeks, meyve) in meyveler.enumerated() {
    print("İndeks: \(indeks) - Döngü: \(meyve)")
}

meyveler.remove(at: 0)
print(meyveler)

meyveler.removeAll()
print(meyveler)


///Nesne Tabanlı

class Ogrenciler {
    var no:Int?
    var ad:String?
    var sinif:String?
    
    init(no:Int,ad:String,sinif:String) {
        self.no = no
        self.ad = ad
        self.sinif = sinif
    }
}


var o1 = Ogrenciler(no: 200, ad: "Zeynep", sinif: "9C")
var o2 = Ogrenciler(no: 300, ad: "Ahmet", sinif: "11Z")
var o3 = Ogrenciler(no: 100, ad: "Beyza", sinif: "12A")

var ogrencilerListesi = [Ogrenciler]()

ogrencilerListesi.append(o1)
ogrencilerListesi.append(o2)
ogrencilerListesi.append(o3)

for o in ogrencilerListesi {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}


let sonuc = ogrencilerListesi.filter({$0.no! > 100})
print("Filtreleme 1")
for o in sonuc {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}

let sonuc2 = ogrencilerListesi.filter({$0.no! < 300 && $0.no! > 100})
print("Filtreleme 2")
for o in sonuc2 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}

let sonuc3 = ogrencilerListesi.filter({$0.ad! == "Ahmet"})
print("Filtreleme 3")
for o in sonuc3 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}

let sonuc4 = ogrencilerListesi.filter({$0.ad!.contains("y")})
print("Filtreleme 4")
for o in sonuc4 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}


///Sıralama - Sorting


let s1 = ogrencilerListesi.sorted(by: {$0.no! > $1.no!})
print("Filtreleme Sorted - Sayısal Büyükten Küçüğe")
for o in s1 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}


let s2 = ogrencilerListesi.sorted(by: {$0.no! < $1.no!})
print("Filtreleme Sorted - Sayısal Küçükten Büyüğe")
for o in s2 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}

let s3 = ogrencilerListesi.sorted(by: {$0.ad! > $1.ad!})
print("Filtreleme Sorted - Metinsel Büyükten Küçüğe")
for o in s3 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}

let s4 = ogrencilerListesi.sorted(by: {$0.no! < $1.no!})
print("Filtreleme Sorted - Metinsel Küçükten Büyüğe")
for o in s4 {
    print("No: \(o.no!) - Ad: \(o.ad!) - Sınıf: \(o.sinif!)")
}



///SET

var meyveler1 = Set<String>()

///Veri ekleme
meyveler1.insert("Elma")
meyveler1.insert("Portakal")
meyveler1.insert("Muz")
print(meyveler1)

meyveler1.insert("Yeni Elma")
print(meyveler1)

for meyve in meyveler1 {
    print("Sonuç: \(meyve)")
}

print("Boyut : \(meyveler1.count)")
print("Boş mu: \(meyveler1.isEmpty)")

meyveler1.remove("Elma")
print(meyveler1)

meyveler1.removeAll()
print(meyveler1)


///Dictionary - HashMap - Map

var iller = [Int:String]()

///Veri ekleme
iller[16] = "Bursa"
iller[34] = "İstanbul"

print(iller)

///Veri Okuma

print(iller[16]!)


///Veri Güncelleme
iller[16] = "Yeni Bursa"
print(iller)


for (anahtar, deger) in iller {
    print("\(anahtar) - \(deger)")
}

iller.removeValue(forKey: 16)
print(iller)
