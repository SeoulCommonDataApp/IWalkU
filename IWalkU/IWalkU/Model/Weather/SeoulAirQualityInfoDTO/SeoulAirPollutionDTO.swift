//
//  AirPolutionInfo.swift
//  _weather_api_test
//
//  Created by hw on 25/09/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation
//

// MARK: - SeoulAirPollutionDTO
struct SeoulAirPollutionDTO: Codable {
    let listAvgOfSeoulAirQualityService: ListAvgOfSeoulAirQualityService?
    enum CodingKeys: String, CodingKey {
        case listAvgOfSeoulAirQualityService = "ListAvgOfSeoulAirQualityService"
    }
    func retrieveRepresentialData() -> AirQualityRowData?{
        guard let list = self.listAvgOfSeoulAirQualityService,
            let rowDataList = list.row else{
            return nil
        }
        if rowDataList.count == 0 {
             return nil
        }
        return rowDataList[0]
    }
}

// MARK: - ListAvgOfSeoulAirQualityService
struct ListAvgOfSeoulAirQualityService: Codable {
    let listTotalCount: Int?
    let result: Result?
    let row: [AirQualityRowData]?

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String?

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}
