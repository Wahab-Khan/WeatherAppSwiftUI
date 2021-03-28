//
//  ForcastViewModel.swift
//  WeatherApp
//
//  Created by macbook on 2021-03-27.
//

import Foundation

struct ForcastViewModel {
    
    let forcast : Forecast.Daily
    
    private static var dateFormat : DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM , d , yyyy"
        return dateFormatter
    }
    
    private static var numberFormat : NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    private static var numberForma2t : NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter
    }
    
    
    var day : String {
        return Self.dateFormat.string(from: forcast.dt)
    }
    
    var overview : String {
        return forcast.weather[0].description.capitalized
    }
    
    
    var high : String {
        return "H \(Self.numberFormat.string(for: forcast.temp.max) ?? "")"
    }
    
    var low : String {
        return "L \(Self.numberFormat.string(for: forcast.temp.max) ?? "")"
    }
    
    var pop : String{
        return "Pop \(Self.numberForma2t.string(for: forcast.pop) ?? "")"
    }
    
    var clouds : String{
        return "clouds \(forcast.clouds)"
    }
    
}
