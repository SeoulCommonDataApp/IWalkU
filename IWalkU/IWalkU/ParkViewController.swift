//
//  ParkViewController.swift
//  IWalkU
//
//  Created by joon-ho kil on 9/26/19.
//  Copyright © 2019 DandD. All rights reserved.
//

import UIKit

class ParkViewController: UIViewController {
    let seoulMainParkDataSource = SeoulMainParkDataSource()
    
    @IBOutlet weak var parkTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        parkTableView.dataSource = seoulMainParkDataSource
        
    }
    
    
    

}
