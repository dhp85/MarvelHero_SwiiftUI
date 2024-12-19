//
//  Untitled.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

final class DefaultSeriesRepository: SeriesRepositoryProtocol {
    
    private var network: NetworkHeroSeriesProtocol
    
    init(network: NetworkHeroSeriesProtocol = NetworkHeroSeries()) {
        self.network = network
    }
    
    func getSeriesHero(idHero: Int) async throws -> [ResultSeries] {
        return try await network.getSeriesHero(idHero: idHero)
    }
}
