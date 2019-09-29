//
//  UnixTimeFormatter.swift
//  IWalkU
//
//  Created by hw on 27/09/2019.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

struct UnixTimeFormatter{
    static func convertUnixTimeToDate(_ unix_timestamp: Int) -> String{
        let unixTime = Double(unix_timestamp)//{
        let date = Date.init(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.init(identifier: "UTC+9")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    static func convertUnixTimeToKoreanFormat(_ unix_timestamp: Int) -> String{
         let unixTime = Double(unix_timestamp)//{
         let date = Date.init(timeIntervalSince1970: unixTime)
         let dateFormatter = DateFormatter()
         dateFormatter.timeZone = TimeZone.init(identifier: "UTC+9")
         dateFormatter.dateFormat = "M월 d일 H시 m분"
         return dateFormatter.string(from: date)
    }
}
