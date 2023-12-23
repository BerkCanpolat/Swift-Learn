//
//  ViewController.swift
//  CryptoCrazyRxMVVM
//
//  Created by Berk Canpolat on 23.12.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var cryptoList = [Crypto]()
    let cryptoVM = CryptoViewModel()
    //Yaptığımız callbackler network işlemleri rxswift işlemleri hafızada yer tutuyor onun için bu yapıyı kullanırsak uygulama daha rahat çalışır. Çünkü bu yapıyı kullandığımız zaman hangi fonksiyona verdiysek o fonksiyonu temizle bitir diyoruz aslında.
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setupBinding()
        cryptoVM.requestData()
        

    }
    
    private func setupBinding() {
        
        cryptoVM.loading.bind(to: self.indicatorView.rx.isAnimating).disposed(by: disposeBag)
        
        //subscribe(onNext) kullanıyoruz burada.
        cryptoVM.error.observe(on: MainScheduler.asyncInstance).subscribe { errorString in
            print(errorString)
        }.disposed(by: disposeBag)
        
        cryptoVM.cryptos.observe(on: MainScheduler.asyncInstance).subscribe { cryptos in
            self.cryptoList = cryptos
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }


}

