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
