import UIKit

var greeting = "Hello, playground"

//Variables(değişken)

var myNumber = 5 * 5

print(myNumber)

10 * 5

//Bu yazım türüne "camilCase" denir. Ve genelde bu kullanılır.

var userName = "Berk"

print(userName)

//Mevcut Text'imizin sonuna ekler

userName.append("Ekledim")

//Mevcut Text'imizin bütün harflerini küçültür

userName.lowercased()

//Mevcut Text'imizin bütün harflerini büyültür

userName.uppercased()

print(userName)

//Bu yazım türüne "Snack Case" denir.

//var user_sur_name = "Canpolat"

//Constants(sabit)

//Integer & Double & Float

//Integer

let userAge = 24

let myVariable = 4

userAge / myVariable

//Double

let userAgeD = 50.0

let myNumberD = 4.0

userAgeD / myNumberD

//Bool

var myBoolean = false

myBoolean = true

let myString: String = "50"

let anotherNumber: Int = 30

//define

var myVerib: String

myVerib = "Test"

myVerib.uppercased()


///EKSTRA

var urunID: Int = 3416
var urunAdi: String = "Kol Saati"
var urunAdet: Int = 100
var urunFiyat: Double = 146.99
var urunTedarikcisi: String = "Rolex"

print("Ürün ID: \(urunID) - Ürün Adı: \(urunAdi) - Ürün Adet: \(urunAdet) - Ürün Fiyat: \(urunFiyat) - Ürün Tedarikci: \(urunTedarikcisi)")

print(1.0,2.0,3.0,4.0, separator: "-")


var sayi1 = 30, sayi2 = 40, kelime = "Merhaba", harf = "f"

print(sayi1)
print(sayi2)
print(kelime)
print(harf)


//Tür Dönüşümü
var i: Int = 42
var d: Double = 42.45
var f: Float = 42.89

var sonuc: Int = Int(d)
var sonuc2: Double = Double(i)
var sonuc3: Int = Int(f)

print(sonuc)
print(sonuc2)
print(sonuc3)

var str1 = String(i)
var str2 = String(d)
var str3 = String(f)

print("-----")
print(str1)
print(str2)
print(str3)


var kisi = ("Berk","Ali")

var ad = kisi.0
var soyad = kisi.1
