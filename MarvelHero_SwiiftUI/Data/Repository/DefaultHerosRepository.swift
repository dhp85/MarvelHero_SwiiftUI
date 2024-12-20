//
//  Default.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

final class DefaultHerosRepository: HeroRepositoryProtocol {
    
    private var netWork: NetworkHerosProtocol
    
    init(netWork: NetworkHerosProtocol = NetworkHeros()) {
        self.netWork = netWork
    }
    
    
    func getHeros() async throws -> [ResultHeros] {
        return try await netWork.getHeros()
    }
}
