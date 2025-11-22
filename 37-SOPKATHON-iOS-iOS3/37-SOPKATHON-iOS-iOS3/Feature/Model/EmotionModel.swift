//
//  EmotionModel.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit

struct EmotionModel {
    let imageName: String
}

extension EmotionModel {
    static let dummyData: [EmotionModel] = [
        EmotionModel(imageName: "❤️"),
        EmotionModel(imageName: "👍"),
        EmotionModel(imageName: "💧"),
        EmotionModel(imageName: "👏"),
        EmotionModel(imageName: "🔥"),
    ]
}
