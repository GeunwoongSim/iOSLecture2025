import Foundation
import UIKit

enum MomoContentMode {
  case showTable // 테이블 뷰로 보여줌 (목록형)
  case showCollection // 컬렉션 뷰로 보여줌 (갤러리형)
  
  var showTableState: Bool {
    switch self {
    case .showTable: return false
    case .showCollection: return true
    }
  }
  var showCollectionState: Bool {
    switch self {
    case .showTable: return true
    case .showCollection: return false
    }
  }
  
  var info: (title: String, image: UIImage) {
    switch self {
    case .showCollection:
      return (title: "목록으로 보기", image: UIImage(systemName: "list.bullet")!)
    case .showTable:
      return (title: "갤러리로 보기", image: UIImage(systemName: "square.grid.2x2")!)
    }
  }
  
  mutating func toggle() {
    switch self {
    case .showCollection: self = .showTable
    case .showTable: self = .showCollection
    }
  }
}
