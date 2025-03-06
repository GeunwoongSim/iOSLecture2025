//
//  AudioPlayerViewController.swift
//  Lecture0306Ex01
//
//  Created by 심근웅 on 3/6/25.
//

import UIKit
import AVFoundation
import AVKit

class AudioPlayerViewController: UIViewController {
  
  // 오디오 플레이어
  var audioPlayer: AVAudioPlayer?
  @IBOutlet weak var lblPlayTime: UILabel!
  @IBOutlet weak var slVolume: UISlider!
  var timer: Timer!
  
  // 동영상 플레이어
  var videoPlayer: AVPlayer?
  var videioPlayerLayer: AVPlayerLayer?
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initAudioPlayer()
    setupVideoPlayer()
  }
  
  func setupVideoPlayer() {
    
  }
  
  func initAudioPlayer() {
    guard let url = Bundle.main.url(forResource: "sample_video", withExtension: "mp4") else {
      print("Error - file not load")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.prepareToPlay()
    }catch {
      print("Error - prepareAudioPlayer: \(error)")
    }
  }
  
  @IBAction func btnAudioPlay(_ sender: UIButton) {
    audioPlayer?.play()
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
  }
  
  @IBAction func btnAudioPause(_ sender: UIButton) {
    audioPlayer?.pause()
  }
  @IBAction func btnAudioStop(_ sender: UIButton) {
    audioPlayer?.stop()
    audioPlayer?.currentTime = 0
    timer.invalidate()
  }
  @IBAction func slVolumeChange(_ sender: UISlider) {
    audioPlayer?.volume = sender.value
  }
  
  @objc func updateTime() {
    let m = Int(audioPlayer?.currentTime ?? 0) / 60
    let s = Int(audioPlayer?.currentTime ?? 0) % 60
    lblPlayTime.text = String(format: "%02d:%02d", m, s)
  }
}

