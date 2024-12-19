//
//  SeriesViewModel.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

@Observable
final class SeriesViewModel{
    
    var seriesList: [ResultSeries] = []
    var idHero: Int = 0
    
    @ObservationIgnored
    private var useCase: SeriesUseCaseProtocol
    
    init(idHero: Int,useCase: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.useCase = useCase
        self.idHero = idHero
        
        Task {
            try await getSeriesHero(idHero: idHero)
        }
    }
    
    @MainActor
    func getSeriesHero(idHero: Int) async throws {
        
        let series = try await useCase.getSeriesHero(idHero: idHero)
        self.seriesList = series
    }
}
