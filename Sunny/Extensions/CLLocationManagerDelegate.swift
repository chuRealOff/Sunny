//
//  CLLocationManagerDelegate.swift
//  Sunny
//
//  Created by CHURILOV DMITRIY on 02.11.2022.
//

import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(withRequestType: .coordinates(latitude: latitude, longitude: longitude))
       
        /* Method commented and moved to ViewController because the following error occurs otherwise: "Delegate must respond to locationManager:didFailWithError:
        (null)"
        */
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            print(error.localizedDescription)
//        }
    }
}
