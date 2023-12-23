//
//  WebService.swift
//  CryptoCrazyRxMVVM
//
//  Created by Berk Canpolat on 23.12.2023.
//

import Foundation

enum CryptoError : Error {
    case serverError
    case parsingError
}

class WebService {
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto],CryptoError>) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                //Serverden veri gelmedi anlamına gelir.
                completion(.failure(CryptoError.serverError))
            } else if let data = data {
                //Burada nil kontrolü yapıyoruz ve veri geldiyse alıyoruz.
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList {
                    completion(.success(cryptoList))
                } else {
                    //Serverdan veri geldi ama biz pars edemedik anlamına gelir.
                    completion(.failure(CryptoError.parsingError))
                }
            }
        }.resume() //Çalışması için gerekli.
    }
    
}
