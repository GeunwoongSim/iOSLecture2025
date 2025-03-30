//
//  CounterViewModel.swift
//  Lecture0330Ex01
//
//  Created by 심근웅 on 3/30/25.
//

import Foundation
import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
}
