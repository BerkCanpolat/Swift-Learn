//: [Previous](@previous)

import Foundation

func myFunction() {
    print("Fonksiyonum çalıştı")
}

myFunction()


func mySumFunctions(x:Int, y:Int) -> Int {
    return x + y
}

let myFunctionsVariable = mySumFunctions(x: 12, y: 12)

print(myFunctionsVariable)

func logicFunction(x:Int, y:Int) -> Bool {
    if x > y {
        return true
    } else{
        return false
    }
}

logicFunction(x: 5, y: 20)


func stringFunction(x:Int,y:Int) -> String {
    if x > y {
        return "X büyüktür Y"
    } else {
        return "X küçüktür Y"
    }
}

stringFunction(x: 5, y: 12)



///EKSTRA


//void metodlar sadece işlem yapar

func selamlar() {
    let sonuc = "Merhaba Berk"
    print(sonuc)
}
 selamlar()


func selamla1() -> String {
    let sonuc = "Hello"
    return sonuc
}

let gelenVeri = selamla1()
print(gelenVeri)

//Dışarıdan parametre almak

func selamla2(isim:String) {
    let sonuc = "Merhaba \(isim)"
    print(sonuc)
}

selamla2(isim: "Berk")

func toplama() {
    let sonuc = 30 + 30
    print(sonuc)
}

toplama()

func toplama1() -> Int {
    let sonuc = 20 + 30
    return sonuc
}

let gelenToplam = toplama1()
print(gelenToplam)


func toplama2(sayi1:Int, sayi2:Int) -> Int {
    let sonuc = sayi1 + sayi2
    return sonuc
}

let gelenToplam2 = toplama2(sayi1: 12, sayi2: 12)
print(gelenToplam2)


//FONKSİYONLARA SINIF İÇERİSİNDEN ERİŞİM

print("****CLAS*****")
class Matematik {
    func topla(sayi1:Int,sayi2:Int) {
        let sonuc = sayi1 + sayi2
        print("Toplam Sonuç: \(sonuc)")
    }
    
    func cikar(sayi1:Double,sayi2:Double) -> Double {
        let sonuc = sayi1 - sayi2
        return sonuc
    }
    
    func carp(sayi1:Int,sayi2:Int,isim:String) {
        let sonuc = sayi1 * sayi2
        print("Çarpım Sonucu: \(sonuc) - Yapan kişi: \(isim)")
    }
    
    func bol(sayi1:Double, sayi2:Double) -> String {
        return "Bölme Sonucu: \(sayi1/sayi2)"
    }
    
}

var mat = Matematik()

mat.topla(sayi1: 24, sayi2: 32)

let cikarma = mat.cikar(sayi1: 22, sayi2: 12)
print(cikarma)

mat.carp(sayi1: 22, sayi2: 22, isim: "Bro")

let bolme = mat.bol(sayi1: 24, sayi2: 4)
print(bolme)


//BİRDEN FAZLA DÖNÜŞ DEĞERİ

func islem(sayilarx:[Int]) -> (toplam:Int, carpma:Int) {
    var toplam = 1
    var carpma = 1
    
    for i in sayilarx {
        toplam += i
        carpma *= i
    }
    
    return (toplam,carpma)
    
}

var dizi = [1,2,3,4,5]

let b = islem(sayilarx: dizi)

print(b.toplam)
print(b.carpma)


//GERİ DÖNÜŞ DEĞERİNİN OPTİONAL YAPILMASI

func hesapla(sayi1:Int,sayi2:Int) -> Int? {
    let islem = sayi1*2 + sayi2*4
    return islem
}

var a = hesapla(sayi1: 12, sayi2: 12)
print("İşlem Sonucu: \(a!)")

if let t = a {
    print("Sonuc: \(t)")
}
