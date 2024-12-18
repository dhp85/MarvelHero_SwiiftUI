//
//  HerosRowView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 18/12/24.
//

import SwiftUI

struct HerosRowView: View {
    let hero: Result
    
    var body: some View {
        ZStack {
            AsyncImage(url: hero.imageUrl) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(style: StrokeStyle(lineWidth: 4)))
                    .shadow(color: Color.black.opacity(1), radius: 20, x: 0, y: 20)
                
            } placeholder: {
                ProgressView()
            }
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1.8), Color.clear]), startPoint: .top, endPoint: .center)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
            VStack {
                HStack {
                    Text(hero.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(.top, 20)
                    
                    
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    HerosRowView(hero: Result(
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
