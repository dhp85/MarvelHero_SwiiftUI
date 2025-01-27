//
//  StatusModel.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 26/1/25.
//

import Foundation

enum StatusApp: Equatable {
    case none
    case loading
    case loaded
    case error(error: String)
}
