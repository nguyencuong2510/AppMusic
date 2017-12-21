//
//  MainViewController.swift
//  AppMusic
//
//  Created by nguyencuong on 12/20/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit
let nameNoti = NSNotification.Name.init(rawValue: "SelectCell")

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var song: Song?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        DataServiece.share.songData()
    }
    
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServiece.share.listSong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MainTableViewCell
        
        cell?.nameSong.text = DataServiece.share.listSong[indexPath.row].nameSong
        cell?.singerSong.text = DataServiece.share.listSong[indexPath.row].singerSong
        cell?.imageCell.image = DataServiece.share.listSong[indexPath.row].imageSong
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: nameNoti, object: nil, userInfo: ["message" : indexPath.row])
        
        
//        let myVC = UIStoryboard(name: "Main", bundle: nil)
//        let controller = myVC.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        controller.song = DataServiece.share.listSong[indexPath.row]
//        self.present(controller, animated: true, completion: nil)
        
    }
    
    
}






