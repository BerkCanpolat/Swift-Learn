import UIKit

//Nums'daki iki sayının toplamı targeta yani 26 ya eşit olucak. Bu iki sayıyı nasıl yazdırabiliriz?
var nums = [2,7,11,15]
var target = 26

for i in nums {
    
    for (index,j) in nums.enumerated() {
        if i + j == target {
            //print("\(i) - \(j)")
            print(index)
        }
    }
    
}


// 2. soru = Verilen kelimenin tersini ekrana yazdırınız.

var str = "Berk-Beşiktaş-Araba-Dünya"

var array = str.split(separator: "-")

var b = ""

for i in array {
    
    for j in i.reversed() {
        b += "\(j)"
    }
    b += "-"
    
}
b.removeLast()
print(b)


//2.yol
var str2 = "Berk-Beşiktaş-Araba-Dünya"

var array2 = str2.split(separator: "-")

var s = ""

for i in array2 {
    var i = String(i.reversed())
    s += i + "-"
    
}
s.removeLast()
print(s)


// Verilen kelimenin ekrana tersten yazdırılması farklı method.
var rts = "Hello"

var yarray = [Character]()

for i in rts {
    yarray.append(i)
}
print(yarray)

for i in stride(from: yarray.count - 1, through: 0, by: -1) {
    print(yarray[i], terminator: "")
}



//Swift 4.Soru
//Fibonacci
var a = 1
var b1 = 1
var c = 0

for _ in 1...7 {
    c = a + b1
    a = b1
    b1 = c
    print(c)
}


//Verilen metin içindeki rakamları bul ve toplamını yazdır. 10
//bQwer4yBjkMac3iyedi3

var sayiToplam = "bQwer4yBjkMac3iyedi3"

var sayiToplam2 = Array(sayiToplam)

var sum = 0

for i in sayiToplam2 {
    
    var a : Character = i
    
    if let b = a.wholeNumberValue {
        sum += b
    }
    
}
print(sum)

print("!'^+%&&/()=?__")


var sayiToplam3 = "bQwer4yBjkMac3iyedi3"

var aray = Array(sayiToplam3)

var topsums = 0

for i in aray {
    let a:Character = i
    
    if let b = a.wholeNumberValue {
        topsums += b
    }
}
print(topsums)

print("s--------")


func toplamBul(sayi1: Int, sayi2: Int) -> Int {
    let toplam = sayi1 + sayi2
    
    return toplam
    
}

// Örnek Kullanım
let sonuc = toplamBul(sayi1: 5, sayi2: 8)
print("Toplam: \(sonuc)")


func kareHesapla(sayi: Int) -> Int {
    let toplam = sayi * sayi
    return toplam
}

// Örnek Kullanım
let sayi = 4
let kareSonuc = kareHesapla(sayi: sayi)
print("\(sayi)'nin karesi: \(kareSonuc)")


func tersCevir(metin: String) -> String {
    return String(metin.reversed())
}

// Örnek Kullanım
let orjinalMetin = "Merhaba, Swift!"
let tersMetin = tersCevir(metin: orjinalMetin)
print("Orijinal Metin: \(orjinalMetin)")
print("Ters Çevrilen Metin: \(tersMetin)")





func ciftMiTekMi(sayi: Int) -> String {
    
    return (sayi % 2 == 0) ? "çift" : "tek"
    
}

// Örnek Kullanım
let sayi1 = 8
let sayi2 = 15

print("\(sayi1) \(ciftMiTekMi(sayi: sayi1))")
print("\(sayi2) \(ciftMiTekMi(sayi: sayi2))")

