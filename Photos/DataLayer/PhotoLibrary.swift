//
//  PhotoLibrary.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/1/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import Foundation

class PhotoLibrary {
    static func getPhotoAlbums() -> [Album] {
        let photo1 = Photo(title: "Photo 1", fileName: "1")
        let photo2 = Photo(title: "Photo 2", fileName: "2")
        let photo3 = Photo(title: "Photo 3", fileName: "3")
        let photo4 = Photo(title: "Photo 4", fileName: "4")
        let photo5 = Photo(title: "Photo 5", fileName: "5")
        let photo6 = Photo(title: "Photo 6", fileName: "6")
        let photo7 = Photo(title: "Photo 7", fileName: "7")
        let photo8 = Photo(title: "Photo 8", fileName: "8")
        let photo9 = Photo(title: "Photo 9", fileName: "9")
        let photo10 = Photo(title: "Photo 10", fileName: "10")
        
        let album1 = Album(name: "Album 1", photos: [photo1])
        let album2 = Album(name: "Album 2", photos: [photo2, photo1])
        let album3 = Album(name: "Album 3", photos: [photo3, photo1, photo2])
        let album4 = Album(name: "Album 4", photos: [photo4, photo1, photo2, photo3])
        let album5 = Album(name: "Album 5", photos: [photo5, photo1, photo2, photo3, photo4])
        let album6 = Album(name: "Album 6", photos: [photo6, photo1, photo2, photo3, photo4, photo5])
        let album7 = Album(name: "Album 7", photos: [photo7, photo1, photo2, photo3, photo4, photo5, photo6])
        let album8 = Album(name: "Album 8", photos: [photo8, photo1, photo2, photo3, photo4, photo5, photo6, photo7])
        let album9 = Album(name: "Album 9", photos: [photo9, photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8])
        let album10 = Album(name: "Album 10", photos: [photo10, photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9])
        
        let albums = [album1, album2, album3, album4, album5, album6, album7, album8, album9, album10]
        
        return albums
    }
}
