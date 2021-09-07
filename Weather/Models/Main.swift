//
//  Main.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation

struct Main: Codable {
    var humidity: Int
    var temp_min: Double
    var temp_max: Double
    var temp: Double
    var pressure: Int
    var feels_like: Double
}
