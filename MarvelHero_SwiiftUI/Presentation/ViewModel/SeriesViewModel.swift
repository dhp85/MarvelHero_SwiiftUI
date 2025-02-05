//
//  SeriesViewModel.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

@Observable
final class SeriesViewModel{
    
    var status: StatusApp = .none
    var seriesList: [ResultSeries] = []
    var idHero: Int
    
    @ObservationIgnored
    private var useCase: SeriesUseCaseProtocol
    
    init(idHero: Int,useCase: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.useCase = useCase
        self.idHero = idHero
    }
        /*Task {
         try await getSeriesHero(idHero: idHero)
         }
         }*/
        
        @MainActor
        func getSeriesHero(idHero: Int) async throws {
            self.status = .loading
            
            do {
                let series = try await useCase.getSeriesHero(idHero: idHero)
                self.seriesList = series
                self.status = .loaded
            } catch {
                self.status = .error(error: "Error en el servidor")
                throw NetworkHerosError.invalidData
                
            }
        }
    }

