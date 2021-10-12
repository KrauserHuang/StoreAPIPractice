//
//  DetailCell.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var shop: Shops!
    
    func getDetail(_ shops: Shops) {
        shop = shops
        DispatchQueue.main.async {
            self.nameLabel.text    = self.shop.name
            self.addressLabel.text = self.shop.address
            self.phoneLabel.text   = self.shop.phone
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
