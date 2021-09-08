//
//  groupWeatherInfo.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation

struct GroupWeatherInformation: Codable {
    var cnt: Int
    var list = [WeatherInformationGroupVersion]()
}
