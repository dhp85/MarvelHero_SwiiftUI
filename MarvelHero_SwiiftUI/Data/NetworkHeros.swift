//
//  NetworkHeros.swift
//  Marvel_SwiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

enum NetworkHerosError: Error, Equatable {
    case invalidResponse
    case invalidData
}

protocol NetworkHerosProtocol {
    func getHeros() async throws -> [ResultHeros]
    
}
    
final class NetworkHeros: NetworkHerosProtocol {
    func getHeros() async throws -> [ResultHeros] {
        
        let baseURL = "\(ConstantApp.CONSTANT_API_URL)\(EndPoints.characters.rawValue)\(ConstantApp.API_KEY)\(EndPoints.hash.rawValue)\(ConstantApp.HASH)"
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET" // aqui va GET
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                let listCharacter = try! JSONDecoder().decode(HerosModel.self, from: data)
                return listCharacter.data.results
                
            } else {
                throw NetworkHerosError.invalidResponse
            }
        } catch {
            NSLog("Error en heroes: \(error.localizedDescription)")
            throw NetworkHerosError.invalidData
        }
        
    }
}


final class NetworkHerosMock: NetworkHerosProtocol {
    
    
    
    func getHeros() async throws -> [ResultHeros] {
       
        let hero1 = ResultHeros(
            id: 1001,
            name: "3D-Man",
            description: "A hero with spider-like abilities.",
            modified: "2024-10-21T15:32:30-0400",
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1001",
            comics: Comics(available: 10, collectionURI: "http://gateway.marvel.com/comics", items: [], returned: 10),
            series: Comics(available: 5, collectionURI: "http://gateway.marvel.com/series", items: [], returned: 5),
            stories: Stories(available: 3, collectionURI: "http://gateway.marvel.com/stories", items: [], returned: 3),
            events: Comics(available: 2, collectionURI: "http://gateway.marvel.com/events", items: [], returned: 2),
            urls: [URLElement(type: .detail, url: "https://marvel.com/characters/1001/spider-man")]
        )

        let hero2 = ResultHeros(
            id: 1002,
            name: "A-Bomb",
            description: "A genius inventor and billionaire philanthropist.",
            modified: "2024-10-22T15:32:30-0400",
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: .jpg),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1002",
            comics: Comics(available: 8, collectionURI: "http://gateway.marvel.com/comics", items: [], returned: 8),
            series: Comics(available: 4, collectionURI: "http://gateway.marvel.com/series", items: [], returned: 4),
            stories: Stories(available: 5, collectionURI: "http://gateway.marvel.com/stories", items: [], returned: 5),
            events: Comics(available: 1, collectionURI: "http://gateway.marvel.com/events", items: [], returned: 1),
            urls: [URLElement(type: .detail, url: "https://marvel.com/characters/1002/iron-man")]
        )

        // Retornar los héroes simulados
        return [hero1, hero2]
    }
}
