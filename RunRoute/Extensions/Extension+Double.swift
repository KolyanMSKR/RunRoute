//
//  Extension+Double.swift
//  RunRoute
//
//  Created by Admin on 03.09.2020.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
