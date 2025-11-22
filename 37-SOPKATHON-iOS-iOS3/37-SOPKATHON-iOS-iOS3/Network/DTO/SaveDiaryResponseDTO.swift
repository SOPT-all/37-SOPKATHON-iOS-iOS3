//
//  SaveDiaryResponseDTO.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import Foundation

struct SaveDiaryRequestDTO: Encodable {
    let subject: String
    let subjectType: String
    let title: String
    let content: String
    let userId: Int
}
