//
//  AuthService.swift
//  TechTest
//
//  Created by Jacob Bartlett on 14/11/2024.
//

import Factory
import Foundation

protocol AuthService: AnyActor {
    
    /// Return a valid, refreshed, bearer token.
    ///
    func getBearerToken() async throws -> String
}

actor AuthServiceImpl: AuthService {
    
    enum AuthError: Error {
        case tokenNotFound
    }
    
    var tokenTask: Task<String, Error>?
    
    private let authURL = URL(string: "https://jacobsapps.github.io/the-tech-test/Resources/auth.json")!
    
    func getBearerToken() async throws -> String {
        print("Fetch auth token")
        let token = try await fetchToken()
        print("Auth token retrieved")
        return token
    }
    
    func fetchToken() async throws -> String {
        let tokenData = try await URLSession.shared.data(from: authURL).0
        guard let token = String(data: tokenData, encoding: .utf8) else {
            throw AuthError.tokenNotFound
        }
        return token 
    }
}

extension Container {
    var authService: Factory<AuthService> {
        Factory(self) { AuthServiceImpl() }
    }
}
