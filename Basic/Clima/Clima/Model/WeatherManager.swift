//
//  WeatherManager.swift
//  Clima
//
//  Created by ArunSha on 24/03/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation


struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3cc913675a5741818d6feaf11955e809&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let uRL = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: uRL)
    }
    
    func fetchWeather(latitude lat: CLLocationDegrees, Longitude long: CLLocationDegrees ) {
        let uRL = "\(weatherURL)&lat=\(lat)&lon=\(long)"
        performRequest(urlString: uRL)
    }
    
    func performRequest(urlString: String) {
        
        //create URL
        if let url = URL(string: urlString) {
            
            // create URLSession
            let session = URLSession(configuration: .default)
            // Give session to a Task
           
            // let task = session.dataTask(with: url, completionHandler: handler(data:urlResponse:error:))
//            let task = session.dataTask(with: url) { print($0,$1,$2)
//                print("HI")
//            }
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if(error != nil){
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                if let safeData = data {
                   // let dataString = String(data: safeData, encoding: .utf8)
                   // print(dataString!)
                    if let weatherModelData = self.parseData(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weatherModelData)
                    }
                    
                   // wDelegate.didUpdateWeather(weather: weather!)
                    //print("Delegate Function: ",self.wDelegate)
                }
            }
            // start the task
            task.resume()
            
        }
        
    }
    
    func parseData(weatherData: Data) -> WeatherModel?  {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherId = decodeData.weather[0].id
            let cityName = decodeData.name
            let temp = decodeData.main.temp
        
            let weather = WeatherModel(conditionId: weatherId, cityName: cityName, temp: temp)
//            print("Weather Temp String ",weather.tempString)
           // let weatherConditionName = getCondtionName(weatherId: weatherId)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    

    
    func handler(data: Data?, urlResponse: URLResponse?, error: Error? ) {
        
        if(error != nil){
            print("ERROR: ",error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
