//
//  RandomDiaryResponseDTO.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/23/25.
//

struct RandomDiaryResponseDTO: Decodable {
    let code: Int
    let msg: String
    let data: DiaryData
}

struct DiaryData: Decodable {
    let id: Int
    let title: String
    let content: String
}
