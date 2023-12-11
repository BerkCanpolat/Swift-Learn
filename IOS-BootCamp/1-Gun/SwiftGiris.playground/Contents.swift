import UIKit

print("Merhaba Dünya!")

var ogrenciAdi = "Berk"
var ogrenciYas = 24
var ogrenciBoy = 1.78
var ogrenciBasHarfi = "B"
var ogrenciDevamEdiyorMu = true
print(ogrenciAdi)

var urun_id:Int = 3416
var urun_adi:String = "Macbook Pro"
var urun_adet:Int = 100
var utun_fiyat:Int = 34999
var urun_tedarikci:String = "Apple"

print("Ürün id: \(urun_id)")
print("Ürün Adı: \(urun_adi)")
print("Ürün Adet: \(urun_adet)")
print("Ürün Fiyat: \(utun_fiyat)")
print("Ürün Tedarikci: \(urun_tedarikci)")


///Constant - Sabitler
///let

var sayi = 10
print(sayi)
sayi = 20
print(sayi)

let numara = 100
print(numara)


///Tür Dönüşümü - Type Casting


//Sayısaldan sayısala
var i = 42
var d = 56.78

var sonuc1 = Double(i)
var sonuc2 = Int(d)
print(sonuc1)
print(sonuc2)

//Sayısaldan Metine

var sonuc3 = String(i)
var sonuc4 = String(d)
print(sonuc3)
print(sonuc4)


//Metinden sayısala
var yazi = "34"

if let sonuc5 = Int(yazi){
    print(sonuc5)
}
