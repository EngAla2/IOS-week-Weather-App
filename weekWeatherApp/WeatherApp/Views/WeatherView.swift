//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import SwiftUI

struct WeatherView: View {
    
    
    @ObservedObject var viewModel : WeatherViewModel
    
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
            }
            Text(viewModel.cityName).font(.largeTitle).padding().foregroundColor(Color.white)
            Text(viewModel.temperature).font(.system(size: 70)).bold().foregroundColor(Color.white)
            Text(viewModel.weatherIcon).font(.system(size: 120))
            Text(viewModel.weatherDiscreption).padding().foregroundColor(Color.white)
            }.background(LinearGradient(gradient: Gradient(colors: [.newPrimaryColor, .blue, .newPrimaryColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30).padding(20).onAppear(perform: viewModel.refresh)
            .shadow(color: Color.gray, radius: 25)

        
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {

            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.newPrimaryColor, .blue, .white]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 100, height: 100)
                VStack{
                Text("\(String(describing: viewModel.current.first?.clouds ?? 10))")
                    Text("☁️")}
            }.onAppear(perform: viewModel.refresh)

            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.dew_point ?? 10))")
                    Text("💧")}
            }.onAppear(perform: viewModel.refresh)
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.visibility ?? 10))")
                    Text("👁‍🗨")}
            }.onAppear(perform: viewModel.refresh)
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.wind_deg ?? 10))")
                    Text("💨")}
            }.onAppear(perform: viewModel.refresh)
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.wind_speed ?? 10))")
                    Text("🎐")}
            }.onAppear(perform: viewModel.refresh)
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.humidity ?? 10))")
                    Text("💦")}
            }.onAppear(perform: viewModel.refresh)
                    
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.pressure ?? 10))")
                    Text("䷮")}
            }.onAppear(perform: viewModel.refresh)
                    
            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .newPrimaryColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                VStack{
                    Text("\(String(describing: viewModel.current.first?.sunset ?? 10))")
                    Text("🌅")}
            }.onAppear(perform: viewModel.refresh)
                }.onAppear(perform: viewModel.refresh).padding()
            }.frame(height: 100)
            Divider()
        }

        VStack{
        List(viewModel.weatherWeekDays){ item in
            HStack(spacing: 20){
                Spacer()
                Text(item.main).font(.system(size: 55)).padding(.vertical)
                Text(item.day).font(.system(size: 30)).foregroundColor(Color.white)
                Text("\(item.temp)").font(.system(size: 18)).bold()    .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.white)
            }.background(LinearGradient(gradient: Gradient(colors: [.newPrimaryColor, .blue, .newPrimaryColor]), startPoint: .bottom, endPoint: .top))
            .multilineTextAlignment(.center)
            .cornerRadius(7).padding(5).onAppear(perform: viewModel.refresh)
            .shadow(color: Color.gray, radius: 7)
            }
        }
    }

}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel : WeatherViewModel(weatherService: WeatherService()))
    }
}
// to ues custom colors we need to extension the colors we added to the assers.xcassets
extension Color {
    static let oldPrimaryColor = Color(UIColor.systemIndigo)
    static let newPrimaryColor = Color("darkBlue")
}
struct CircleView: View {
    @State var label: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 100, height: 100)
            Text(label)
        }
    }
}

// Some of the style tags I used
// foregroundColor - > change text color
// padding - > add padding outside of the elemnt you can use .top, .leading ...
// multilineTextAlignment -> to align the text in side the view


