//
//  Sys.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation

struct Sys: Codable {
    var sunset: Int
    var sunrise: Int
    var timezone: Int
    var country: String
}
