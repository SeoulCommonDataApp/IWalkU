//
//  SeoulMainParkDataSource.swift
//  IWalkU
//
//  Created by joon-ho kil on 9/26/19.
//  Copyright © 2019 DandD. All rights reserved.
//

import UIKit

class SeoulMainParkDataSource: NSObject, UITableViewDataSource {
    var model = SeoulMainPark()
    
    override init() {
        let path = Bundle.main.path(forResource: "SeoulMainParkList", ofType: "json")
        do {
            if let data = try? String(contentsOfFile: path!).data(using: .utf8){
                model =  try JSONDecoder().decode(SeoulMainPark.self, from: data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkTableViewCell", for: indexPath) as! ParkTableViewCell
        
        cell.putInfo(parkInfo: model[indexPath.row])
        
        return cell
    }
}
