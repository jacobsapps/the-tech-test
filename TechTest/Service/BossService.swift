//
//  BossService.swift
//  TechTest
//
//  Created by Jacob Bartlett on 14/11/2024.
//

import Factory
import Foundation

protocol BossService {
    
    /// Retrieves a new valid auth token from the
    /// server, then fetches the rememberance boss data.
    ///
    func fetchBosses() async throws -> [Boss]
}

final class BossServiceImpl: BossService {
    
    @Injected(\.authService) private var authService
    
    private let bossURL = URL(string: "https://jacobsapps.github.io/the-tech-test/Resources/bosses.json")!
    
    func fetchBosses() async throws -> [Boss] {
        let token = try await authService.getBearerToken()
        fatalError()
    }
}

extension Container {
    var bossService: Factory<BossService> {
        Factory(self) { BossServiceImpl() }
    }
}
