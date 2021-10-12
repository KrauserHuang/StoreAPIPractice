//
//  Store.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import Foundation

struct StoreResponse: Codable {
    var data: [Datas]
}

struct Datas: Codable {
    var shopName: String
    var shops: [Shops]
}

struct Shops: Codable {
    var name: String
    var address: String
    var phone: String
    var photos: Photos
//    var photos: Dictionary<"url", Photos>
}

//struct Photos: Codable {
//    var url: URLs
//}

struct Photos: Codable {
    var url: [String]
}
//struct URLs: Codable {
//}
