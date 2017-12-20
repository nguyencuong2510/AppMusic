//
//  DataServiece.swift
//  AppMusic
//
//  Created by nguyencuong on 12/20/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import Foundation
import UIKit
typealias JSON = Dictionary<String, Any>

class DataServiece {
    static let share: DataServiece = DataServiece()
    
    //MARK: - List ViewController
    
    let listIdentifies: [String] = ["ViewController1", "ViewController2"]
    
    //MARK: Song Main
    var listSong: [Song] = []
    
    
    func songData() {
        guard let photo3 = UIImage(named: "image3"),
            let photo2 = UIImage(named: "image2"),
            let photo1 = UIImage(named: "image1")
            else { return }
        let object1 = Song(nameSong: "Alone", singerSong: "Alan Walker", imageSong: photo1)
        let object2 = Song(nameSong: "Alone", singerSong: "Alan Walker", imageSong: photo2)
        let object3 = Song(nameSong: "Alone", singerSong: "Alan Walker", imageSong: photo3)
        for _ in 0...2 {
            listSong += [object1, object2, object3]
        }
        
    }
    
    //MARK: - Plist File
    private var _headerTitle: [PlistTiltle]!
    
    var headerTitle: [PlistTiltle]!{
        set{
            self.headerTitle = newValue
        }
        get{
            if _headerTitle == nil {
                readFilePlist()
            }
            return _headerTitle
        }
    }
    
    func readFilePlist() {
        _headerTitle = []
        guard let path = Bundle.main.path(forResource: "ListNameFolder", ofType: "plist"),
            let title = NSArray(contentsOfFile: path) else { return }
        
        for value in title {
            if let dict = value as? JSON{
                if let plistTitle = PlistTiltle(dict: dict){
                    _headerTitle.append(plistTitle)
                }
            }
        }
    }
}
