//
//  Daily.swift
//  _weather_api_test
//
//  Created by hw on 25/09/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation
// MARK: - Daily
struct Daily: Codable {
    let summary: String?
    let icon: String?
    let data: [DailyDatum]?
}
// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let sunriseTime, sunsetTime: Int?
    let moonPhase, precipIntensity, precipIntensityMax, precipProbability: Double?
    let precipIntensityMaxTime : Int?
    let precipAccumulation: Double?
    let precipType: String?
    let temperatureHigh: Double?
    let temperatureHighTime: Int?
    let temperatureLow: Double?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint, humidity, pressure, windSpeed, windGust: Double?
    let windBearing, windGustTime: Int?
    let cloudCover: Double?
    let uvIndex, uvIndexTime: Int?
    let visibility: Double?
    let temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?
    let ozone: Double?
}
