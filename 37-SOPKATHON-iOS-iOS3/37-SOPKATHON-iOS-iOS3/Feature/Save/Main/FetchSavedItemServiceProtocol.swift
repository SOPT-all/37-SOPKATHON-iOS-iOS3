//
//  FetchSavedItemServiceProtocol.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/23/25.
//

import UIKit

protocol FetchSavedItemServiceProtocol {
    func getSavedItem() async throws -> DataClass
}
