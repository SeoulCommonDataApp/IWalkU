//
//  WeatherKeys.swift
//  IWalkU
//
//  Created by hw on 28/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

struct WeatherKeys{
    static let time = "time"
    static let summary = "summary"
    static let icon = "icon"
    static let temperature = "temperature"
    static let precipIntensity = "강우(적설)량"
    static let precipProbability = "강우(적설)확률"
    static let precipIntensityError = "예보 에러"
    static let precipType = "강우(적설)유형"
    static let apparentTemperature = "체감온도"
    static let uvIndex = "자외선지수"
    static let visibility = "시야"
    static let windBearing = "바람방향(°)"
    static let windGust = "돌풍"
    static let windSpeed = "풍속"
    static func addUnits( key: String, value: String) -> String{
        switch key {
        case temperature, apparentTemperature:
            return "\(value) °C"
        case precipIntensity:
            return "\(value) mm"
        case precipProbability:
            return "\(value) %"
        case uvIndex:
            guard let index = Int(value) else{
                return "\(value)"
            }
            return determineUVIndex(index)
        case visibility:
            return "\(value) km"
        case windBearing :
            guard let rad = Int(value) else{
                return "\(value)"
            }
            return determineWindDirection(rad)
        case windGust, windSpeed :
            return "\(value) m/s"
        default:
            return "\(value)"
        }
    }
    
    private static func determineWindDirection(_ value: Int) -> String{
        if value <= 67 && value > 22 {
            return "북동풍"
        }else if value <= 112 && value > 67 {
            return "동풍"
        }else if value <= 157 && value > 112 {
            return "남동풍"
        }else if value <= 202 && value > 157 {
            return "남풍"
        }else if value <= 247 && value > 202 {
            return "남서풍"
        }else if value <= 292 && value > 247 {
            return "서풍"
        }else if value < 337 && value > 292 {
            return "북서풍"
        }else {
            return "북풍"
        }
    }
    private static func determineUVIndex(_ index: Int) -> String {
        if index < 3 {
            return "낮음"
        }else if index < 6 {
            return "양호"
        }else if  index < 8 {
            return "약간 높음"
        }else if index < 11 {
            return "높음"
        }else {
            return "매우 높음"
        }
    }
}
