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





///EKSTRA


//ALAN HESAPLAMA IF

print("Dikdörtgen Alanı (1)")
print("Çember Alanı (2)")

let secim = 2
let kisaKenar = 10
let uzunKenar = 20
let yariCap = 4

print("Seçiminiz \(secim)")

if secim == 1 {
    print("Dikdörtgen Alanı")
    print("Kısa Kenar: \(kisaKenar)")
    print("Uzun Kenar: \(uzunKenar)")
    let alan = kisaKenar * uzunKenar
    print("Sonuç: \(alan)")
}

if secim == 2 {
    print("Çember Alanı")
    print("Yarı Çap: \(yariCap)")
    let alan = 3.14 * Double(yariCap) * Double(yariCap)
    print("Sonuç: \(alan)")
}


//DÖRT İŞLEM

print("***********")
print("Toplama (1)")
print("Çıkarma (2)")
print("Çartpma (3)")
print("Bölme(4)")

let secimIslem = 1

let sayi1 = 10
let sayi2 = 20

print("Tercihiniz: \(secimIslem)")

if secimIslem == 1 {
    print(sayi1 + sayi2)
}


if secimIslem == 2 {
    print(sayi1 - sayi2)
}

if secimIslem == 3 {
    print(sayi1 * sayi2)
}


if secimIslem == 4 {
    print(sayi1 / sayi2)
}




///SWİTCH YAPISI


var girdi = 10

switch girdi {
case 100 :
    print("Girdi, 100'e eşittir")
case 10,15 :
    print("Girdi, 10 Veya 15'e eşittir")
case 5 :
    print("Girdi, 5'e eşittir")
default :
    print("Girdi, Durumların hiçbirine uygun değildir")
}

//SWİTCH DÖRT İŞLEM


print("***********")
print("Toplama (1)")
print("Çıkarma (2)")
print("Çartpma (3)")
print("Bölme(4)")

var switchSecim = 1

var switchSayi1 = 10
var switchSayi2 = 20

print("Tercihiniz \(switchSecim)")

switch switchSecim {
case 1 :
    print(switchSayi1 + switchSayi2)
case 2 :
    print(switchSayi1 - switchSayi2)
case 3 :
    print(switchSayi1 * switchSayi2)
case 4 :
    print(switchSayi1 / switchSayi2)
default :
    print("Geçersiz İşlem")
}

