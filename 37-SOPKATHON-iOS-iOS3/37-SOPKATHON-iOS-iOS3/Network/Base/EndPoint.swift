//
//  EndPoint.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/22/25.
//

import Foundation

enum EndPoint {
    case diarys // 일기 작성
    case diarysEmotion(Int) // 이모지를 눌러 카운트 증가
    case diarysList /// 일기 목록 조회
    case diarysRandom // 다른 사용자 일기 목록 조회
    case randomSubject // 랜덤 주제 
    
    var requestType: HTTPMethodType {
        switch self {
        case .diarys, .diarysEmotion:
            return .post
        case .diarysList, .diarysRandom, .randomSubject:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .diarys:
            return "/api/v1/diarys"
        case .diarysEmotion(let id):
            return "/api/v1/diarys/\(id)/emotion"
        case .diarysList:
            return "/api/v1/diarys/1"
        case .diarysRandom:
            return "/api/v1/diarys/random"
        case .randomSubject:
            return "/api/v1/subjects"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .diarys, .diarysEmotion, .diarysList, .diarysRandom, .randomSubject:
            return HeaderType.basic.value
        }
    }
}
