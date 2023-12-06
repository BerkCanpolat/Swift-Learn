//: [Previous](@previous)

import Foundation

let ifade = {
    print("Closure Konusuna Hoşgeldin!")
}

ifade()


let toplama = {
    (sayi1:Int, sayi2:Int) -> Int in
    return sayi1 + sayi2
}

let sonuc = toplama(10,20)
print(sonuc)


///ŞART YAZMA

var sayilar:[Int] = [5,10,-6,75,20]

let siralama1 = sayilar.sorted(by: {sayi1,sayi2 in sayi1 > sayi2})
let siralama2 = sayilar.sorted(by: {n1,n2 in n1 < n2})

print(siralama1)
print(siralama2)
