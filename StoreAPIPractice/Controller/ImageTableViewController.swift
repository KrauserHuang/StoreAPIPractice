//
//  ImageTableViewController.swift
//  StoreAPIPractice
//
//  Created by Tai Chin Huang on 2021/10/8.
//

import UIKit

class ImageTableViewController: UITableViewController {
    
    var urls = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(urls)
        print("viewDidLoadImageTVC")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(urls.count)
//        if (urls.count)/2 != 0 {
//            return (urls.count)/2 + 1
//        } else {
//            return (urls.count)/2
//        }
        return (urls.count)/2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.reuseIdentifier3, for: indexPath) as? ImageCell else {
            fatalError("Can't dequeue ImageCell")
        }
        var oddURLs = [String]()
        var evenURLs = [String]()
        for (index, url) in urls.enumerated() {
            print("\(url) in \(index)")
            if index % 2 == 0 {
                oddURLs.append(url)
            } else {
                evenURLs.append(url)
            }
        }
//        print("oddURLs: \(oddURLs), evenURLs: \(evenURLs)")
        let oddURL = oddURLs[indexPath.row]
        let evenURL = evenURLs[indexPath.row]
        cell.getImage1(oddURL)
        cell.getImage2(evenURL)
        
        return cell
    }

}
