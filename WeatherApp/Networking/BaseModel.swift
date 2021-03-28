//
//  BaseModel.swift
//  WeatherApp
//
//  Created by macbook on 2021-03-26.
//

import Foundation

class BaseModel<T : Codable>: Codable {
    dynamic var StatusCode : Int?
    dynamic var StatusMessage : String?
    dynamic var Data : T?
    dynamic var ErrorMessage : String?
    
    
    func isSecussful() -> Bool {
        if StatusCode == 200 {
            return true
        }
        return false
    }
    
}
