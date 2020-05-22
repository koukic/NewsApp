//
//  LoginMovieViewController.swift
//  NewsApp
//
//  Created by 中條航紀 on 2020/04/06.
//  Copyright © 2020 中條航紀. All rights reserved.
//

import UIKit
import AVFoundation

class LoginMovieViewController: UIViewController {
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "start", ofType: "mov")
        
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        //Avplayer用のレイヤーを生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0,y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        playerLayer.videoGravity = .resizeAspectFill
        //無限ループが可能になる
        playerLayer.repeatCount = 0
        //ログインボタンを上に持ってきたいため
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        
        //ぜろにしてからまた再生として初めて無限ループが可能になる、はじめに戻すよという処理
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            //開始場所を探して、play
            self.player.seek(to: .zero)
            self.player.play()
            
        }

        self.player.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        player.pause()
    }
    
    
}
