//
//  SeoulWeatherQualityAPIs.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation
enum SeoulAirQualityAPIs: String, CustomStringConvertible {
    case type = "json"
    case service = "ListAvgOfSeoulAirQualityService"
    var description: String {
        return String(self.rawValue)
    }
}
