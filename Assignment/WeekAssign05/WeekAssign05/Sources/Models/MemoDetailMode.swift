
import Foundation
import UIKit

enum MemoDetailMode {
  case add // 추가모드
  case read // 읽기모드
  case edit // 수정모드
  
  var isEditable: Bool {
    switch self {
    case .add: return true
    case .read: return false
    case .edit: return true
    }
  }
  
  mutating func toggle() {
    switch self {
    case .add: self = .read
    case .read: self = .edit
    case .edit: self = .read
    }
  }
}
