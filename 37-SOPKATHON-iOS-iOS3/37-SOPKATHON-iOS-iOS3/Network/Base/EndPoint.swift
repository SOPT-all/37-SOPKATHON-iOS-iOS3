//
//  EndPoint.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/22/25.
//

import Foundation

// TODO: 예시 엔드포인트입니다. 나중에 명세서 나오면 수정하기

enum EndPoint {
    case diarys // 일기 작성
    case diarysEmotion(Int) // 이모지를 눌러 카운트 증가
    case diarysList(Int) /// 일기 목록 조회
    case diarysRandom // 다른 사용자 일기 목록 조회
    // TODO: AI 선택 주제 get 추가
    
    var requestType: HTTPMethodType {
        switch self {
        case .diarys, .diarysEmotion:
            return .post
        case .diarysList, .diarysRandom:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .diarys:
            return "/api/v1/diarys"
        case .diarysEmotion(let id):
            return "/api/v1/diarys/\(id)/emotion"
        case .diarysList(let userID):
            return "/api/v1/diarys/1"
        case .diarysRandom:
            return "/api/v1/diarys/random"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .diarys, .diarysEmotion, .diarysList, .diarysRandom:
            return HeaderType.basic.value
        }
    }
}
