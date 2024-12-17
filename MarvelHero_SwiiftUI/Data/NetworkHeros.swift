//
//  NetworkHeros.swift
//  Marvel_SwiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

enum NetworkHerosError: Error {
    case invalidResponse
    case invalidData
}

protocol NetworkHerosProtocol {
    func getHeros() async throws -> [Result]
    
}
    
final class NetworkHeros: NetworkHerosProtocol {
    func getHeros() async throws -> [Result] {
        
        let baseURL = "\(ConstantApp.CONSTANT_API_URL)\(EndPoints.characters.rawValue)"
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                return try JSONDecoder().decode([Result].self, from: data)
            } else {
                throw NetworkHerosError.invalidResponse
            }
        } catch {
            NSLog("Error en heroes: \(error.localizedDescription)")
            throw NetworkHerosError.invalidData
        }
        
    }
}
