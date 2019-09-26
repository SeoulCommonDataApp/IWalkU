//
//  SeoulMainPark.swift
//  IWalkU
//
//  Created by joon-ho kil on 9/26/19.
//  Copyright © 2019 DandD. All rights reserved.
//

import Foundation

// MARK: - SeoulMainParkElement
struct SeoulMainParkElement: Codable {
    let pAddr: String
    let guidance: String?
    let pZone: String?
    let pName: String
    let useRefer: String?
    let pAdmintel: String
    let openDt, mainEquip: String?
    let templateURL: String?
    let gLatitude: String?
    let pPark: String
    let pListContent, gLongitude, area: String?
    let pImg: String
    let visitRoad, mainPlants, longitude: String?
    let pIdx: Int
    let latitude: String?
    
    enum CodingKeys: String, CodingKey {
        case pAddr = "p_addr"
        case guidance
        case pZone = "p_zone"
        case pName = "p_name"
        case useRefer = "use_refer"
        case pAdmintel = "p_admintel"
        case openDt = "open_dt"
        case mainEquip = "main_equip"
        case templateURL = "template_url"
        case gLatitude = "g_latitude"
        case pPark = "p_park"
        case pListContent = "p_list_content"
        case gLongitude = "g_longitude"
        case area
        case pImg = "p_img"
        case visitRoad = "visit_road"
        case mainPlants = "main_plants"
        case longitude
        case pIdx = "p_idx"
        case latitude
    }
}

typealias SeoulMainPark = [SeoulMainParkElement]
