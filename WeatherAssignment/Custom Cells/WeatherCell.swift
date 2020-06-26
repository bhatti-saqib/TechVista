//
//  WeatherCell.swift
//  WeatherAssignment
//
//  Created by AppsGenii on 6/24/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.name
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature_min.formatAsDegree) -\(vm.currentTemperature.temperature_max.formatAsDegree)"
        self.windSpeedLabel.text = "Wind Speed: \(vm.wind.speed)"
        self.descriptionLabel.text = vm.weather[0].description
    }
}
