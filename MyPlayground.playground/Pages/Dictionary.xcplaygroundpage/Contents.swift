//: [Previous](@previous)

import Foundation

var myFavoriteDirectors = [
    "Pulp Fiction" : "Tarantino",
    "Lock Stock" : "Guy Ritchie",
    "The Dark Knight" : "Cristopher Nolan"
]

//Anahtar'ı yani Key'i yazarsak bize value yani değer'ini getirir.
myFavoriteDirectors["Pulp Fiction"]

//Key'i çağırıp eşitleyip değerini değiştirebiliriz
myFavoriteDirectors["Lock Stock"] = "Berk"


//Yeni bir key ve value ekleyerek yeni eleman ekleyebiliriz.
myFavoriteDirectors["Yeni Key"] = "Yeni Eleman"



///EKSTRA

//DİCTİONARY TANIMLAMA

var dic1 = [Int:String]()

var dic2 = [3.14: "Pi", 2.71:"e"]

var dic3: [Int:String] = [1: "Bir", 2: "İki", 3: "Üç"]

var iller = [16: "Bursa", 34: "İstanbul", 6: "Ankara"]

iller[34]

iller[35] = "İzmir"

iller[16] = "Yeni Bursa"

iller.updateValue("Yeni İzmir", forKey: 35)

print(iller)

//DÖNGÜ İLE ALMA

for (anahtar, i) in iller {
    print("Anahtar \(anahtar) - İl\(i)")
}


iller.removeValue(forKey: 35) //Veri Silme

iller.isEmpty
iller.count
iller.first

print(iller)


var ters = iller.reversed()
print(ters)


//DİCTİONARY FİLTRELEME

var okul: [Int:String] = [154:"Ahmet", 67:"Mehmet", 871:"Zeynep", 45:"Berk"]

//$0 dictionaryi temsil eder.
//key filtreleme
var sonucDic1 = okul.filter({$0.key > 70})
print(sonucDic1)

//Value filtreleme
var sonucDic2 = okul.filter({$0.value == "Ahmet"})
print(sonucDic2)

//Value Ve Key Filtreleme
var sonucDic3 = okul.filter({$0.value == "Berk" && $0.key < 70})
print(sonucDic3)




//DİCTİONARY KARNE

var dersNotlar = [String:Int]()

dersNotlar["Tarih"] = 20
dersNotlar["Matematik"] = 100
dersNotlar["Fizik"] = 10
dersNotlar["Kimya"] = 40
dersNotlar["İngilizce"] = 70

var toplam = 0

for (ders, not) in dersNotlar {
    print("\(ders) - \(not)")
    toplam += not
}

print("****")
print("Ortalama: \(toplam/dersNotlar.count)")
