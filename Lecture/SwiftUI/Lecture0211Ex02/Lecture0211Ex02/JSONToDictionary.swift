//
//  JSONToDictionary.swift
//  Lecture0211Ex02
//
//  Created by 심근웅 on 2/11/25.
//

import Foundation


let fruitsList: [Fruits] = load("FruitsInfo.json")
func load<T: Decodable>(_ filename: String) -> T {
    var data: Data
    
    // 파일위치를 가져옴
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("파일을 찾지 못함")
    }
    
    //파일 내용을 받아옴
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("파일 내용을 못 받아옴")
    }

    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("과일 형식으로 못바꿈")
    }
}

