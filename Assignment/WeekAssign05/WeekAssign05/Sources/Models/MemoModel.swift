//
//  Memo.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import Foundation
import UIKit

struct MemoModel {
  var uuid: UUID = UUID()
  var title: String
  var content: String
  var date: Date
  var image: UIImage?
}
