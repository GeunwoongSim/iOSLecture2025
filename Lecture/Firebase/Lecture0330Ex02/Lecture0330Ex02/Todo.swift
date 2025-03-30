//
//  Todo.swift
//  Lecture0330Ex02
//
//  Created by 심근웅 on 3/30/25.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
}
