//
//  HerosViewModel.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

@Observable
final class HerosViewModel {
    
    var status: StatusApp = .none
    var heros: [ResultHeros] = []
    
    @ObservationIgnored
    private var useCase: HerosUseCaseProtocol
    
    init(useCase: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCase = useCase
        Task {
            try await getHeros()
        }
    }
    
    @MainActor
    func getHeros() async throws  {
        self.status = .loading
        do {
            let data =  try await useCase.getHeros()
            self.heros = data
            self.status = .loaded
        } catch {
            self.status = .error(error: "Error del servidor")
            print("Error: \(error)")
            
        }
      
    }
}
