//
//  HerosUseCase.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

protocol HerosUseCaseProtocol {
    var repo: HeroRepositoryProtocol { get set }
    func getHeros() async throws -> [ResultHeros]
}


final class HerosUseCase: HerosUseCaseProtocol {
    
    var repo: HeroRepositoryProtocol
    
    init(repo: HeroRepositoryProtocol = DefaultHerosRepository(netWork: NetworkHeros())) {
        self.repo = repo
    }
    
    func getHeros() async throws -> [ResultHeros] {
        return try await repo.getHeros()
    }
}


final class HerosUseCaseMock: HerosUseCaseProtocol {
    
    var repo: HeroRepositoryProtocol
    
    init(repo: HeroRepositoryProtocol = DefaultHerosRepository(netWork: NetworkHerosMock())) {
        self.repo = repo
    }
    
    func getHeros() async throws -> [ResultHeros] {
        return try await repo.getHeros()
    }
}
