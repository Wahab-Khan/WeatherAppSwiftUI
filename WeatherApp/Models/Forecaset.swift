//
//  Forecaset.swift
//  WeatherApp
//
//  Created by macbook on 2021-03-26.
//

import Foundation

struct Forecast: Codable {
    let daily : [Daily]
    
    
    struct Daily: Codable {
        let dt : Date
        
        let temp : Temp
        
        struct Temp: Codable {
            let min : Double
            let max : Double
        }
        
        struct Weather: Codable {
            let id : Int
            let description : String
            let icon : String
            var weatherIconURL : URL {
                let url = "http://openweathermap.org/img/wn/\(icon)@2x.png"
                return URL(string: url)!
            }
        }
        
        let weather : [Weather]
        var clouds : Int
        let pop : Double
    }
}
