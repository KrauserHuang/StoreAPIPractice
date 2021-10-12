//
//  StoreCell.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import UIKit

class StoreCell: UITableViewCell {

    @IBOutlet weak var shopNameLabel: UILabel!
    
    var store: Datas!
    
    func getShopName(_ shop: Datas) {
        store = shop
        DispatchQueue.main.async {
            self.shopNameLabel.text = self.store.shopName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
