//
//  CollectionViewCell.swift
//  ItunesAPI
//
//  Created by Hoang Tung on 5/7/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  var apiData: Item?
  
  var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = UIFont(name: "", size: 14)
    return label
  }()
  
  var bookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(contentsOfFile: "")
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.black.cgColor
    
    addComponent()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addComponent() {
    self.addSubview(bookImageView)
//    self.addSubview(nameLabel)
  }
  
  func setupLayout() {
    bookImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    bookImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    bookImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
    bookImageView.heightAnchor.constraint(equalTo: bookImageView.widthAnchor, multiplier: 1).isActive = true
  
//    nameLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 8).isActive = true
//    nameLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor).isActive = true
//    nameLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor).isActive = true
//    nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
  }
  
  func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
    let session = URLSession.shared
      let url = URL(string: urlString)
          
      let dataTask = session.dataTask(with: url!) { (data, response, error) in
          if error != nil {
              print("Error fetching the image! 😢")
              completionHandler(nil)
          } else {
              completionHandler(data)
          }
      }
          
      dataTask.resume()
  }
  
  func setImageToImageView() {
    fetchImage(from: apiData?.artworkUrl100 ?? "") { (imageData) in
          if let data = imageData {
              DispatchQueue.main.async {
                  self.bookImageView.image = UIImage(data: data)
              }
          } else {
              print("Error loading image");
          }
      }
  }
}
