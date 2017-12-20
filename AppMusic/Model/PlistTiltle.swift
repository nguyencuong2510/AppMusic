//
//  PlistTiltle.swift
//  AppMusic
//
//  Created by nguyencuong on 12/20/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import Foundation
class PlistTiltle {
    var name: String
    var imageIcon: String
    
    init?(dict: JSON) {
        guard let name = dict["name"] as? String,
            let imageIcon = dict["nameImage"] as? String
        else { return nil }
        self.name = name
        self.imageIcon = imageIcon
    }
    
}
