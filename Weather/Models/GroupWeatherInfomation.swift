//
//  groupWeatherInfo.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation

struct GroupWeatherInfomation: Codable {
    var cnt: Int
    var list = [WeatherInformationGroupVersion]()
}
