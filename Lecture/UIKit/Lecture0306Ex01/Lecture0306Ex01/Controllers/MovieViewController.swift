//
//  MovieViewController.swift
//  Lecture0306Ex01
//
//  Created by 심근웅 on 3/6/25.
//

import UIKit
import AVKit
class MovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
    
    let filePath = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
    let url = NSURL(fileURLWithPath: filePath!)

    // 이걸로 해도 문제는 없음
//    let url = Bundle.main.url(forResource: "FastTyping", withExtension: "mp4")
    
    playVideo(url: url)
    
  }
  @IBAction func lblPlayExternalMovie(_ sender: UIButton) {
//    let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
    let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
    playVideo(url: url)
  }
}

extension MovieViewController {
  private func playVideo(url: NSURL) {
    let playerController = AVPlayerViewController()
    
    let player = AVPlayer(url: url as URL)
    playerController.player = player
    
    present(playerController, animated: true) {
      player.play()
    }
  }
}
