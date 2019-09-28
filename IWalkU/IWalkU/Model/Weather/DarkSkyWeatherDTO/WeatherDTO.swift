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
    private var latitude, longitude: Double
    private var timezone: String
    private var currently: Currently?
    private var daily: Daily?
    private var hourly: Hourly?
    private var offset: Int
    
    func buildCurrentWeatherInfo() -> CurrentlyWeatherVO?{
        guard let currently = self.currently else{
            return nil
        }
        return CurrentlyWeatherVO.init(currently: currently)
    }
}


