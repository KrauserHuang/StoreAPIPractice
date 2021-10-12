//
//  DetailTableViewController.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var shops = [Shops]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.reuseIdentifier2, for: indexPath) as? DetailCell else {
            fatalError("Can't dequeue DetailCell")
        }
        let shop = shops[indexPath.row]
        cell.getDetail(shop)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageVC = storyboard?.instantiateViewController(withIdentifier: PropertyKeys.withIdentifier2) as! ImageTableViewController
        let shop = shops[indexPath.row]
        imageVC.urls = shop.photos.url
        navigationController?.pushViewController(imageVC, animated: true)
    }
}
