//
//  CoinDetailsVC.swift
//  Crypto Currency Value
//
//  Created by Patryk Soliński on 02/08/2021.
//

import UIKit
import RxSwift
import SwiftyJSON

class CoinsDetailsVC: UIViewController {
    
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinValue: UILabel!
    
    let disposeBag = DisposeBag()
    
    private let coinOfTheDay = PublishSubject<Coin>()
        
    var selectedCoin: Observable<Coin> {
        return coinOfTheDay.asObservable()
    }
    
    var singleCoin = Coin(coinData: JSON())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinName.text = singleCoin.coinName
        coinValue.text = singleCoin.coinPrice
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coinOfTheDay.onCompleted()
    }
    
    @IBAction func setCoinOfTheDay(_ sender: UIButton) {
        
        self.showMessage("Coin \(singleCoin.coinName) was selected", description: "")
        coinOfTheDay.onNext(singleCoin)
    }
    
    func showMessage(_ title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
            
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
