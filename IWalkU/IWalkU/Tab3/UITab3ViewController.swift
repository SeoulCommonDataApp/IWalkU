//
//  UITab3ViewController.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import UIKit

class UITab3ViewController: UIViewController {
    @IBAction func touchUpMoreButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Weather", bundle: nil)
        guard let detailWeatherViewController = storyboard.instantiateViewController(withIdentifier: "UIWeatherViewController") as? UIWeatherViewController else {
            return
        }
        present(detailWeatherViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
