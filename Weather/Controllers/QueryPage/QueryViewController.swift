//
//  QueryViewController.swift
//  Weather
//
//  Created by Savage on 8/9/21.
//

import UIKit

protocol QueryViewControllerDelegate {
    func didAddCity(_ cityID: Int)
}

class QueryViewController: UIViewController {

    var delegate: QueryViewControllerDelegate?
    var cities = [CityInformation]()
    var filteredCities = [CityInformation]()
    var keywords = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoadHUD("loading data")
        
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton{
            cancelButton.isEnabled = true
        }

        fetchWeatherInfoByKeywords()
    }
}


extension QueryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityName = filteredCities[indexPath.row].name
        let countryName = filteredCities[indexPath.row].country
        let cell = tableView.dequeueReusableCell(withIdentifier: kQueryTableViewCellID) as! QueryTableViewCell
        cell.cityNameLabel.text = cityName
        cell.countryNameLabel.text = countryName
        return cell
    }
    
    
}

extension QueryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityID = filteredCities[indexPath.row].id
        delegate?.didAddCity(cityID)
        dismiss(animated: true)
    }
}

extension QueryViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) { dismiss(animated: true) }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filteredCities.removeAll()
        
        guard let searchText = searchBar.text, !searchText.isBlank else { return }
        keywords = searchText
        
        for city in cities{
            if city.name.hasPrefix(keywords) {
                filteredCities.append(city)
            }
        }
        
        tableView.reloadData()
    }
}
