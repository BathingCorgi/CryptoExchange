//
//  DetailViewController.swift
//  CryptoExchange
//
//  Created by  Daniel Hong on 5/2/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var name: String = "nil"
    var crypto = Cryptos()
    var cryptoListVC = CryptoListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel?.text = self.name
        
        crypto.getData(coin: self.name){
            DispatchQueue.main.async {
                print("done")
                print(self.crypto.price)
                self.moneyLabel.text = String(format: "%.2f", self.crypto.price)
            }
        }
        
        

    }
    


}
