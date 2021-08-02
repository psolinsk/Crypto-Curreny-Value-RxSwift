//
//  Coin.swift
//  Crypto Currency Value
//
//  Created by Patryk Soliński on 02/08/2021.
//

import Foundation
import SwiftyJSON

struct Coin {
    
    private(set) var coinName: String
    private(set) var coinPrice: String
    
    init(coinData: JSON) {
        coinName = coinData.dictionary?["name"]?.string ?? "no data"
        coinPrice = coinData.dictionary?["price_usd"]?.string ?? "no data"
    }
}
