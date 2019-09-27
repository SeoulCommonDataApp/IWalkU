//
//  UIWeatherViewController.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import UIKit

class UIWeatherViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    private var weatherReceiver: WeatherReceiver!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherTableView.dataSource = self
        configureWeatherData()
        Notification.default.addObserver()
    }
    
    
    @IBAction func closeVC(){
        self.dismiss(animated: true)
    }
    
    private func configureWeatherData() {
        weatherReceiver = WeatherReceiver.init()
        weatherReceiver.recevieWeatherDTO(key: ApiURL.darkSkyWeatherKey.description)
    }
    
    
}

extension UIWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WeatherTableViewCell
        return UITableViewCell()
    }
    
    
}


