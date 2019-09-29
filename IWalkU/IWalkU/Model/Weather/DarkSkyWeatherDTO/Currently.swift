//
//  Currently.swift
//  _weather_api_test
//
//  Created by hw on 25/09/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

// MARK: - Currently
struct Currently: Codable {
    let time: Int
    let summary, icon: String
    let nearestStormDistance: Int?
    let nearestStormBearing: Int?
    let precipIntensity, precipProbability: Double?
    let precipIntensityError: Double?
    let precipType: String?
    let temperature, apparentTemperature, dewPoint, humidity: Double?
    let pressure, windSpeed, windGust: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let visibility, ozone: Double?
    
    func convertDtoToMainData() -> [String: Any]{
        var dictionary = [String: Any]()
        dictionary.updateValue(UnixTimeFormatter.convertUnixTimeToKoreanFormat(time), forKey: WeatherKeys.time)
        dictionary.updateValue(summary, forKey: WeatherKeys.summary)
        dictionary.updateValue(icon, forKey: WeatherKeys.icon)
        if let temperature = self.temperature {
            dictionary.updateValue(temperature, forKey: WeatherKeys.temperature)
        }
        return dictionary
    }
    
    func convertDtoToDetailVO() -> [String: Any]{
        var dictionary = [String: Any]()
        
        if let precipIntensity = self.precipIntensity, let precipProbability = self.precipProbability {
            dictionary.updateValue(precipIntensity, forKey: WeatherKeys.precipIntensity)
            dictionary.updateValue(precipProbability, forKey: WeatherKeys.precipProbability)
        }else if let precipIntensityError = precipIntensityError {
            dictionary.updateValue(precipIntensityError, forKey: WeatherKeys.precipIntensityError)
        }
        if let precipType = self.precipType {
            dictionary.updateValue(precipType, forKey: WeatherKeys.precipType)
        }
        if let apparentTemperature = self.apparentTemperature, let uvIndex = self.uvIndex  {
            dictionary.updateValue(apparentTemperature, forKey: WeatherKeys.apparentTemperature)
            dictionary.updateValue(uvIndex, forKey: WeatherKeys.uvIndex)
        }
        if let visibility = self.visibility {
            dictionary.updateValue(visibility, forKey: WeatherKeys.visibility)
        }
        if let windBearing = windBearing, let windGust = windGust, let windSpeed = windSpeed{
            dictionary.updateValue(windBearing, forKey: WeatherKeys.windBearing)
            dictionary.updateValue(windGust, forKey: WeatherKeys.windGust)
            dictionary.updateValue(windSpeed, forKey: WeatherKeys.windSpeed)
        }
        return dictionary
    }
}
