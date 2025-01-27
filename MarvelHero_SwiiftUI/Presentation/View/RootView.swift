//
//  RootView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 26/1/25.
//

import SwiftUI

struct RootView: View {
    
    @Environment(HerosViewModel.self) var stateApp
    
    var body: some View {
        switch stateApp.status {
        case .none:
                Text("Loading...")
                .onAppear {
                    Task {
                        try await stateApp.getHeros()
                    }
                }
        case .loading:
            SplashView()
        case .loaded:
            HerosView()
        case .error(error: let errorString):
            ErrorView(textError: errorString)
        }
    }
}

#Preview {
    RootView()
        .environment(HerosViewModel())
}
