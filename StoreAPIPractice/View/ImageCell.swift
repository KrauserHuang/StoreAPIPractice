//
//  ImageCell.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var photo1ImageView: UIImageView!
    @IBOutlet weak var photo2ImageView: UIImageView!
    
    var urlString: String!
    
    func getImage1(_ url: String) {
        photo1ImageView.image = UIImage(systemName: "questionmark.circle")
        urlString = url
        guard let imageURL = URL(string: urlString) else { return }
        print(imageURL)
        URLSession.shared.dataTask(with: imageURL) { [weak self] data, reponse, error in
            guard let imageData = data, error == nil else {
                return
            }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self?.photo1ImageView.image = image
            }
        }.resume()
    }
    
    func getImage2(_ url: String) {
        photo2ImageView.image = UIImage(systemName: "questionmark.circle")
        urlString = url
        guard let imageURL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: imageURL) { [weak self] data, reponse, error in
            guard let imageData = data, error == nil else {
                return
            }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self?.photo2ImageView.image = image
            }
        }.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo1ImageView.contentMode = .scaleAspectFill
        photo2ImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
