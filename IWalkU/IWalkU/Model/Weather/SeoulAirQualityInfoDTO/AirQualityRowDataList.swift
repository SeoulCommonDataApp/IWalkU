//
//  AirQualityRowDataList.swift
//  IWalkU
//
//  Created by hw on 29/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

class AirQualityRowDataList {
    private var rowDataList : [(key: String, value: Any)] = []
    
    init(_ list : [(key: String, value: Any)] ){
        rowDataList = list
    }
    
    func getInfoPairFromIndex(_ itemIndex: Int) -> [(key: String, value: Any)] {
        if rowDataList.endIndex > 2*itemIndex+1{
           return [rowDataList[2*itemIndex], rowDataList[2*itemIndex+1]]
        }
        return [rowDataList[2*itemIndex]]
    }
    
    func displayInformationListCount(format : ([(key: String, value: Any)]) -> Int) -> Int{
        if self.rowDataList.count == 0 {
            return 0
        }
        return format(rowDataList)
    }
}
