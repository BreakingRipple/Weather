//
//  DetailViewController.swift
//  Weather
//
//  Created by Savage on 8/9/21.
//

import UIKit

class DetailViewController: UIViewController {

    var weatherInformation: WeatherInformationGroupVersion?
    var datasource = [DetailWeatherModel]()
    
    var humidity: DetailWeatherModel?
    var visibility: DetailWeatherModel?
    var windSpeed: DetailWeatherModel?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempLowLabel: UILabel!
    @IBOutlet weak var tempHighLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        let date = NSDate(timeIntervalSince1970: 1631045082)
        
        if let cityName = weatherInformation?.name,
           let main = weatherInformation?.weather[0].main,
           let temp = weatherInformation?.main.temp,
           let tempMin = weatherInformation?.main.temp_min,
           let tempMax = weatherInformation?.main.temp_max {
            
            cityNameLabel.text = cityName
            mainLabel.text = main
            tempLabel.text = String(temp) + "˚"
            tempLowLabel.text = "L: " + String(tempMin) + "˚"
            tempHighLabel.text = "H: " + String(tempMax) + "˚"
        }
        
        if let locationDetailLon = weatherInformation?.coord.lon,
           let locationDetailLat = weatherInformation?.coord.lat{
            let detail = "lon:\(locationDetailLon), lat:\(locationDetailLat) "
            let title = "Location"
            let imageName = "location.circle.fill"
            let location = DetailWeatherModel(title: title, detail: detail, imageName: imageName)
            datasource.append(location)
        }
        
        if let humidityDetail = weatherInformation?.main.humidity{
            let detail = String(humidityDetail) + "%"
            let title = "Humidity"
            let imageName = "aqi.low"
            let humidity = DetailWeatherModel(title: title, detail: detail, imageName: imageName)
            datasource.append(humidity)
        }
       
        if let visibilityDetail = weatherInformation?.visibility{
            let title = "Visibility"
            let detail = String(visibilityDetail) + "m"
            let imageName = "eye.circle"
            let visibility = DetailWeatherModel(title: title, detail: detail, imageName: imageName)
            datasource.append(visibility)
        }

        if let windSpeedDetail = weatherInformation?.wind.speed{
            let title = "wind speed"
            let detail = String(windSpeedDetail) + " meter/sec"
            let imageName = "wind"
            let windSpeedDetail = DetailWeatherModel(title: title, detail: detail, imageName: imageName)
            datasource.append(windSpeedDetail)
        }

    }

}

extension DetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kDetailCollectionViewCellID, for: indexPath) as! DetailCollectionViewCell
        let imageName = datasource[indexPath.item].imageName
        cell.imageView.image = UIImage(systemName: imageName)
        cell.titleLabel.text = datasource[indexPath.item].title
        cell.detailLabel.text = datasource[indexPath.item].detail
        return cell
    }
    
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("aaa")
        let cellW = (screenRect.width - kCollectionCellPadding * 5) / 2
        let cellH = cellW
        return CGSize(width: cellW, height: cellH)
    }
}

