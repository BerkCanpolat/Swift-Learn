import UIKit

//Tanımlama
var mesaj = "Merhaba"

var str:String?

str = "Merhaba"

if str != nil {
    print(str!)
} else {
    print("Str nil değer içeriyor")
}


//Optional binding

if let temp = str {
    print(temp) //otomatik unwrap
} else {
    print("str nil değer içeriyor")
}
