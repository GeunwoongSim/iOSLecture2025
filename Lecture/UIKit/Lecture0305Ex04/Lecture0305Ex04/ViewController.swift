//
//  ViewController.swift
//  Lecture0305Ex04
//
//  Created by 심근웅 on 3/5/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
  var audioPlayer: AVAudioPlayer!
  var audioFile: URL!
  let MAX_VOLUME: Float = 0.5
  var progressTimer: Timer!
  
  @IBOutlet weak var pvProgressPlay: UIProgressView!
  @IBOutlet weak var lblCurrentTime: UILabel!
  @IBOutlet weak var lblEndTime: UILabel!
  @IBOutlet weak var btnPlay: UIButton!
  @IBOutlet weak var btnPause: UIButton!
  @IBOutlet weak var btnStop: UIButton!
  @IBOutlet weak var slVolume: UISlider!
  
  @IBOutlet weak var btnRecord: UIButton!
  @IBOutlet weak var lblRecordTime: UILabel!
  
  var audioRecorder: AVAudioRecorder!
  var isRecordMode: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    selectAudioFile()
    if !isRecordMode {
      initPlay()
      btnRecord.isEnabled = false
      lblRecordTime.isEnabled = false
    }else {
      initRecord()
    }
    
  }
  func selectAudioFile() {
    if !isRecordMode {
      audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
    }else {
      let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
      audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
    }
  }
  
  func initRecord() {
    let recordSetting = [
      AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
      AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
      AVEncoderBitRateKey: 320000,
      AVNumberOfChannelsKey: 2,
      AVSampleRateKey: 44100.0
    ] as [String: Any]
    
    do{
      audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSetting)
    }catch {
      print("Error-initRecord: \(error)")
    }
    audioRecorder.delegate = self
    
    slVolume.value = MAX_VOLUME / 2
    audioPlayer.volume = slVolume.value
    lblEndTime.text = convertNSTimeIntervalToString(0)
    lblCurrentTime.text = convertNSTimeIntervalToString(0)
    btnEnableSet(false, false, false)
    
    let session = AVAudioSession.sharedInstance()
    do{
      try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
    }catch {
      print("Error-setCategory: \(error)")
    }
    do {
      try session.setActive(true)
    }catch {
      print("Error-setActive: \(error)")
    }
  }
  
  func initPlay() {
    do{
      audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
    }catch {
      print("Error-initPlay : \(error)")
    }
    slVolume.maximumValue = MAX_VOLUME
    slVolume.value = MAX_VOLUME / 2
    pvProgressPlay.progress = 0
    
    audioPlayer.delegate = self
    audioPlayer.prepareToPlay()
    audioPlayer.volume = slVolume.value
    
    lblEndTime.text = convertNSTimeIntervalToString(audioPlayer.duration)
    lblCurrentTime.text = convertNSTimeIntervalToString(0)
    
    btnEnableSet(true, false, false)
  }
  func convertNSTimeIntervalToString(_ time: TimeInterval) -> String {
    let min = Int(time/60)
    let sec = Int(time.truncatingRemainder(dividingBy: 60))
    let strTime = String(format: "%02d:%02d", min, sec)
    return strTime
  }
  
  func btnEnableSet(_ play: Bool, _ pause: Bool, _ stop: Bool) {
    btnPlay.isEnabled = play
    btnPause.isEnabled = pause
    btnStop.isEnabled = stop
  }
  
  @IBAction func btnPlayAudio(_ sender: UIButton) {
    audioPlayer.play()
    btnEnableSet(false, true, true)
    progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self , selector: #selector(updatePlayTime), userInfo: nil, repeats: true)
  }
  @objc func updatePlayTime() {
    lblCurrentTime.text = convertNSTimeIntervalToString(audioPlayer.currentTime)
    pvProgressPlay.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
  }
  
  @IBAction func btnPauseAudio(_ sender: UIButton) {
    audioPlayer.pause()
    btnEnableSet(true, false, true)
    progressTimer.invalidate()
  }
  @IBAction func btnStopAudio(_ sender: UIButton) {
    audioPlayer.stop()
    btnEnableSet(true, false, false)
    audioPlayer.currentTime = 0
    lblCurrentTime.text = convertNSTimeIntervalToString(0)
    pvProgressPlay.progress = 0
    progressTimer.invalidate()
  }
  
  @IBAction func slChangeVolume(_ sender: UISlider) {
    audioPlayer.volume = sender.value
    print(audioPlayer.volume)
  }
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    progressTimer.invalidate()
    btnEnableSet(true, false, false)
    lblCurrentTime.text = convertNSTimeIntervalToString(0)
    pvProgressPlay.progress = 0
  }
  
  @IBAction func swRecordMode(_ sender: UISwitch) {
    if sender.isOn {
      audioPlayer.stop()
      audioPlayer.currentTime = 0
      lblRecordTime!.text = convertNSTimeIntervalToString(0)
      isRecordMode = true
      btnRecord.isEnabled = true
      lblRecordTime.isEnabled = true
    }else {
      isRecordMode = false
      btnRecord.isEnabled = false
      lblRecordTime.isEnabled = false
      lblRecordTime.text = convertNSTimeIntervalToString(0)
    }
    selectAudioFile()
    if !isRecordMode {
      initPlay()
    }else {
      initRecord()
    }
  }
  @IBAction func btnRecord(_ sender: UIButton) {
    if sender.titleLabel?.text == "Record" {
      audioRecorder.record()
      sender.setTitle("Stop", for: .normal)
      progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateRecordTime), userInfo: nil, repeats: true)
    }else {
      audioRecorder.stop()
      progressTimer.invalidate()
      sender.setTitle("Record", for: .normal)
      btnPlay.isEnabled = true
      initPlay()
    }
  }
  @objc func updateRecordTime() {
    lblRecordTime.text = convertNSTimeIntervalToString(audioRecorder.currentTime)
  }
  
}

