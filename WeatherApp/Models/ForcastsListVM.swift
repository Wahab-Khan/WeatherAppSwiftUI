//
//  ForcastsListVM.swift
//  WeatherApp
//
//  Created by macbook on 2021-03-28.
//

import Foundation
import CoreLocation

class ForcastListViewModel : ObservableObject {
    
    @Published var forcasts : [ForcastViewModel] = []
    
    var location : String = ""
    
    
    func CallAPI(){
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let err = error{
                print(err.localizedDescription)
            }
            
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude{
                
                WebService.shared.invokeApi(stringURL: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly,alert&appid=eca6cd2fcdc51d887ae61820ab460113",
                                            dataModel: Forecast.self) {
                    (result) in
                    
                    print(result)
                    DispatchQueue.main.async {
                        self.forcasts = result.daily.map{ForcastViewModel(forcast: $0)}
                    }
                }
                
            }
        }
    }
    
    
}
