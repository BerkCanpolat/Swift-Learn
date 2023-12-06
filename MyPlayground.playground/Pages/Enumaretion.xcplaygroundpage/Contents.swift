//: [Previous](@previous)

import Foundation

enum Renkler {
    case Beyaz
    case Siyah
}

var renk = Renkler.Siyah

switch renk {
case .Beyaz:
    print("#FFFFF")
case .Siyah:
    print("#00000")
}


///ÖRNEK

enum KonserveBoyut {
    case Kucuk
    case Orta
    case Buyuk
}

var boyut = KonserveBoyut.Kucuk

func ucretAl(boyut:KonserveBoyut) {
    
    switch boyut {
    case .Kucuk:
        print(20 * 30)
    case .Orta:
        print(10 * 10)
    case .Buyuk:
        print(1 * 1)
    }
    
}

ucretAl(boyut: .Orta)
