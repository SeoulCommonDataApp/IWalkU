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
}
