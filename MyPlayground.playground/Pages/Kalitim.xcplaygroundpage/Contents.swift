//: [Previous](@previous)

import Foundation

class Arac {
    
    var renk:String?
    
    init(renk:String) {
        self.renk = renk
    }
    
}

class Araba:Arac {
    var vites:String?
    
    init(vites:String, renk:String) {
        self.vites = vites
        super.init(renk:renk)
    }
}

class Nissan:Araba {
    var model:String?
    
    init(model:String, renk:String, vites:String) {
        self.model = model
        super.init(vites:vites,renk:renk)
    }
}

var a1 = Nissan(model: "Nissan", renk: "Kırmızı", vites: "4")

print(a1.model!)
print(a1.renk!)
print(a1.vites!)



///OVERRİDE ÖRNEK
///POLYMORPHİSM ÖRNEĞİ
///OVERRİDE olduğu için override olduğu yerde kendisini çalıştırır. Eğer override olmasaydı en üstteki superclası çalıştırırdı.

class Hayvan {
    func sesCikar() {
        print("Sesim yok")
    }
}


class Memeli:Hayvan {
    
}

class Kedi:Memeli {
    override func sesCikar() {
        print("Miyav Mİyav mrrr")
    }
}

class Kopek:Memeli {
    override func sesCikar() {
        print("Hav hav hav hrr hav")
    }
}

var hayvan = Hayvan()

hayvan.sesCikar()

var memeli = Memeli()

memeli.sesCikar()


var kedi = Kedi()

kedi.sesCikar()


var kopek = Kopek()

kopek.sesCikar()

//poly
var h:Hayvan = Kedi()
h.sesCikar()




///TİP DÖNÜŞÜMÜ
///is: Tip kontrolü için kullanılır
///as: (upcasting) bir tipi başka bir tipe dönüştürür
///as!:(Force Downcasting) bir tipi başka bir tipe dönüştürmek için kullanılır. Dönüşüm sırasında başarısız olursa hata, başarılı olursa ise değeri döndürür.
///as?:(For Optional Downcasting) Dönüşüm sırasında bir veri geliyorsa. Dönüşüm sırasında başarısız olursa nil, başarılı ise değeri dönüştürür.


class Personel {
    func iseAlindi() {
        print("Personel Mutlu")
    }
}

class Mudur:Personel {
    func iseAl(p:Personel) {
        p.iseAlindi()
    }
    
    func terfiEttir(p:Personel) {
        if p is Ogretmen {
            (p as! Ogretmen).maasArttir()
        }
        
        if p is Isci {
            print("İşçiler terfi alamaz")
        }
    }
}


class Isci:Personel {
    
}

class Ogretmen:Personel {
    func maasArttir() {
        print("Maaş arttı öğremen mutlu")
    }
}

var ogretmen:Personel = Ogretmen()
var isci:Personel = Isci()

var mudur = Mudur()

mudur.iseAl(p: isci)
mudur.iseAl(p: ogretmen)

mudur.terfiEttir(p: ogretmen)
mudur.terfiEttir(p: isci)
