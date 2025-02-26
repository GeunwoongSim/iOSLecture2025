//
//  ViewController.swift
//  Lecture0226Ex03
//
//  Created by 심근웅 on 2/26/25.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var currentTimeLbl: UILabel!
  @IBOutlet weak var selectedTimeLbl: UILabel!
  let dateForm: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
    return formatter
  }()
  let alarmForm: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter
  }()
  
  var selectedTime: String = ""
  
  let timeSelector = #selector(ViewController.updateTime)
  let interval = 1.0
  var count = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
  }

  @objc func updateTime() {
    let date = Date()
    print("current = \(alarmForm.string(from: date)), selected = \(selectedTime)")
    currentTimeLbl.text = "현재시간: \(dateForm.string(from: date))"
    if alarmForm.string(from: date) == selectedTime {
      self.view.backgroundColor = UIColor.red
    }else {
      self.view.backgroundColor = UIColor.systemBackground
    }
  }
  
  @IBAction func pickerChangeValue(_ sender: UIDatePicker) {
    selectedTimeLbl.text = "선택시간: \(dateForm.string(from: sender.date))"
    selectedTime = alarmForm.string(from: sender.date)
  }
  
}

