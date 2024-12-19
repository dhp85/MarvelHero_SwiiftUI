//
//  SeriesUseCase.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol {get set}
    func getSeriesHero(idHero: Int) async throws -> [ResultSeries]
}


final class SeriesUseCase: SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = DefaultSeriesRepository(network: NetworkHeroSeries())) {
        self.repo = repo
    }
    
    func getSeriesHero(idHero: Int) async throws -> [ResultSeries] {
        try await repo.getSeriesHero(idHero: idHero)
    }
}

final class SeriesUseCaseMock: SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = DefaultSeriesRepository(network: NetworkHeroSeriesMock())) {
        self.repo = repo
    }
    
    func getSeriesHero(idHero: Int) async throws -> [ResultSeries] {
        try await repo.getSeriesHero(idHero: idHero)
    }
}
