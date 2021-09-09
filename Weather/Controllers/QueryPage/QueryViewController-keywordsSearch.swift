//
//  QueryViewController-keywordsSearch.swift
//  Weather
//
//  Created by Savage on 9/9/21.
//

import Foundation

extension QueryViewController{
    
    func fetchWeatherInfoByKeywords(){
        DispatchQueue.global(qos: .userInitiated).async {
            
            if let url = Bundle.main.url(forResource: "cityList", withExtension: "json"){
                if let data = try? Data(contentsOf: url) {
                    self.parse(json: data)
                } else {
                    print("fail to parse json data")
                }
            } else {
                print("cannot find the json file")
            }
        }
    }
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        if let jsonCityList = try? decoder.decode(CityList.self, from: json) {
            cities = jsonCityList.cityList
            filteredCities = cities
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.hideLoadHUD()
            }
        } else {
            print("aaa")
        }
    }
}
