//
//  WeatherInfo.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation

struct WeatherInformation: Codable {
    var coord: Coord
    var weather = [Weather]()
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var id: Int
    var name: String
    var cod: Int
    var base: String
    var timezone: Int
}




