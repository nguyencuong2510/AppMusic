//
//  Model.swift
//  AppMusic
//
//  Created by nguyencuong on 12/20/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit
class Song {
    var nameSong: String?
    var singerSong: String?
    var imageSong: UIImage?
    
    init(nameSong: String, singerSong: String, imageSong: UIImage) {
        self.nameSong = nameSong
        self.singerSong = singerSong
        self.imageSong = imageSong
    }
    
}
