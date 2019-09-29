//
//  SeoulAirQualityDTO.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

class SeoulAirQualityReceiver {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var airQualityInfo: SeoulAirPollutionDTO!
    func recevieAirQualityInfo(_ url: String = ApiURL.SeoulAirQuality.description,
                                key: String,
                                type: String = "\(SeoulAirQualityAPIs.type.description)",
                                service: String = "\(SeoulAirQualityAPIs.service.description)",
                                start: Int = 1, end: Int = 5) {
        let airQualityUrl: String = "\(url)/\(key)/\(type)/\(service)/\(start)/\(end)"
        let urlComponents = URLComponents(string: airQualityUrl)!
        guard let componentURL = urlComponents.url else {
            return
        }
        receiveDataFromURL(componentURL)
    }
    
    private func receiveDataFromURL(_ url: URL){
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            if let responseError = error {
                let info = ["error" : responseError]
                NotificationCenter.default.post(name: .NetworkErrorReceivingAirQualityInfo, object: nil, userInfo: info)
            }else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let decoder = JSONDecoder.init()
                guard let decodedJSONObject = try? decoder.decode(SeoulAirPollutionDTO.self, from: data) else {
                    return
                }
                self?.airQualityInfo = decodedJSONObject
                guard let rowData = self?.airQualityInfo.retrieveRepresentialData() else {
                    return
                }
                let keyValuePairList = rowData.convertPropertiesToKeyValueList()
                let airQualityRowDataList = AirQualityRowDataList.init(keyValuePairList)
                
                NotificationCenter.default.post(name: .CompleteReceivingAirQualityInfo, object: airQualityRowDataList)
            }
        }
        dataTask?.resume()
    }
}

extension Notification.Name {
    static var CompleteReceivingAirQualityInfo = Notification.Name(rawValue: "CompleteReceivingAirQualityInfo")
    static var NetworkErrorReceivingAirQualityInfo = Notification.Name(rawValue: "NetworkErrorReceivingAirQualityInfo")
}
