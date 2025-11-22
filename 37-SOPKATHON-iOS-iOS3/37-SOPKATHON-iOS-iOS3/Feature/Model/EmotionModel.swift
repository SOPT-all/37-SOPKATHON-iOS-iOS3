//
//  EmotionModel.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit

struct EmotionModel {
    let emoji: String      // UI에 표시할 이모지 ("❤️", "👍", ...)
    let serverKey: String  // 서버가 기대하는 키 ("heart", "good", ...)
}

extension EmotionModel {
    static let dummyData: [EmotionModel] = [
        EmotionModel(emoji: "❤️", serverKey: "heart"),
        EmotionModel(emoji: "👍", serverKey: "good"),
        EmotionModel(emoji: "💧", serverKey: "tear"),
        EmotionModel(emoji: "👏", serverKey: "clap"),
        EmotionModel(emoji: "🔥", serverKey: "fire"),
    ]
}
