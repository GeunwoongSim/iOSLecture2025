//
//  Fruits.swift
//  Lecture0211Ex02
//
//  Created by 심근웅 on 2/11/25.
//

import Foundation

struct Fruits: Hashable, Codable {
    var name: String
    var imageName: String
    var price: Int
    var description: String
    var isFavorite: Bool
}
