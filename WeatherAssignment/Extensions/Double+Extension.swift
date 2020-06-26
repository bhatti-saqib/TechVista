//
//  Double+Extension.swift
//  WeatherAssignment
//
//  Created by AppsGenii on 6/24/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
