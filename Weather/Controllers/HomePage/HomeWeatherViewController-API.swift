//
//  API.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import UIKit

extension HomeWeatherViewController{
    
    func urlStrGroup(_ cityIDs: [Int]) -> String{
        var idUnit = "id="
        let idCount = cityIDs.count
        let last = String(cityIDs.last!)
        
        for index in 0..<idCount-1 {
            idUnit += String(cityIDs[index]) + ","
        }
        
        let finalIDs = idUnit + last
        let urlStrGroup = KBaseURLString + kGroupUnit + finalIDs + "&units=\(kMetric)&APPID=\(kOpenWeatherKey)"
        return urlStrGroup
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonGroupWeatherInfo = try? decoder.decode(GroupWeatherInformation.self, from: json) {
            groupWeatherInformation = jsonGroupWeatherInfo.list
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    
    
}
    
    

    
    
    




