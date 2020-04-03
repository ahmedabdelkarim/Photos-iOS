//
//  ViewController.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/1/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    //MARK: - Variables
    var albums:[Album]!
    let search = UISearchController(searchResultsController: nil)
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AlbumCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:
            "AlbumCell")
        
        albums = PhotoLibrary.getPhotoAlbums()
        
        self.navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

extension AlbumsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums != nil ? albums.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        
        cell.setupCell(album: albums[indexPath.row])
        
        return cell
    }
}

extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedAlbum = albums[indexPath.row]
        
        let vc = AlbumPhtotosViewController()
        vc.album = selectedAlbum
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumsViewController : UICollectionViewDelegateFlowLayout {
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
