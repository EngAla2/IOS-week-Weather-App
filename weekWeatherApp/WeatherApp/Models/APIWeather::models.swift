//
//  APIWeather::models.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 1/2/21.
//

import Foundation

struct APIResponse :Decodable{
    let name : String
    let main : APIMain
    let weather : [APIWeather]
}

struct APIMain : Decodable{
    let temp : Double
}

struct APIWeather: Decodable {
    let main : String
    let description : String
}
struct APIResponseDailyWeather :Decodable {
    let current : currentWeather
    let daily : [weatherDay]
    let timezone : String
}
struct DayTemp: Decodable {
    let day : Double
    let night : Double
}
struct weatherDay: Decodable {
    let dt : Int
    let temp : DayTemp
    let weather : [APIWeather]
}
struct currentWeather : Decodable {
    let weather : [APIWeather]
    let sunrise : CLong
    let sunset : CLong
    let temp : Double
    let feels_like : Double
    let pressure : Int
    let humidity : Int
    let dew_point : Double
    let clouds : Int
    let visibility : Int
    let wind_speed : Double
    let wind_deg : Int
}
