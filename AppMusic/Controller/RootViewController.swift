//
//  ViewController.swift
//  AppMusic
//
//  Created by nguyencuong on 12/20/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit
import AVFoundation

class RootViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnMove: UIButton!
    @IBOutlet weak var sliderRoot: UISlider!
    @IBOutlet weak var timeFirstSong: UILabel!
    @IBOutlet weak var timeLastSong: UILabel!
    @IBOutlet weak var imageFooter: UIImageView!
    @IBOutlet weak var nameSongFooter: UILabel!
    
    @IBOutlet weak var btnPlay: UIButton!{
        didSet{
            if DataServiece.share.statePlay {
                btnPlay.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            }
        }
    }
    
    var player: AVAudioPlayer?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(selectCell(noti:)), name: nameNoti, object: nil)
    }
    
    @objc func selectCell(noti: Notification){
        if let userInfos = noti.userInfo {
            if let message = userInfos["message"] as? Int {
                imageFooter.image = DataServiece.share.listSong[message].imageSong
                nameSongFooter.text = DataServiece.share.listSong[message].nameSong
                
                if let asset = NSDataAsset(name: "alone"){
                    
                    do{
                        //using NSDataAsset's data properties to access the audio file stored in sound.
                        player = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
                        player?.play()
                        DataServiece.share.statePlay = true
                    }catch{
                        print("error")
                    }
                }
            }
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServiece.share.headerTitle.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionCell
        
        cell?.nameTitle.text = DataServiece.share.headerTitle[indexPath.row].name
        cell?.imageTitle.image = UIImage(named: DataServiece.share.headerTitle[indexPath.row].imageIcon)

        return cell!
    }
    
    //MARK: - Action

    @IBAction func btnClickPlay(_ sender: UIButton) {
       
            if DataServiece.share.statePlay {
                player?.play()
                DataServiece.share.statePlay = false
            }else{
                player?.pause()
                DataServiece.share.statePlay = true
            }
        
    }
    
    @IBAction func btnClickNext(_ sender: UIButton) {
       
    }
    
    @IBAction func btnClickMove(_ sender: UIButton) {
    }
    
    
}

