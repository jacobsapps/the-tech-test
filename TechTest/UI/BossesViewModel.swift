//
//  BossesViewModel.swift
//  TechTest
//
//  Created by Jacob Bartlett on 14/11/2024.
//

import Factory
import SwiftUI

final class BossesViewModel: ObservableObject {
    
    @Published private(set) var greeting: String = ""
    @Published private(set) var bosses: [Boss] = []
    @Published var likes: [Boss: Bool] = [:]
    
    @Injected(\.userService) private var userService
    @Injected(\.bossService) private var bossService
    
    func load() async {
        do {
            let user = try await userService.fetchUserInfo()
            greeting = "Hello, \((user).firstName)"
            bosses = try await bossService.fetchBosses()
            
        } catch {
            print(error)
        }
    }
}
