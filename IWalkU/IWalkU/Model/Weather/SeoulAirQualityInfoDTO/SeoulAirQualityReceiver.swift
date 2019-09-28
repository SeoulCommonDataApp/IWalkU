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
    var airQualityInfo: SeoulAirPollutionInfo!
    func recevieAirQualityInfo(_ url: String = ApiURL.SeoulAirQuality.description,
        key: String,
        type: String = "\(SeoulAirQualityAPIs.type.description)",
        service: String = "\(SeoulAirQualityAPIs.service.description)",
        start: Int = 1,
        end: Int = 5 ) -> SeoulAirPollutionInfo? {
        
        let airQualityUrl: String = "\(url)/\(key)/\(type)/\(service)/\(start)/\(end)"
        
        var urlComponents = URLComponents(string: airQualityUrl)!
        guard let componentURL = urlComponents.url else{
            return nil
        }
        
        dataTask = defaultSession.dataTask(with: componentURL) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            if let responseError = error {

             }else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                 let decoder = JSONDecoder.init()
                 guard let decodedJSONObject = try? decoder.decode(SeoulAirPollutionInfo.self, from: data) else {
                        return
                 }
             self?.airQualityInfo = decodedJSONObject
//             let encoder = JSONEncoder()
//             encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
//             do {
//                 let jsonData = try encoder.encode(self?.airQualityInfo!)
//                if let jsonString = String(data: jsonData, encoding: .utf8) {
//                    print(jsonString)
//                }
//                }catch{
//                    print("encode error")
//                }
            }
        }
        dataTask?.resume()
        return airQualityInfo
    }
}
