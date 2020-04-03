//
//  Photo.swift
//  Photos
//
//  Created by Ahmed Abdelkarim on 4/1/20.
//  Copyright © 2020 Ahmed Abdelkarim. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    var title:String!
    var fileName:String!
    
    var image:UIImage!
    {
        get {
            let image = UIImage.init(named: fileName)
            return image
        }
    }
}
