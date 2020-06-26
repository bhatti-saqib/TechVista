//
//  AddCitiesViewController.swift
//  WeatherAssignment
//
//  Created by AppsGenii on 6/24/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddCitiesViewController: UIViewController {
    
    @IBOutlet weak var cityNamesTextField: UITextField!
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        if var city = cityNamesTextField.text {
            if(city.containsWhitespace) {
                let urlNew = city.replacingOccurrences(of: " ", with: "%20")
                city = urlNew
            }
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=imperial&appid=f1b281b9d22dbbbbfeab25b4e34bc6f0")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            
            WebService().load(resource: weatherResource) { [weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension String {
    var containsWhitespace : Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
}
