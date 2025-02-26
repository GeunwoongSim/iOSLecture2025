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
  let dateForm : DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
    return formatter
  }()
  var selectedTime: Date?
  
  let timeSelector = #selector(ViewController.updateTime)
  let interval = 1.0
  var count = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
  }

  @objc func updateTime() {
    let date = Date()
    currentTimeLbl.text = "현재시간: \(dateForm.string(from: date))"
//    if dateForm.string(from: date) == dateForm.string(from: selectedTime) {
//      view.backgroundColor = .red
//    }else {
//      view.backgroundColor = .systemBackground
//    }
    
  }
  
  @IBAction func pickerChangeValue(_ sender: UIDatePicker) {
    selectedTime = sender.date
    selectedTimeLbl.text = "선택시간: \(dateForm.string(from: sender.date))"
    
  }
  
}

