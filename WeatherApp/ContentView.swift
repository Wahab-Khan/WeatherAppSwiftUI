//
//  ContentView.swift
//  WeatherApp
//
//  Created by macbook on 2021-03-26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var forcastsLVM = ForcastListViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    TextField("Enter the Location", text: $forcastsLVM.location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        forcastsLVM.CallAPI()
                    }) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title2)
                    }
                }
                
                List(forcastsLVM.forcasts, id: \.day) {day in
                        VStack(alignment: .leading){
                            Text(day.day)
                                .bold()
                            HStack{
                                Image(systemName: "hourglass")
                                    .font(.title)
                                    .frame(width: 50, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 8.0)
                                                    .fill(Color.blue))
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(day.high)
                                        Text(day.low)
                                    }
                                    HStack{
                                        Text(day.clouds)
                                        Text(day.pop)
                                    }
                                }
                                
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                
            }
            .padding(.horizontal)
            .navigationTitle("Weather Forcast")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
