//
//  PhotoViewerViewController.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/2/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import UIKit

class PhotoViewerViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    //MARK: - Variables
    var album:Album!
    var photoIndex:Int!
    var initialScrollDone = false
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PhotoViewerCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:
            "PhotoViewerCell")
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
        navigationItem.rightBarButtonItem = shareButton
    }
    
    override func viewDidLayoutSubviews() {
        if (!self.initialScrollDone) {
            self.initialScrollDone = true
            scrollToPhoto(index: photoIndex, animated: false)
        }
    }
    
    
    //MARK: - Functions
    func scrollToPhoto(index:Int, animated:Bool) {
        let photoIndexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: photoIndexPath, at: .centeredHorizontally, animated: animated)
    }
    
    @objc func shareImage() {
        //TODO: share displayed image
    }
    
    
    //MARK: - Delegates
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //set new photoIndex
        let x = targetContentOffset.pointee.x
        photoIndex = Int(x / collectionView.bounds.width)
        
        //reset zoom level in previous and next cells
        if(photoIndex <= 0 || photoIndex >= album.photos.count) {
            return
        }
        
        let previousIndexPath = IndexPath(item: photoIndex - 1, section: 0)
        let previousCell = collectionView.cellForItem(at: previousIndexPath) as? PhotoViewerCell
        previousCell?.resetZoom()
        
        let nextIndexPath = IndexPath(item: photoIndex + 1, section: 0)
        let nextCell = collectionView.cellForItem(at: nextIndexPath) as? PhotoViewerCell
        nextCell?.resetZoom()
    }
}

extension PhotoViewerViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.photos != nil ? album.photos.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewerCell", for: indexPath) as! PhotoViewerCell
        
        cell.setupCell(photo: album.photos[indexPath.row])
        
        return cell
    }
}

extension PhotoViewerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //TODO: handle selection if needed
        
    }
}

extension PhotoViewerViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: {(_) in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.scrollToPhoto(index: self.photoIndex, animated: false)
        }, completion: nil)
    }
}
