//
//  CoinManager.swift
//  BitCoin
//
//  Created by Sharan on 10/23/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate {
    func manageCoin(price: String, currency: String)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency : String) {
        let stringURL = baseURL + currency
     
        
         let url = URL(string: stringURL)
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data , let decodedValue = try? JSONDecoder().decode(CoinCollector.self, from: data) else {return}
            let stringValue = String(format:"%.2f", decodedValue.last)
            print(data)
            self.delegate?.manageCoin(price: stringValue, currency: currency)
        }
        dataTask.resume()
            
    }
    
}
