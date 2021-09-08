//
//  CityInfomation.swift
//  Weather
//
//  Created by Savage on 8/9/21.
//

import Foundation

struct CityInformation: Codable {
    var id: Int
    var name: String
    var country: String
    var coord: Coord
}
