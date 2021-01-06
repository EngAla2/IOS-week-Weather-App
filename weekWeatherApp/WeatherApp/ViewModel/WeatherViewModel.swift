//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import Foundation
import SwiftUI
import UIKit
private let defaultIcon = "？"
private let iconMap = [
    "Drizzle": "🌨",
    "Rain": "☔️",
    "Snow": "☃️",
    "Clear": "☀️",
    "Clouds": "☁️",
    "Thunderstorm": "⛈",
]
public class WeatherViewModel: ObservableObject{
    @Published var cityName : String = "City Name"
    @Published var temperature : String = "--"
    @Published var weatherDiscreption : String = "--"
    @Published var weatherIcon : String = defaultIcon
    @Published var weatherWeekDays : [DayWeatherInfo] = []
    @Published var current : [CurrentWeatherInfo] = []
    
    public let weatherService : WeatherService
    
    init(weatherService : WeatherService) {
        self.weatherService = weatherService
    }
    @Published var listOfItem : [DayWeatherInfo] = []
    
    public func refresh(){
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temprature)°C"
                self.weatherDiscreption = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
                for item in weather.weaterWeekDay{
                    self.listOfItem.append(DayWeatherInfo(item: item))
                }
                self.weatherWeekDays = self.listOfItem
                self.current = [CurrentWeatherInfo(item: weather.current)]
                print(self.current.first!.clouds)
            }
        }
    }
}


public class DayWeatherInfo :Identifiable {
    
    @Published var temp : String = ""
    @Published var day : String = ""
    @Published var main : String = ""
    @Published var description : String = ""
    func gtDate(date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "EEEE"

        return formatter1.string(from: date)
    }

    
    init(item : weatherDay) {
        self.day = gtDate(date: NSDate(timeIntervalSince1970: TimeInterval(item.dt)) as Date)
        self.temp = "\(item.temp.day) : \(item.temp.night)"
        self.description = item.weather.description
        self.main = iconMap["\(item.weather.first?.main ?? "")"] ?? defaultIcon
        
    }
}



public class CurrentWeatherInfo :Identifiable {

    @Published var sunrise : CLong
    @Published var sunset : CLong
    @Published var pressure : Int
    @Published var humidity : Int
    @Published var dew_point : Double
    @Published var clouds : Int
    @Published var visibility : Int
    @Published var wind_speed : Double
    @Published var wind_deg : Int

    init(item : currentWeather) {
        self.clouds = item.clouds
        self.sunset = item.sunset
        self.sunrise = item.sunrise
        self.visibility = item.visibility
        self.wind_deg = item.wind_deg
        self.wind_speed = item.wind_speed
        self.dew_point = item.dew_point
        self.humidity = item.humidity
        self.pressure = item.pressure
    }
}
