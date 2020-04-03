//
//  PhotoCell.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/2/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import UIKit

class AlbumPhotoCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - Functions
    func setupCell(photo:Photo) {
        imageView.image = photo.image
    }
}
