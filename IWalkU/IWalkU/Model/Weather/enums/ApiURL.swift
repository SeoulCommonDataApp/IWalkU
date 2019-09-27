//
//  ApiURL.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

enum ApiURL: String, CustomStringConvertible {
    case darkSkyWeather = "https://api.darksky.net/forecast"
    case SeoulAirQuality = "http://openapi.seoul.go.kr:8088"
    var description: String {
        return self.rawValue
    }
}

