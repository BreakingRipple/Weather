//
//  Weather.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation

struct Weather: Codable {
    var main: String
    var icon: String
    var description: String
    var id: Int
}
