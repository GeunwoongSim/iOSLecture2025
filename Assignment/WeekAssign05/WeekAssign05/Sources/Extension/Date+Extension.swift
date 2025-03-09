import Foundation
import UIKit

extension Date {
  var dateToDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd."
    dateFormatter.locale = Locale(identifier: "kr_KR")
    return dateFormatter.string(from: self)
  }
  var dateToTime: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm a"
    dateFormatter.locale = Locale(identifier: "kr_KR")
    return dateFormatter.string(from: self)
  }
}
