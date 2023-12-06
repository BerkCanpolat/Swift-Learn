//: [Previous](@previous)

import Foundation

//Class referans tipi
//Structure değer tipi
//Referans hafıza yönetimi için idealdir.
//Değer tipleri ise basit işler için daha pratiktir.

class Ogrenci {
    var ad:String?
}

var ogrenci1 = Ogrenci()

ogrenci1.ad = "Ahmet"

var ogrenci2 = ogrenci1
ogrenci2.ad = "Mehmet"

print(ogrenci1.ad!)



//STRUCT

struct Kopek {
    var renk:String?
}

var kopek1 = Kopek()

kopek1.renk = "Kırmızı"

var kopek2 = kopek1
kopek2.renk = "Beyaz"

print(kopek1.renk!)
print(kopek2.renk!)


