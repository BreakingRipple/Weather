//
//  HomeWeatherViewController-DataSource.swift
//  Weather
//
//  Created by Savage on 8/9/21.
//

import UIKit

extension HomeWeatherViewController{
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupWeatherInformation.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherInfo = groupWeatherInformation[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeWeatherViewCellID, for: indexPath) as! HomeWeatherViewCell
        cell.cityNameLabel.text = weatherInfo.name
        cell.cityTemperatureLabel.text = String(weatherInfo.main.temp) + " ˚C"

        return cell
    }
}
