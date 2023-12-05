//: [Previous](@previous)

import Foundation

var mySet : Set = [1,2,3,4,5]

print(mySet)


var myStringSet : Set = ["a","b","c","a"]

print(myStringSet)

var myArray = [1,2,3,1,2,5,6]
var mySetList = Set(myArray)
print(myArray)
print(mySetList)


var unionSet1: Set = [1,2,3]
var unionSet2: Set = [3,4,5]

var myUnion = unionSet1.union(unionSet2)
print(myUnion)
    





///EKSTRA
print("***")

//SET TANIMLAMA YÖNTEMLERİ

var sayilar = Set<Int>()

var meyveler: Set = ["Çilek","Muz","Kivi","Elma"]

var sehirler: Set<String> = ["Bursa","Ankara","İstanbul"]


//SET İŞLEMLERİ

var sayilar2 = Set<Int>()

sayilar2.insert(10)
print(sayilar2)

sayilar2.isEmpty
sayilar2.contains(10)
sayilar2.sorted()
sayilar2.remove(10) //index numarasına göre değil verinin içeriğine göre silme işlemi.
sayilar2.count
sayilar2.first
sayilar2.max()
sayilar2.min()





//SET VERİLERİN ALINMASI

var numara = Set<Int>()

numara.insert(10)
numara.insert(20)
numara.insert(30)
numara.insert(40)

for i in numara {
    print(i)
}


//SET'İN YAPISINA ÖZGÜ HER KARAKTERİ 1 DEFA GÖSTERİR

let tekler: Set = [1,3,5,7,9]
let ciftler: Set = [0,2,4,6,8,1]
let asal: Set = [2,3,5,7]

let dizi = tekler.union(ciftler).sorted() //Union birleştirir.
print(dizi)

let dizi2 = tekler.intersection(ciftler).sorted() //Kesişen noktayı verir.
print(dizi2)
