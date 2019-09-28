//
//  WeatherVO.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

typealias CurrentWeatherInfoList = [(key: String, value: Any)]

class CurrentlyWeatherVO{
    private var currentWeatherInfo: [String : Any] = [:]
    private var orderedWeatherInfoList: CurrentWeatherInfoList!
    private var mainWeatherData: MainWeatherData!
    
    // MARK: MainWeatherData
    class MainWeatherData {
        var timeZone: String
        var summary: String
        var celciusTemperature: Double
        var icon: String
        var time: String
        init(timeZone: String = "서울특별시", time: String, icon: String, summary: String, celcius: Double){
            self.timeZone = timeZone
            self.summary = summary
            self.celciusTemperature = celcius
            self.time = time
            self.icon = icon
        }
    }
    
    init(currently: Currently){
        currentWeatherInfo = currently.convertDtoToDetailVO()
        let mainInfo = currently.convertDtoToMainData()
        buildMainWeatherData(mainInfo)
        self.orderedWeatherInfoList = displayWeatherInfoList()
    }
    
    func displayMainData(format: (MainWeatherData) -> Void ){
        format(mainWeatherData)
    }
    
    private func buildMainWeatherData(_ dictionary: [String: Any]){
        guard let time = dictionary[WeatherKeys.time] as? String,
            let summary = dictionary[WeatherKeys.summary] as? String,
            let temperature = dictionary[WeatherKeys.temperature] as? Double,
            let icon = dictionary[WeatherKeys.icon] as? String else {
            return
        }
        mainWeatherData = MainWeatherData.init(time: time,
                                               icon: icon,
                                               summary: summary,
                                               celcius: temperature)
    }
    
    func displayInformationListCount(format : ([String: Any]) -> Int) -> Int{
        if self.currentWeatherInfo.count == 0 {
            return 0
        }
        return format(currentWeatherInfo)
    }
    
    private func displayWeatherInfoList() -> CurrentWeatherInfoList{
        let result = currentWeatherInfo.sorted { (lhs: (key: String, value: Any), rhs: (key: String, value: Any)) -> Bool in
            return lhs.key < rhs.key
        }
        return result
    }
    
    func getInfoPairFromIndex(_ itemIndex: Int) -> [(key: String, value: Any)] {
        if orderedWeatherInfoList.endIndex > 2*itemIndex+1{
            return [orderedWeatherInfoList[2*itemIndex], orderedWeatherInfoList[2*itemIndex+1]]
        }
        return [orderedWeatherInfoList[2*itemIndex]]
    }
    
}

extension Notification.Name {
    static let DisplayMainWeatherData = Notification.Name(rawValue: "DisplayMainWeatherData")
}
