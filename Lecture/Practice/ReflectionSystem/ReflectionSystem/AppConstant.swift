//
//  AppConstant.swift
//  ReflectionSystem
//
//  Created by 심근웅 on 2/14/25.
//

import Foundation


class AppConstant {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
}
