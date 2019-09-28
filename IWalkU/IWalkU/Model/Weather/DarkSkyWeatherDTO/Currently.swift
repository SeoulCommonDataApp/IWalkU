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
        dictionary.updateValue(UnixTimeFormatter.convertUnixTimeToKoreanFormat(time), forKey: "time")
        dictionary.updateValue(summary, forKey: "summary")
        dictionary.updateValue(icon, forKey: "icon")
        if let temperature = self.temperature {
            dictionary.updateValue(temperature, forKey: "temperature")
        }
        return dictionary
    }
    
    func convertDtoToDetailVO() -> [String: Any]{
        var dictionary = [String: Any]()
        
        if let nearestStormDistance = self.nearestStormDistance {
            dictionary.updateValue(nearestStormDistance, forKey: "돌풍예보")
        }
        if  let nearestStormBearing = self.nearestStormBearing {
            dictionary.updateValue(nearestStormBearing, forKey: "nearestStormBearing")
        }
        if let precipIntensity = self.precipIntensity, let precipProbability = self.precipProbability {
            dictionary.updateValue(precipIntensity, forKey: "강우/적설량")
            dictionary.updateValue(precipProbability, forKey: "비/눈 올 확률")
        }else if let precipIntensityError = precipIntensityError {
            dictionary.updateValue(precipIntensityError, forKey: "precipIntensityError")
        }
        if let precipType = self.precipType {
            dictionary.updateValue(precipType, forKey: "강우/강설 유형")
        }
        if let apparentTemperature = self.apparentTemperature, let uvIndex = self.uvIndex  {
            dictionary.updateValue(apparentTemperature, forKey: "체감온도")
            dictionary.updateValue(uvIndex, forKey: "자외선지수")
        }
        if let visibility = self.visibility {
            dictionary.updateValue(visibility, forKey: "시야")
        }
        if let windBearing = windBearing, let windGust = windGust, let windSpeed = windSpeed{
            dictionary.updateValue(windBearing, forKey: "windBearing")
            dictionary.updateValue(windGust, forKey: "windGust")
            dictionary.updateValue(windSpeed, forKey: "풍속")
        }
        return dictionary
    }
}
