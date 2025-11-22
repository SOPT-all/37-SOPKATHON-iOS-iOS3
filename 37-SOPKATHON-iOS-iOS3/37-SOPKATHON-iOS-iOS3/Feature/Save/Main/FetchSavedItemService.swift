//
//  FetchSavedItemService.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/23/25.
//

import UIKit

class FetchSavedItemService: FetchSavedItemServiceProtocol {
    let network = NetworkService.shared
    
    func getSavedItem() async throws -> DataClass {
        do {
            let response: DataClass = try await network.request(endPoint: .diarysList)
            return response
        }
        catch {
            print("\(error.localizedDescription)")
            return
                DataClass(diaries: [Diary(
                    id: 0,
                    title: "제목",
                    content: "내용",
                    createdAt: "2025.01.11",
                    tags: ["키워드", "키워드", "키워드"],
                    heart: 2,
                    good: 1,
                    tear: 0,
                    clap: 2,
                    fire: 1
                )])
            
        }
        
    }
    
    
}

