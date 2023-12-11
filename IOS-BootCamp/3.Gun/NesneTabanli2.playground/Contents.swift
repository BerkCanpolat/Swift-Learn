import UIKit

class Ev {
    var pencereSayisi:Int?
    
    init(pencereSayisi:Int) {
        self.pencereSayisi = pencereSayisi
    }
}


class Saray:Ev {
    var kuleSayisi:Int?
    
    init(kuleSayisi:Int,pencereSayisi:Int) {
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}


class Villa:Ev {
    var garajVarmi:Bool?
    
    init(garajVarmi:Bool,pencereSayisi:Int) {
        self.garajVarmi = garajVarmi
        super.init(pencereSayisi: pencereSayisi)
    }
    
}


let topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 300)
let bogazVilla = Villa(garajVarmi: true, pencereSayisi: 30)

print(topkapiSarayi.kuleSayisi!)
print(topkapiSarayi.pencereSayisi!)

print(bogazVilla.garajVarmi!)
print(bogazVilla.pencereSayisi!)


///

class Hayvan {
    func sesCikar() {
        print("Sesim yok")
    }
}

class Memeli:Hayvan {
    
}

class Kedi:Memeli {
    override func sesCikar() {
        print("Miyav miyav")
    }
}

class Kopek:Memeli {
    override func sesCikar() {
        print("Havvhav ulan havvv")
    }
}

var h = Hayvan()

h.sesCikar()

var m = Memeli()
m.sesCikar()

var k = Kedi()
k.sesCikar()

var kopke = Kopek()
kopke.sesCikar()



///TÜR DÖNÜŞÜMÜ
///Upcasting

var ev = Saray(kuleSayisi: 3, pencereSayisi: 10) as Ev

///Downcasting
var saray = Ev(pencereSayisi: 6) as? Saray

///Tip Kontrolü
///ev nesnesi Ev'den mi türedi?
if ev is Ev {
    print("Nesne ev sınıfından çalıştı")
} else {
    print("Nesne ev sınıfından değildir.")
}


///PROTOCOL

protocol MyProtocol {
    var degisken:Int {get set}//set değer okuma,get değer atama
    
    func metod1()
    func metod2() -> String
}

class ClassA:MyProtocol {
    var degisken: Int = 10
    func metod1() {
        print("Metod1 çalıştı")
    }
    func metod2() -> String {
        return "Metod 2 çalıştı"
    }
}

var a = ClassA()

print(a.degisken)
a.metod1()
print(a.metod2())


///EXTENSİON

//self kendi class ını genişletmek istediğimiz class ı temsil ediyor(Int)
extension Int {
    func carp(sayi:Int) -> Int {
        return self * sayi
    }
}

let x = 3.carp(sayi: 5)
print(x)


///CLOSURE

let ifade = {
    print("Merhaba")
}

ifade()
