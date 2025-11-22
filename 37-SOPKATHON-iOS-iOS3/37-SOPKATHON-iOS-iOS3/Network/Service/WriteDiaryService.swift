//
//  WriteDiaryService.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

protocol WriteDiaryService {
    func getRecommendSubject() async throws -> String
    func saveDiary(
        subject: String,
        subjectType: String,
        title: String,
        content: String
    ) async throws
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
    
    func saveDiary(
        subject: String,
        subjectType: String,
        title: String,
        content: String) async throws {
            let request: SaveDiaryRequestDTO = .init(subject: subject, subjectType: subjectType, title: title, content: content, userId: 1)
            
            do {
                let _: EmptyResponseDTO  = try await network.request(endPoint:.diarys , body: request)
            } catch {
                print("\(error.localizedDescription)")
            }
        }
}

final class MockWriteViewService: WriteDiaryService {
    func saveDiary(subject: String, subjectType: String, title: String, content: String) async throws {
    }
    
    func getRecommendSubject() async throws -> String {
        return "AI 선택 주제 일기"
    }
}
