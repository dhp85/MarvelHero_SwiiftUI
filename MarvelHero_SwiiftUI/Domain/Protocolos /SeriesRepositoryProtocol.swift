//
//  SeriesRepositoryProtocol.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

protocol SeriesRepositoryProtocol{
    func getSeriesHero(idHero: Int ) async throws -> [ResultSeries]
}
