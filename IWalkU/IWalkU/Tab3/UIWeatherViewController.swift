//
//  UIWeatherViewController.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import UIKit

class UIWeatherViewController: UIViewController {
    
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var weatherSummaryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherTableView: UITableView!
    private var weatherReceiver: WeatherReceiver!
    private var airQualityReceiver: SeoulAirQualityReceiver!
    private var currentWeatherInfo: CurrentlyWeatherVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableSettings()
        self.weatherTableView.dataSource = self
        
        configureWeatherData()
        NotificationCenter.default.addObserver(self, selector: #selector(convertReceivingWeatherDTOToVO), name: .CompleteReceivingWeatherInfo, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(convertReceivingWeatherDTOToVO), name: .DisplayMainWeatherData, object: nil)
    }
    // MARK : @IBAction
    @IBAction func closeVC(){
        self.dismiss(animated: true)
    }
    
    private func configureTableSettings(){
        weatherTableView.rowHeight = 80
    }
    
    @objc func convertReceivingWeatherDTOToVO(_ notification: Notification ){
        guard let weatherInfo = notification.object as? WeatherDTO, let result = weatherInfo.buildCurrentWeatherInfo() else {
            return
        }
        currentWeatherInfo = result
        displayMainWeatherData()
    }

    private func displayMainWeatherData(){
        DispatchQueue.main.async { [weak self] in
            self?.currentWeatherInfo.displayMainData { (mainData: CurrentlyWeatherVO.MainWeatherData) in
                  self?.timeLabel.text = mainData.time
                  self?.timeZoneLabel.text = mainData.timeZone
                  self?.temperatureLabel.text = String(format:"%.1f", mainData.celciusTemperature)
                  self?.weatherSummaryLabel.text = mainData.summary
            }
            self?.weatherTableView.reloadData()
        }
    }
    
    private func configureWeatherData() {
        weatherReceiver = WeatherReceiver.init()
        weatherReceiver.recevieWeatherDTO(key: ApiURL.darkSkyWeatherKey.description)
    }
    private func configureAirPollutionData(){
        airQualityReceiver = SeoulAirQualityReceiver.init()
        airQualityReceiver.recevieAirQualityInfo(key: ApiURL.darkSkyWeatherKey.description)
    }
    
}

extension UIWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let initializedWeatherInfo = currentWeatherInfo else {
            return 0
        }
        let count = initializedWeatherInfo.displayInformationListCount { (currentWeatherInfo: [String : Any]) -> Int in
            return currentWeatherInfo.count%2 == 0 ? currentWeatherInfo.count/2 : (currentWeatherInfo.count+1)/2
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard currentWeatherInfo != nil else {
            return WeatherTableViewCell()
        }
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "weatherTableViewCell") as! WeatherTableViewCell
        let elementPair = currentWeatherInfo.getInfoPairFromIndex(indexPath.item)
        addUnitsOnSubtitle(tableViewCell: tableViewCell, pair: elementPair)
        return tableViewCell
    }
    
    private func addUnitsOnSubtitle( tableViewCell : WeatherTableViewCell, pair:  [(key: String, value: Any)] ){
        tableViewCell.leftTitle.text = pair[0].key
        let addedUnitsOnLeft = WeatherKeys.addUnits(key: pair[0].key, value: castValueDataToStringType(pair[0].value))
        tableViewCell.leftSubtitle.text = addedUnitsOnLeft
        if pair.count == 2{
            tableViewCell.rightTitle.text = pair[1].key
            let addedUnitsOnRight = WeatherKeys.addUnits(key: pair[1].key, value: castValueDataToStringType(pair[1].value))
            tableViewCell.rightSubtitle.text = addedUnitsOnRight
        }
    }
    
    private func clearTableViewCell(_ tableViewCell: WeatherTableViewCell) {
        tableViewCell.rightSubtitle.text = ""
        tableViewCell.rightTitle.text = ""
        tableViewCell.leftSubtitle.text = ""
        tableViewCell.leftTitle.text = ""
    }
    
    private func castValueDataToStringType(_ value: Any) -> String {
        switch value {
        case let value as Double:
            let converted = String(format:"%.1f", value)
            return converted
        case let value as Int:
            let converted = String(format:"%d", value)
            return converted
        default :
            let converted = "\(value)"
            return converted
        }
    }
    
}


