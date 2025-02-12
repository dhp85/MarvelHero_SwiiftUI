//
//  MarvelHero_SwiiftUITests.swift
//  MarvelHero_SwiiftUITests
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Testing
import Foundation
import SwiftUI

@testable import MarvelHero_SwiiftUI

final class MarvelHero_SwiiftUITests {
    
    //MARK: -TESTING MODELOS.
    
    @Test("Test HerosModel")
    func modelHeros() async throws {
        
        let modeloheroes = HerosModel(code: 1, status: "ok", copyright: "ok", attributionText: "atributionText", attributionHTML: "AtriburionHtml", etag: "Etag", data: DataClass(offset: 1, limit: 2, total: 3, count: 4, results: []))
        #expect(modeloheroes != nil)
        #expect(modeloheroes.status == "ok")
    }
    
    @Test("Test HerosModel, ResultHeros var imageUrl")
    func modelHerosResults() throws {
        
        let modeloheroesresults = ResultHeros(id: 1, name: "Spiderman", description: "Amazing", modified: "ok", thumbnail: Thumbnail(path: "http", thumbnailExtension: Extension.jpg), resourceURI: "12344", comics: Comics(available: 1, collectionURI: "23", items: [], returned: 1), series: Comics(available: 3, collectionURI: "http", items: [], returned: 5), stories: Stories(available: 9, collectionURI: "http", items: [], returned: 2), events: Comics(available: 45, collectionURI: "http", items: [], returned: 4), urls: [])
        let image = modeloheroesresults.imageUrl
        #expect(image != nil)
        #expect(modeloheroesresults != nil)
        #expect(image?.absoluteString == "http/landscape_amazing.jpg")
    }
    
    @Test("HerosModelSeries")
    func modelSeries() async throws {
        let modelSeries = HerosModelSeries(code: 2, status: "ok", copyright: "copyright", attributionText: "12", attributionHTML: "url", etag: "456", data: DataClassSeries(offset: 2, limit: 3, total: 4, count: 5, results: []) )
        #expect(modelSeries != nil)
        #expect(modelSeries.status == "ok")
        
    }
    @Test("Test SeriesModel, ResultSeries var imageUrl")
    func modelSeriesResults() throws {
        
        let modeloseriesresults = ResultSeries(id: 1, title: "Spiderman", description: nil, resourceURI: "url", urls: [], startYear: 1, endYear: 2, rating: "ok", type: "Marvel", modified: "2", thumbnail: ThumbnailSeries(path: "http", thumbnailExtension: "extension"), creators: Creators(available: 1, collectionURI: "url", items: [], returned: 1), characters: Characters(available: 1, collectionURI: "url", items: [], returned: 1), stories: StoriesSeries(available: 3, collectionURI: "url", items: [], returned: 4), comics: Characters(available: 1, collectionURI: "url", items: [], returned: 1), events: Characters(available: 1, collectionURI: "url", items: [], returned: 1), next: nil, previous: nil)
        let image = modeloseriesresults.imageUrl
        #expect(image != nil)
        #expect(modeloseriesresults != nil)
        #expect(image?.absoluteString == "http.extension")
    }
    
    // MARK: -TESTING CASOS DE USO.
    
    @Suite("Casos de uso", .serialized) struct UseCaseTests {
        @Test("Caso de uso de heros")
        func herosUseCase() async throws {
            let herosUseCase = HerosUseCaseMock()
            let herosViewModel = HerosViewModel(useCase: herosUseCase)
            
            try await herosViewModel.getHeros()
            
            #expect(herosViewModel.heros != nil)
            #expect(herosViewModel.heros.count == 2)
            #expect(herosViewModel.heros[0].name == "3D-Man")
            #expect(herosViewModel.heros[1].name == "A-Bomb")
            
        }
        
        
        @Test("Test funcion searchHeros")
        func searchHero() async throws {
            let herosUseCase = HerosUseCaseMock()
            let herosViewModel = HerosViewModel(useCase: herosUseCase)
            try await herosViewModel.searchHeros(search: "A-")
            #expect(herosViewModel.filterHeros != nil)
            #expect(herosViewModel.filterHeros.count == 1)
            #expect(herosViewModel.filterHeros[0].name == "A-Bomb")
        }
        
        @Test("Caso de uso de series")
        func seriesUseCase() async throws {
            let seriesUseCase = SeriesUseCaseMock()
            let seriesViewModel = SeriesViewModel(idHero: 1, useCase: seriesUseCase)
            
            try await seriesViewModel.getSeriesHero(idHero: 1)
            
            #expect(seriesViewModel.seriesList != nil)
            #expect(seriesViewModel.seriesList.count == 2)
            #expect(seriesViewModel.seriesList[0].title == "Avengers: The Initiative(2007-2010)" )
            #expect(seriesViewModel.seriesList[1].title == "DeadPool")
        }
        
        @Test("Caso de uso series error")
        func seriesUseCaseError() async throws {
            let idError = 2 //  ID que causa error. Al ser diferente a 1 causa un error. Esta implementado en SeriesUseCaseMock.
            let seriesUseCase = SeriesUseCaseMock()
            let seriesViewModel = SeriesViewModel(idHero: idError, useCase: seriesUseCase)
            
            var didThrowError = false
            
            do {
                try await seriesViewModel.getSeriesHero(idHero: idError)
            } catch let seriesError as NetworkHerosError {
                #expect(seriesError == .invalidData)
                didThrowError = true
            }
            #expect(didThrowError, "No se capturó ningún error")
        }
    }
}

