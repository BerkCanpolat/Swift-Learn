//: [Previous](@previous)

import Foundation

var number = 0

while number <= 10 {
    print(number)
    number += 1
}

var characterAlive = true

while characterAlive == true {
    print("Karakter Yaşıyor")
    characterAlive = false
}


//For Loop

var myFruitArray = ["Banana","Apple","Orange"]

for fruit in myFruitArray {
    print(fruit)
}

var myNumbers = [10,20,30,40,50,60]

for num in myNumbers {
    print(num / 5)
}

for mynewinteger in 1 ... 5 {
    print(mynewinteger)
}





///EKSTRA


for _ in 1...3 {
    print("Merhaba")
}

var baslangic = 10
var bitis = 20
var artis = 5

for a in stride(from: baslangic, through: bitis, by: artis) {
    print(a)
}

//TERSTEN SAYDIRMA
print("**********")
var baslangic1 = 20
var bitis1 = 0
var artis1 = -5

for b1 in stride(from: baslangic1, through: bitis1, by: artis1) {
    print(b1)
}


///WHİLE DÖNGÜSÜ
print("**********")
var sayac = 1

while sayac <= 4 {
    print(sayac)
    sayac += 1
}



///ÖRNEKLER

for den in 3...6 {
    print("Döngü1: \(den)")
}

var dongu = 3

while dongu < 7 {
    print("Döngü While 1: \(dongu)")
    dongu += 1
}

//0 ile 8 arasında 2'şerli artış
var baslangic2 = 0
var bitis2 = 8
var artis2 = 2

for o1 in stride(from: baslangic2, through: bitis2, by: artis2) {
    print("O1: \(o1)")
}

var whileo1 = 0

while whileo1 < 9 {
    print("While o1: \(whileo1)")
    whileo1 += 2
}


//0 ile 8 arasında 2'şerli azalsın

var baslangic3 = 8
var bitis3 = 0
var artis3 = -2

for o2 in stride(from: baslangic3, through: bitis3, by: artis3) {
    print("o2: \(o2)")
}


var whileo2 = 8

while whileo2 > -1 {
    print("While o2: \(whileo2)")
    whileo2 -= 2
}


//FOR İSİM TEKRARLAMA
var isim = "Berk"

for i in 1...5 {
    print("\(i) - İsim: \(isim)")
}


var harfSayisi = isim.count

for i in 1...harfSayisi {
    print("\(i) - \(isim)")
}



//BREAK CONTİNUE

var index = 1

while index < 6 {
    
    if (index == 4) {
        break
    }
    
    print("Sonuç: \(index)")
    index += 1
}


for indeks in 1...5 {
    if (indeks == 3) {
        continue
    }
    print(indeks)
}



//RASTGELE SAYI ÜRETME

for _ in 1...10 {
    let random = Int(arc4random_uniform(UInt32(10)))
    print("Rastgele Sayı: \(random)")
}
