//
//  AlbumPhtotosViewController.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/1/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import UIKit

class AlbumPhtotosViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    //MARK: - Variables
    var album:Album!
    let search = UISearchController(searchResultsController: nil)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AlbumPhotoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:
            "AlbumPhotoCell")
        
        navigationItem.title = album.name
        
        self.navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}

extension AlbumPhtotosViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.photos != nil ? album.photos.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumPhotoCell", for: indexPath) as! AlbumPhotoCell
        
        cell.setupCell(photo: album.photos[indexPath.row])
        
        return cell
    }
}

extension AlbumPhtotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhotoIndex = indexPath.row

        let vc = PhotoViewerViewController()
        vc.album = album
        vc.photoIndex = selectedPhotoIndex

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumPhtotosViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3 - 4, height: collectionView.bounds.width / 3 - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6.0
    }
    
}
