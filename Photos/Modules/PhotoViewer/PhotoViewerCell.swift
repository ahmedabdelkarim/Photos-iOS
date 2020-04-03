//
//  PhotoViewerCell.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/2/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import UIKit

class PhotoViewerCell: UICollectionViewCell, UIScrollViewDelegate {
    //MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - Functions
    func setupCell(photo:Photo) {
        resetZoom()
        imageView.image = photo.image
    }
    
    func resetZoom() {
        scrollView.zoomScale = 1
    }
    
    
    //MARK: - Delegates
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
