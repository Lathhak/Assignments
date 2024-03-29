//
//  ViewController.swift
//  BitCoin
//
//  Created by Sharan on 10/23/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var pickerLabel: UIPickerView!
    var coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        pickerLabel.dataSource = self
        pickerLabel.delegate = self
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    

}

extension ViewController: CoinManagerDelegate {
    func manageCoin(price: String, currency: String) {
        DispatchQueue.main.async{
        self.bitCoinLabel.text = price
        self.currencyLabel.text = currency
        }
    }
    
    
}
