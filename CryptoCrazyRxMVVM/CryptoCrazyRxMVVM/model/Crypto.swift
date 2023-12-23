//
//  Crypto.swift
//  CryptoCrazyRxMVVM
//
//  Created by Berk Canpolat on 23.12.2023.
//


//Bana gelen veriyi json olarak gelen veriyi kendi okuyacağım şekilde çevirmek istiyorsam Decode ediyorum.
//Bazen biz bir veriyi alıp Encode edip Json şeklinde sunucuya geri yollamak zorunda kalabiliriz.
//Cobable bu iki mantığıda kullanmamızı sağlıyor.

import Foundation

struct Crypto : Decodable{
    let currency:String
    let price:String
}
