//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import Foundation

// handel the daily weather request
public struct Weather {

    let city : String
    let temprature : String
    let description : String
    let iconName : String
    
    init(response: APIResponse) {
        city = response.name
        temprature = "\(response.main.temp)"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.main ?? ""
        
    }

}

// handel the week weather request
public struct DailyWeather {

    let city : String
    let temprature : String
    let description : String
    let iconName : String
    let weaterWeekDay : [weatherDay]
    let current : currentWeather

    init(response: APIResponseDailyWeather) {
        city = response.timezone
        temprature = "\(response.current.temp)"
        description = response.current.weather.first?.description ?? ""
        iconName = response.current.weather.first?.main ?? ""
        weaterWeekDay = response.daily
        current = response.current
    }

}
