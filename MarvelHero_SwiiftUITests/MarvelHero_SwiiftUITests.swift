//
//  MarvelHero_SwiiftUITests.swift
//  MarvelHero_SwiiftUITests
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Testing
@testable import MarvelHero_SwiiftUI

final class MarvelHero_SwiiftUITests {

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
            let seriesUseCase = SeriesUseCaseMock()
            let seriesViewModel = SeriesViewModel(idHero: 2, useCase: seriesUseCase)
            
            do {
                try await seriesViewModel.getSeriesHero(idHero: 2)
            } catch {
                #expect(true)
            }
        }
    }
    
    @Suite("SeriesView testing", .serialized) struct SeriesViewTests {
        @Test
        func seriesView() throws {
            let seriesView = SeriesView(vm: SeriesViewModel(idHero: 1, useCase: SeriesUseCaseMock()))
            #expect(seriesView.body != nil)
            
        }
    }

}

