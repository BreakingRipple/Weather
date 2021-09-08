//
//  WeatherInformationGroupVersion.swift
//  Weather
//
//  Created by Savage on 8/9/21.
//

import Foundation


struct WeatherInformationGroupVersion: Codable {
    var coord: Coord
    var sys: Sys
    var weather = [Weather]()
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var id: Int
    var name: String
}
