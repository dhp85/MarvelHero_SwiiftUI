//
//  HerosViewModel.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

@Observable
final class HerosViewModel {
    
    
    var heros: [Result] = []
    
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
        let data =  try await useCase.getHeros()
        self.heros = data
    }
}
