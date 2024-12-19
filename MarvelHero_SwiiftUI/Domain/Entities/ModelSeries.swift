//
//  ModelSeries.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import Foundation

// MARK: - HerosModel
struct HerosModelSeries: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassSeries
}

// MARK: - DataClass
struct DataClassSeries: Codable {
    let offset, limit, total, count: Int
    let results: [ResultSeries]
}

// MARK: - Result
struct ResultSeries: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [URLElementSeries]
    let startYear, endYear: Int
    let rating, type: String
    let modified: String
    let thumbnail: ThumbnailSeries
    let creators: Creators
    let characters: Characters
    let stories: StoriesSeries
    let comics, events: Characters
    let next, previous: Next?
    
    var imageUrl: URL? {
               let urlString = "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
               return URL(string: urlString)
           }
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [Next]
    let returned: Int
}

// MARK: - Next
struct Next: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}

// MARK: - Stories
struct StoriesSeries: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemSeries]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItemSeries: Codable {
    let resourceURI: String
    let name: String
    let type: String
}


// MARK: - Thumbnail
struct ThumbnailSeries: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElementSeries: Codable {
    let type: String
    let url: String
}
