
//
//  NetworkHeroSeries.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

protocol NetworkHeroSeriesProtocol {
    func getSeriesHero(idHero: Int ) async throws -> [ResultSeries]
}
    
final class NetworkHeroSeries: NetworkHeroSeriesProtocol {
    
    func getSeriesHero(idHero: Int) async throws -> [ResultSeries] {
        
        let baseURL = "\(ConstantApp.CONSTANT_API_URL_SERIES)/\(idHero)/\(EndPoints.series.rawValue)\(ConstantApp.API_KEY)\(EndPoints.hash.rawValue)\(ConstantApp.HASH)"
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"// poner aqui GET
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                let listSeries = try! JSONDecoder().decode(HerosModelSeries.self, from: data)
                return listSeries.data.results
            } else {
                throw NetworkHerosError.invalidResponse
            }
        } catch {
            NSLog("Error en series: \(error.localizedDescription)")
            throw NetworkHerosError.invalidData
        }
    }
}

final class NetworkHeroSeriesMock: NetworkHeroSeriesProtocol {
    func getSeriesHero(idHero: Int) async throws -> [ResultSeries] {
        
        let mockResultSeries1 = ResultSeries(
            id: 1,
            title: "Avengers: The Initiative(2007-2010)",
            description: "This is a mock description of the series.",
            resourceURI: "https://mockuri.com/resource",
            urls: [
                URLElementSeries(type: "detail", url: "https://mockuri.com/detail")
            ],
            startYear: 2020,
            endYear: 2022,
            rating: "PG-13",
            type: "Mock Type",
            modified: "",
            thumbnail: ThumbnailSeries(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5",
                thumbnailExtension: "jpg"
            ),
            creators: Creators(
                available: 5,
                collectionURI: "https://mockuri.com/creators",
                items: [
                ],
                returned: 1
            ),
            characters: Characters(
                available: 3,
                collectionURI: "https://mockuri.com/characters",
                items: [
                ],
                returned: 1
            ),
            stories: StoriesSeries(
                available: 2,
                collectionURI: "https://mockuri.com/stories",
                items: [
                ],
                returned: 1
            ),
            comics: Characters(
                available: 4,
                collectionURI: "https://mockuri.com/comics",
                items: [
                ],
                returned: 1
            ),
            events: Characters(
                available: 2,
                collectionURI: "https://mockuri.com/events",
                items: [
        
                ],
                returned: 1
            ),
            next: Next(
                resourceURI: "https://mockuri.com/next",
                name: "Next Series"
            ),
            previous: Next(
                resourceURI: "https://mockuri.com/previous",
                name: "Previous Series"
            )
        )
        let mockResultSeries2 = ResultSeries(
            id: 2,
            title: "DeadPool",
            description: "This is a mock description of the series.",
            resourceURI: "https://mockuri.com/resource",
            urls: [
                URLElementSeries(type: "detail", url: "https://mockuri.com/detail")
            ],
            startYear: 2020,
            endYear: 2022,
            rating: "PG-13",
            type: "Mock Type",
            modified: "",
            thumbnail: ThumbnailSeries(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/7/03/5130f646465e3",
                thumbnailExtension: "jpg"
            ),
            creators: Creators(
                available: 5,
                collectionURI: "https://mockuri.com/creators",
                items: [
                ],
                returned: 1
            ),
            characters: Characters(
                available: 3,
                collectionURI: "https://mockuri.com/characters",
                items: [
                ],
                returned: 1
            ),
            stories: StoriesSeries(
                available: 2,
                collectionURI: "https://mockuri.com/stories",
                items: [
                ],
                returned: 1
            ),
            comics: Characters(
                available: 4,
                collectionURI: "https://mockuri.com/comics",
                items: [
                ],
                returned: 1
            ),
            events: Characters(
                available: 2,
                collectionURI: "https://mockuri.com/events",
                items: [
        
                ],
                returned: 1
            ),
            next: Next(
                resourceURI: "https://mockuri.com/next",
                name: "Next Series"
            ),
            previous: Next(
                resourceURI: "https://mockuri.com/previous",
                name: "Previous Series"
            )
        )
        
        if idHero == 1 {
            return [mockResultSeries1, mockResultSeries2]
        } else {
            return []
        }
    }
}
