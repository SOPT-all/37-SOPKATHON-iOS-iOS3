//
//  RandomDiaryService.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/23/25.
//

protocol RandomDiaryService {
    func getRandomDiary() async throws -> DiaryData
}


final class DefaultRandomDiaryService: RandomDiaryService {
    let network = NetworkService.shared
    
    func getRandomDiary() async throws -> DiaryData {
        do {
            let result: DiaryData = try await network.request(endPoint: .diarysRandom)
            
            return result
        }
        catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
