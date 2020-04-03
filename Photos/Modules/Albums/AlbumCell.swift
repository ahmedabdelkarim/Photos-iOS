//
//  AlbumCell.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/1/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - Functions
    func setupCell(album:Album) {
        albumNameLabel.text = album.name
        
        if(album.photos.count > 0) {
            imageView.image = album.photos[0].image
        }
    }
}
