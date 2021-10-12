//
//  StoreModel.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import Foundation

protocol StoreModelDelegate {
    func retrieveStoreData(_ store: [Datas])
}

class StoreModel {
    var delegate: StoreModelDelegate?
    
    func getStore() {
        let urlString = "https://dl.lig.com.tw/misc/quiz/test.json"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let storeResponse = try decoder.decode(StoreResponse.self, from: data)
                let storeDatas = storeResponse.data
                DispatchQueue.main.async {
                    self?.delegate?.retrieveStoreData(storeDatas)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
