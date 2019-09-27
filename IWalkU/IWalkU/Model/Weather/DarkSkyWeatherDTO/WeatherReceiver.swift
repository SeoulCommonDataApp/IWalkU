//
//  WeatherReceiver.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

class WeatherReceiver{
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var weatherDTO: WeatherDTO!

    func recevieWeatherDTO(_ url: String = ApiURL.darkSkyWeather.description,
                          key: String,
                          latitude: Double = SeoulStandardCoordinate.latitude.rawValue,
                          longitude: Double = SeoulStandardCoordinate.longitude.rawValue,
                          language: String = Lang.ko.rawValue,
                          units: String = Units.ca.rawValue,
                          excludeInfo: String = "exclude=flag,hourly") -> WeatherDTO? {
        let basicWeatherUrl = "\(url)/\(key)/\(latitude),\(longitude)"
       
        var urlComponents = URLComponents(string: basicWeatherUrl)!
        urlComponents.query = "\(excludeInfo)&lang=\(language)&units=\(units)"
        
        guard let componentURL = urlComponents.url else{
            return nil
        }
       
        dataTask = defaultSession.dataTask(with: componentURL) { [weak self] data, response, error in
            defer {
               self?.dataTask = nil
            }
            if let responseError = error {
                      print("network error occured : \(responseError)")
            }else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let decoder = JSONDecoder.init()
                guard let decodedJSONObject = try? decoder.decode(WeatherDTO.self, from: data) else {
                   print("data : \(data)")
                   print("convert error ")
                   return
                }
                self?.weatherDTO = decodedJSONObject
                let encoder = JSONEncoder()
                encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
                do{
                    let jsonData = try encoder.encode(self?.weatherDTO!)
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                          print(jsonString)
                    }
                }catch{
                    print("encode error")
                }
           }
       }
       dataTask?.resume()
       return weatherDTO
   }
}
