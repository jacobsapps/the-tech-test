//
//  BossView.swift
//  TechTest
//
//  Created by Jacob Bartlett on 14/11/2024.
//

import SwiftUI

struct BossView: View {
    
    let boss: Boss
    @Binding var likes: [Boss: Bool]
    
    var body: some View {
        let _ = Self._printChanges()
        HStack(spacing: 8) {
            likeButton
            Text(boss.name)
        }
    }
    
    private var likeButton: some View {
        Button {
            toggleLike()
            
        } label: {
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundStyle((likes[boss] ?? false) ? .red : .gray)
                .frame(width: 16, height: 16)
                .padding(8)
        }
    }
    
    private func toggleLike() {
        guard let like = likes[boss] else {
            likes[boss] = true
            return
        }
        likes[boss] = !like
    }
}
