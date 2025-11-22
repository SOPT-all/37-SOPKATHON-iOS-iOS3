//
//  WriteDiaryService.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

protocol WriteDiaryService {
    func getRecommendSubject() async throws -> String
    
}

final class DefaultWriteDiaryService: WriteDiaryService {
    let network = NetworkService.shared
    
    func getRecommendSubject() async throws -> String {
        do {
            let response: SubjectResponseDTO = try await network.request(endPoint: .randomSubject)
            return response.content
        }
        catch {
            print("\(error.localizedDescription)")
            return "AI 선택 주제 일기"
        }
    }
}

final class MockWriteViewService: WriteDiaryService {
    func getRecommendSubject() async throws -> String {
        return "AI 선택 주제 일기"
    }
}
