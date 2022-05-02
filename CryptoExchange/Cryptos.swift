//
//  Cryptos.swift
//  CryptoExchange
//
//  Created by  Daniel Hong on 5/2/22.
//

import Foundation

class Cryptos {
    struct Returned: Codable {
        var rate: Double
    }
    var price: Double = 100.00
    //let coins = ["BTC", "LTC", "DOGE", "ETH", "BNB" ]

    func getData(coin: String, completed: @escaping () -> ()) {
        
        var urlString = "https://rest.coinapi.io/v1/exchangerate/\(coin)/USD?apikey=56B1DFCB-29B6-42EC-8E87-98A3ED77985A"
    
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a url from \(coin)")
            return
        }
        
        
        let session = URLSession.shared
        print("Accessing \(coin)")
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print (" ERROR: \(error.localizedDescription)")
                return
            }
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                print ("Here is what was returned \(returned.rate)")
                self.price = returned.rate
                completed()
                return
            } catch {
                print ("JSON ERROR: thrown when we tried to decode from Returned.self with data")
                return
            }
            completed()
        }
        task.resume()
    }

    
}
