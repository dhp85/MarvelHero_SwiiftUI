//
//  SeriesRowView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 26/1/25.
//

import SwiftUI

struct SeriesRowView: View {
    
    let series: ResultSeries
    
    var body: some View {
        Section {
            VStack {
                Text(series.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                
                // Imagen con manejo de estados
                AsyncImage(url: series.imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 300, height: 400)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    case .success(let image):
                        // Imagen cargada correctamente
                        image
                            .resizable()
                            .frame(width: 300, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 4)
                            )
                            .padding()
                        
                    case .failure:
                        // Imagen no disponible
                        VStack {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                            Text("Image not available")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 300, height: 400)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    @unknown default:
                        EmptyView()
                    }
                }
                
                // Descripción
                VStack {
                    Text("Description")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    if let description = series.description {
                        Text(description)
                            .font(.system(size: 18))
                    } else {
                        Text("No description available.")
                            .font(.system(size: 18))
                    }
                }
                
            }
            .padding(.vertical, 15)
            .background(Color.orange.opacity(0.3))
            .cornerRadius(20)
        }
    }
}

#Preview {

    // Mock de ResultSeries
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
    SeriesRowView(series: mockResultSeries1)
}
