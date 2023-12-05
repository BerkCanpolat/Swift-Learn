//: [Previous](@previous)

import Foundation

class Otobus {
    var kapasite:Int?
    var nereden:String?
    var nereye:String?
    var mevcutYolcu:Int?
    
    
    func yolcuAl(al:Int) {
        mevcutYolcu! += al
    }
    
    func yolcuindir(indir:Int) {
        mevcutYolcu! -= indir
    }
    
    func nereyeGit(git:String) {
        nereye = git
    }
    
    func nereyeGel(gel:String) {
        nereden = gel
    }
    
    
    func bilgiAl() {
        print("Kapasite: \(kapasite!)")
        print("Nereden: \(nereden!)")
        print("Nereye: \(nereye!)")
        print("Mevcut Yolcu: \(mevcutYolcu!)")
    }
    
}

let kamilkoc = Otobus()

kamilkoc.kapasite = 20
kamilkoc.mevcutYolcu = 10
kamilkoc.nereye = "Ankara"
kamilkoc.nereden = "İstanbul"

kamilkoc.bilgiAl()

print("*****")
kamilkoc.yolcuAl(al: 5)
kamilkoc.bilgiAl()

print("*************")
kamilkoc.yolcuindir(indir: 2)
kamilkoc.bilgiAl()

print("**********")
kamilkoc.nereyeGit(git: "İzmir")
kamilkoc.nereyeGel(gel: "Muğla")
kamilkoc.bilgiAl()
