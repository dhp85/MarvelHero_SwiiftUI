//
//  HeroRepositoryProtocol.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

protocol HeroRepositoryProtocol {
    func getHeros() async throws -> [Result]
}
