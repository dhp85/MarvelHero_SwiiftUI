//
//  HerosDetailView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 18/12/24.
//

import SwiftUI

struct HerosDetailView: View {
    
    var hero: Result
    
    var body: some View {
        HStack{
            Text(hero.name)
        }
        VStack{
            AsyncImage(url: hero.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(style: StrokeStyle(lineWidth: 8)))
                
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    HerosDetailView(hero: Result(
        id: 1001,
        name: "3-D Man",
        description: "A hero with spider-like abilities.",
        modified: "2024-10-21T15:32:30-0400",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1001",
        comics: Comics(available: 10, collectionURI: "http://gateway.marvel.com/comics", items: [], returned: 10),
        series: Comics(available: 5, collectionURI: "http://gateway.marvel.com/series", items: [], returned: 5),
        stories: Stories(available: 3, collectionURI: "http://gateway.marvel.com/stories", items: [], returned: 3),
        events: Comics(available: 2, collectionURI: "http://gateway.marvel.com/events", items: [], returned: 2),
        urls: [URLElement(type: .detail, url: "https://marvel.com/characters/1001/spider-man")]
    ))
}
