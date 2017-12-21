//
//  DetailViewController.swift
//  AppMusic
//
//  Created by nguyencuong on 12/21/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var volumIcon: UIButton!
    @IBOutlet weak var nameSong: UILabel!
    @IBOutlet weak var singerSong: UILabel!
    @IBOutlet weak var sliderDetail: UISlider!
    @IBOutlet var hearderView: UIView!
    @IBOutlet weak var buttonPlay: UIButton!{
        didSet{
            if DataServiece.share.statePlay {
                buttonPlay.setImage(#imageLiteral(resourceName: "play"), for: .normal)
                DataServiece.share.statePlay = false
            }
        }
    }
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameSong.text = song?.nameSong
        singerSong.text = song?.singerSong
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func move(_ sender: UIButton) {
    }
    
    @IBAction func pause(_ sender: Any) {
    }
    
    
    @IBAction func next(_ sender: UIButton) {
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func header(_ sender: UIButton) {
        
        if DataServiece.share.showDetailListTable {
            tableView.tableHeaderView = hearderView
            hearderView.frame.size.height = tableView.frame.height
            hearderView.frame.size.width = tableView.frame.width
            DataServiece.share.showDetailListTable = false
        } else {
            hearderView.frame.size.height = 0
            hearderView.frame.size.width = 0
            tableView.tableHeaderView?.isHidden = true
            DataServiece.share.showDetailListTable = true
            tableView.reloadData()
        }
        
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServiece.share.listSong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = DataServiece.share.listSong[indexPath.row].nameSong
        cell.detailTextLabel?.text = DataServiece.share.listSong[indexPath.row].singerSong
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameSong.text = DataServiece.share.listSong[indexPath.row].nameSong
        singerSong.text = DataServiece.share.listSong[indexPath.row].singerSong
        
        
        buttonPlay.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        DataServiece.share.statePlay = false
    }
    
}
