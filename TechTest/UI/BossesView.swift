//
//  BossesView.swift
//  TechTest
//
//  Created by Jacob Bartlett on 14/11/2024.
//

import SwiftUI

struct BossesView: View {
    
    @ObservedObject var viewModel = BossesViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            ForEach(viewModel.bosses) { boss in
                BossView(boss: boss, likes: $viewModel.likes)
            }
        }
    }
}

#Preview {
    BossesView()
}
