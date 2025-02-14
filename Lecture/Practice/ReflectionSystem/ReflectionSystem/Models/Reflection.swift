import Foundation
import SwiftUI


struct Reflection: Codable, Identifiable {
    var id: UUID = UUID()
    var date: Date
    var content: String
    
}
