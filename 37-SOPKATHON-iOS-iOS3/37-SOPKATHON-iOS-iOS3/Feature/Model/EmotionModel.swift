//
//  EmotionModel.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import Foundation

struct EmotionModel {
    let imageName: String // 표시할 이미지
}

extension EmotionModel {
    static let dummyData: [EmotionModel] = [
        EmotionModel(imageName: "star.fill"),
        EmotionModel(imageName: "star.fill"),
        EmotionModel(imageName: "star.fill"),
        EmotionModel(imageName: "star.fill"),
        EmotionModel(imageName: "star.fill"),
    ]
}
