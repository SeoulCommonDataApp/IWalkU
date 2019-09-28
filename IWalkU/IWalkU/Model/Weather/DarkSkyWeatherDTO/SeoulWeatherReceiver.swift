//
//  WeatherReceiver.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

class SeoulWeatherReceiver{
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var weatherDTO: SeoulWeatherDTO!

    func recevieWeatherDTO(_ url: String = ApiURL.darkSkyWeather.description,
                          key: String,
                          latitude: Double = SeoulStandardCoordinate.latitude.rawValue,
                          longitude: Double = SeoulStandardCoordinate.longitude.rawValue,
                          language: String = Lang.ko.rawValue,
                          units: String = WeightsAndMeasureUnits.ca.rawValue,
                          excludeInfo: String = "exclude=flag,hourly") {
        let basicWeatherUrl = "\(url)/\(key)/\(latitude),\(longitude)"
        var urlComponents = URLComponents(string: basicWeatherUrl)!
        urlComponents.query = "\(excludeInfo)&lang=\(language)&units=\(units)"
        guard let componentURL = urlComponents.url else {
            return 
        }
        receiveDataFromURL(componentURL)
    }
    
    private func receiveDataFromURL(_ url: URL){
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            if let error = error {
                let info = ["error" : error]
                NotificationCenter.default.post(name: .NetworkErrorReceivingWeatherInfo, object: nil, userInfo: info)
            }else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let decoder = JSONDecoder.init()
                guard let decodedJSONObject = try? decoder.decode(SeoulWeatherDTO.self, from: data) else {
                    return
                }
                self?.weatherDTO = decodedJSONObject
                guard let weatherInfo = self?.weatherDTO else {
                    return
                }
                NotificationCenter.default.post(name: .CompleteReceivingWeatherInfo, object: weatherInfo)
            }
        }
        dataTask?.resume()
    }
}

extension Notification.Name {
    static var CompleteReceivingWeatherInfo = Notification.Name(rawValue: "CompleteReceivingWeatherInfo")
    static var NetworkErrorReceivingWeatherInfo = Notification.Name(rawValue: "NetworkErrorReceivingWeatherInfo")
}
