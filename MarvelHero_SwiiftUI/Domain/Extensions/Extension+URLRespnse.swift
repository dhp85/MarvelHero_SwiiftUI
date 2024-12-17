//
//  Extension+URLRespnse.swift
//  Marvel_SwiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import Foundation

extension URLResponse {
 
    func getResponseCode() -> Int {
        if let resp = self as? HTTPURLResponse {
            return resp.statusCode
        } else{
            return 500
        }
        
    }
    
}
