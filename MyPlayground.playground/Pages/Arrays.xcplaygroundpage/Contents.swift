import UIKit

var myFavoriteMovies = ["Pulp","Kill Bill","Reservoir Dogs"]

myFavoriteMovies[0]
myFavoriteMovies[1].uppercased()
myFavoriteMovies.count
myFavoriteMovies[myFavoriteMovies.count - 1]
myFavoriteMovies.first
myFavoriteMovies.last
myFavoriteMovies.sort()
print(myFavoriteMovies)


var myNumber = [1,2,3,4,5,6,7]

myNumber.append(8)
print(myNumber)
myNumber[0] = 21
myNumber[0]
print(myNumber)




///EKSTRA


//Array tanımlama yöntemleri
var dizi1 = [Int]()
var dizi2 = [1,2,3]
var dizi3: [Float] = [10.0, 20.0, 30.0]

//Array verilerine erişim

var meyveler: [String] = ["Çilek","Muz","Elma","Kivi","Kiraz"]
var str1 = meyveler[3]
print(str1)

//Array veri ekleme


var meyveler2: [String] = ["Çilek","Muz","Elma","Kivi","Kiraz"]

meyveler2.append("Karpuz")
meyveler2 += ["Mandalina"]
meyveler2[2] = "Ananas"

//Vaar olan indexin içerisine veri yerleştirir.
meyveler2.insert("Yeni Eleman", at: 0)

//Dizinin dolu olup olmadığını kontrol eder.
meyveler2.isEmpty

//İçinde ne kadar eleman varsa o kadar alır ve gösterir.
meyveler2.count

//İlk ve Son elemanı verir
meyveler2.first
meyveler2.last

//Elaman var mı yok mu kontrol eder
meyveler2.contains("Kiraz")

//Dizimizin max ve min sayısını verir
meyveler2.max()
meyveler2.min()

//Diziyi terse çevirme
meyveler2.reverse()

//İçeriği neyse ona göre bir sıralama yapar
meyveler2.sort()

//Veriyi silme
meyveler2.remove(at: 2)

//Hepsini Sil
meyveler2.removeAll()
print(meyveler2)


//ARRAY(DİZİLER) FİLTRELEME

var sayilar = [1,2,3,4,5,6,7,8,9,10]

var sonuc1 = sayilar.filter({$0>7})
print(sonuc1)

var sonuc2 = sayilar.filter({$0<7})
print(sonuc2)

var sonuc3 = sayilar.filter({$0>3 && $0<7})
print(sonuc3)


//DÖNGÜLER İLE VERİ ÇEKME

for meyve in meyveler {
    print("Sonuç: \(meyve)")
}

for (indeks, meyve) in meyveler.enumerated() {
    print("Sonuç: \(indeks) : \(meyve)")
}


//ARRAY İLE ORTALAMA HESAPLAMA

var sayilarlist = [10,20,30,40,50,60]

var toplam = 0

for i in sayilarlist {
    toplam += i
}

print("Toplam: \(toplam)")

print("Ortalama: \(toplam/sayilarlist.count)")



//ARRAY İLE İÇERİK DEĞİŞTİRME

var sayilar4 = [1,2,3,4,5]

for (indeks, num) in sayilar4.enumerated() {
    let sonuc = num * 5
    sayilar4[indeks] = sonuc
}

print(sayilar4)



//ARRAY İLE TEK ÇİFT SAYILAR

var sayilar5 = [1,4,67,88,10,3,5,6,8,10]

var tekler = [Int]()
var ciftler = [Int]()

for s in sayilar5 {
    let sonuc = s % 2
    
    if sonuc == 0 {
        ciftler.append(s)
    }
    
    if sonuc == 1 {
        tekler.append(s)
    }
    
}

print("Tek Sayılar")
print(tekler)

print("Çift Sayılar")
print(ciftler)


//ARRAY İLE RASTGELE SAYI OLUSTURMA

var sayilar6 = [Int]()


for _ in 1...10 {
    let random = Int(arc4random_uniform(UInt32(10)))
    print(random)
    sayilar6.append(random)
    
}
sayilar6.sort()
print(sayilar6)


//ARRAY İLE KARNE UYGULAMASI

var notlar = [Int]()
var dersler = [String]()

dersler.append("Tarih")
notlar.append(20)

dersler.append("Fizik")
notlar.append(80)

dersler.append("Matematik")
notlar.append(100)

dersler.append("Biyoloji")
notlar.append(40)

var toplam2 = 0

for i in 0...(notlar.count - 1) {
    print("Dersler: \(dersler[i]) - Notlar: \(notlar[i])")
    toplam2 += notlar[i]
}

print("********")
print("Ortalama: \(toplam2/dersler.count)")


//ARRAY İLE İSİM ARAMA

var isimler: [String] = ["Berk","Ali","Ahmet","Berk"]

var isimKontrol = "Berkk"

for _ in isimler {
    if isimler.contains(isimKontrol) {
        print("Bu isim dizide mevcuttur")
        break
    } else {
        print("Bu İsim dizide mevcut değildir")
        break
    }

}


//ALTERNARİF İSİM ARAMA

print("*****")

var isimlerTwo: [String] = ["Berk","Ali","Ayşe","Hasan Arat"]

var isimKontrolTwo = "BerkK"

var isimKontrolBool = false

for i in isimlerTwo {
    
    if i == isimKontrolTwo {
        isimKontrolBool = true
        break
    }
    
}

if isimKontrolBool {
    print("Bu isim mevcuttur \(isimKontrolTwo)")
} else {
    print("Bu isim mevcut değildir.")
}
