//
//  EmpathyEmotionService.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by sumin Kong on 11/23/25.
//

protocol EmpathyEmotionService {
    func postEmotion(id: Int, emotion: String) async throws
    
}

final class DefaultEmpathyEmotionService: EmpathyEmotionService {
    let network = NetworkService.shared
    
    func postEmotion(id: Int,  emotion: String) async throws {
        do {
            let request: EmotionRequestDTO = .init(emotion: emotion)
            let response: EmptyResponseDTO = try await network.request(endPoint: .diarysEmotion(id), body: request)

        }
        catch {
            print("\(error.localizedDescription)")
        }
    }
}
