//
//  SplashScreenViewController.swift
//  CryptoExchange
//
//  Created by  Daniel Hong on 5/2/22.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
    
}
