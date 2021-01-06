//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject{
    private let locationManager = CLLocationManager()
    private let API_KEY = "2556a92f449c7c87bef620d62f92223f"
    private var completionHandler: ((DailyWeather)->Void)?
    
    public override init(){
        super.init()
        locationManager.delegate = self
    }
    
    public func loadWeatherData(_ completionHandler: @escaping((DailyWeather)->Void)){
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    private func makeDataRequest(forCoord coord: CLLocationCoordinate2D){
        guard let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(coord.latitude)&lon=\(coord.longitude)&exclude=hourly,minutely&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}

        guard let url = URL(string: urlString)  else { return }
        URLSession.shared.dataTask(with: url ) {data, response, error in
            guard error == nil , let data = data else {return}
            var response: APIResponseDailyWeather?
            do {
                response = try JSONDecoder().decode(APIResponseDailyWeather.self, from: data)
                self.completionHandler?(DailyWeather(response: response!))

            }catch{
                print("\nerror:\(error), \nerror localizedDescription : \(error.localizedDescription)\n")
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate{
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        makeDataRequest(forCoord: location.coordinate)
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong, \(error.localizedDescription ), \nerror: \(error)")
    }
}
