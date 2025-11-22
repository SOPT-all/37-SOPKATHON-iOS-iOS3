//
//  BaseResponseDTO.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/22/25.
//

import Foundation

struct BaseResponseDTO<T: Decodable> : Decodable {
    let code: Int
    let msg: String
    let data: T?
}
