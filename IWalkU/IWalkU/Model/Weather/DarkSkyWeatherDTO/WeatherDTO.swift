//
//  WeatherDTO.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

// MARK: WeatherDTO
struct WeatherDTO: Codable {
    var latitude, longitude: Double
    var timezone: String
    var currently: Currently?
    var daily: Daily?
    var hourly: Hourly?
    var offset: Int
}


