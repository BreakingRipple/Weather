//
//  HomeWeatherViewController.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import UIKit

class HomeWeatherViewController: UITableViewController {

    var cityIDs = [ 2147714, 4163971, 2174003 ]
    var groupWeatherInfomation = [WeatherInformationGroupVersion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "weather"
        let urlStr = urlStrGroup(cityIDs)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: urlStr) {
                if let data = try? Data(contentsOf: url) {
                    self.parse(json: data)
                } else {
                    self.showError()
                }
            } else {
                self.showError()
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupWeatherInfomation.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherInfo = groupWeatherInfomation[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeWeatherViewCellID, for: indexPath) as! HomeWeatherViewCell
        cell.cityNameLabel.text = weatherInfo.name
        cell.cityTemperatureLabel.text = String(weatherInfo.main.temp)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
