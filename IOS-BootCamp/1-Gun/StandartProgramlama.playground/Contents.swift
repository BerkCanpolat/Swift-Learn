import UIKit

///Karşılaştırma operatörleri
var a = 40
var b = 50

var x = 90
var y = 80

print("a == b : \(a == b)")
print("a != b : \(a != b)")
print("a > b : \(a > b)")
print("a >= b : \(a >= b)")
print("a < b : \(a < b)")
print("a <= b : \(a <= b)")


///IF
var yas = 19
var isim = "Ahmet"

if yas >= 18 {
    print("Reşitsiniz")
} else {
    print("Reşit Değilsiniz")
}

if isim == "Ahmet" {
    print("Merhaba Ahmet")
} else {
    print("İsminiz Ahmet değil")
}

var ka = "admin"
var sifre = 12345

if ka == "admin" && sifre == 12345 {
    print("Giriş Başarılı")
} else {
    print("Giriş Başarısız")
}

var sonuc = 9

if sonuc == 9 || sonuc == 10 {
    print("Sonuç 9 veya 10'dur")
} else {
    print("Sonuç 9 veya 10 Değildir")
}

///Switch
var gun = 3

switch gun {
case 3:
    print("Pazartesi")
case 4:
    print("Salı")
default:
    print("Geçersiz rakam")
}



///Döngüler(for-while)

for x in 1...3 {
    print(x)
}

//10 ile 20 arasında 5 er artış

var baslangic = 10
var bitis = 20
var artis = 5

for a in stride(from: baslangic, through: bitis, by: artis) {
    print(a)
}

//20 ile 10, 5 er azalış

var baslangic1 = 20
var bitis1 = 10
var artis1 = -5

for a in stride(from: baslangic1, through: bitis1, by: artis1) {
    print("Azalış: \(a)")
}


var whileSayac = 1

while whileSayac < 4 {
    print("While Sayaç: \(whileSayac)")
    whileSayac += 1
}


for i in 1...5 {
    if i == 3 {
        break
    }
    print("Döngü break: \(i)")
}



for i in 1...5 {
    if i == 3 {
        continue
    }
    print("Döngü continue: \(i)")
}
