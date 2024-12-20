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
    
    @Suite("SeriesView testing", .serialized) struct SeriesViewTests {
        @Test
        func seriesView() throws {
            let seriesView = SeriesView(vm: SeriesViewModel(idHero: 1, useCase: SeriesUseCaseMock()))
            #expect(seriesView.body != nil)
            
        }
    }

}

/*var imageUrl: URL? {
 let urlString = "\(thumbnail.path)/landscape_amazing.\(thumbnail.thumbnailExtension.rawValue)"
 return URL(string: urlString)
}*/
