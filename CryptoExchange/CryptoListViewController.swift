//
//  CryptoListViewController.swift
//  CryptoExchange
//
//  Created by  Daniel Hong on 5/2/22.
//

import UIKit

class CryptoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    var cryptoDetails: [CryptoDetail] = []
    var cryptoArray: [Crypto] = []
    var tableViewCoins = ["BTC", "LTC", "DOGE", "ETH", "BNB", "SOL", "XRP", "LUNA", "ADA", "SHIB", "WBTC", "EOS", "AXS", "GMT", "FTM", "UNI", "MANA", "XTZ", "FIL", "MIM"]
    
    var cryptos = Cryptos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CRYPTOCURRENCIES"
        
        /*
        var cryptoDetail = CryptoDetail(name: "BTC")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ETH")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "BNB")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "XRP")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "SOL")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "LUNA")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ADA")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "UST")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "DOGE")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "AVAX")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "DOT")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "SHIB")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "WBTC")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "DAI")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "MATIC")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "CRO")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "TRX")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "LTC")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "BCH")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "FTT")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "LINK")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "LEO")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ATOM")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "UNI")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "APE")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "XLM")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ALGO")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "XMR")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ETC")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "VET")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "FIL")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "HBAR")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ICP")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "MANA")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "EGLD")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "SAND")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "THETA")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "XTZ")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "CAKE")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "RUNE")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "GMT")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "EOS")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "KLAY")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "AAVE")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "FTM")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "AXS")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "KCS")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "ZEC")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "FLOW")
        cryptoDetails.append(cryptoDetail)
        cryptoDetail = CryptoDetail(name: "HNT")
        cryptoDetails.append(cryptoDetail)
        */
        
            
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let searchController = UISearchController()
        
        

        navigationItem.searchController = searchController
        present(searchController, animated: true, completion: nil)
        
        //cancel
        func wasCancelled(_ viewController: UISearchController) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            sender.title = "Edit"
            addBarButton.isEnabled = true
        } else {
            tableView.setEditing(true, animated: true)
            sender.title = "Done"
            addBarButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.name = tableViewCoins[selectedIndexPath.row]
        }
     }
    
    
}

extension CryptoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(tableViewCoins[indexPath.row])"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableViewCoins.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = tableViewCoins[sourceIndexPath.row]
        tableViewCoins.remove(at: sourceIndexPath.row)
        tableViewCoins.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        print(tableViewCoins[indexPath.row])
        self.currentSelected = tableViewCoins[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
     */
    
}
