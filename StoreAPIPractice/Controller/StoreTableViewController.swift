//
//  StoreTableViewController.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import UIKit

struct PropertyKeys {
    static let reuseIdentifier1 = "StoreCell"
    static let withIdentifier1 = "DetailTableViewController"
    static let reuseIdentifier2 = "DetailCell"
    static let withIdentifier2 = "ImageTableViewController"
    static let reuseIdentifier3 = "ImageCell"
}

class StoreTableViewController: UITableViewController {
    
    var storeDatas = [Datas]()
    var model = StoreModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        model.delegate = self
        model.getStore()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeDatas.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.reuseIdentifier1, for: indexPath) as? StoreCell else {
            fatalError("Can't dequeue StoreCell")
        }
        let store = storeDatas[indexPath.row]
        cell.getShopName(store)
        
        return cell
    }
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: PropertyKeys.withIdentifier1) as! DetailTableViewController
        let store = storeDatas[indexPath.row]
        let shop = store.shops
        detailVC.shops = shop
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension StoreTableViewController: StoreModelDelegate {
    func retrieveStoreData(_ store: [Datas]) {
        storeDatas = store
        tableView.reloadData()
    }
}
