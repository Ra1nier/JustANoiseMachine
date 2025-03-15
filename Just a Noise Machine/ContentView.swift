//
//  ContentView.swift
//  Just A Noise Machine
//
//  This file contains all of the View components for the App.
//
//  Created by Max Broome on 4/7/24.
//  Date Modified: 3/15/2025
//

import SwiftUI

/**
 Contians all of the view components for the Sound Machine App.
 */
struct ContentView: View {
    @State var hoursInput = 0
    @State var minutesInput = 0
    @State var secondsInput = 0
    @State var selectedImageIndex = 0
    @State var isDarkMode = true
    
    var body: some View {
        
        //Dark mode handler
        let backgroundGradient = LinearGradient(
                    gradient: isDarkMode ? Gradient(colors: [Color.black, Color.gray]) : Gradient(colors: [Color.red, Color.blue]),
                    startPoint: .top,
                    endPoint: .bottom
                )
        
        //Main Body
        return backgroundGradient
                .edgesIgnoringSafeArea(.all)
                .overlay(
                VStack
                {
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.white)
                        .opacity(0.25)
                        .shadow(radius: 10.0)
                        .padding()
                        .frame(width: 150, height: 70)
                        .overlay(
                            Button("Dark Mode") {
                                isDarkMode.toggle()
                            })
                        .position(x: 200,y: 50)
                    
                    VStack {
                        Image(isDarkMode ? "classic-noise-machine-dark" : "classic-noise-machine")
                            .resizable()
                            .scaledToFit()
                            .position(x: 200, y: -70)
                        
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(.white)
                            .opacity(0.25)
                            .shadow(radius: 10.0)
                            .padding()
                            .frame(width: 420, height: 250)
                            .overlay(
                                VStack
                                {
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(isDarkMode ? Color.black : Color.green)
                                        .opacity(0.25)
                                        .shadow(radius: 10.0)
                                        .padding()
                                        .frame(width: 410, height: 70)
                                        .overlay(
                                    HStack
                                    {
                                        Text("Hours")
                                        Picker(selection: $hoursInput, label: Text("Hours")) {
                                            ForEach(0..<25, id: \.self) { i in
                                                Text("\(i)").tag(i)
                                            }
                                        }
                                        
                                        Text("Minutes")
                                        Picker(selection: $minutesInput, label: Text("Minutes")) {
                                            ForEach(0..<60, id: \.self) { i in
                                                Text("\(i)").tag(i)
                                            }
                                        }
                                        
                                        Text("Seconds")
                                        Picker(selection: $secondsInput, label: Text("Seconds")) {
                                            ForEach(0..<60, id: \.self) { i in
                                                Text("\(i)").tag(i)
                                            }
                                        }
                                    })
                                        .position(x: 200, y: 20)
                                    
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(isDarkMode ? Color.black : Color.blue)
                                        .opacity(0.25)
                                        .shadow(radius: 10.0)
                                        .padding()
                                        .frame(width: 200, height: 70)
                                        .overlay(
                                            Button("Start Noise Machine") {
                                                soundMachine.startSoundMachine(soundFileName: "classic-sound-machine-sound", soundFileType: "mp3", hour: hoursInput, min: minutesInput, sec: secondsInput)
                                            })
                                        .position(x: 200, y: 0)
                                    
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(isDarkMode ? Color.black : Color.red)
                                        .opacity(0.25)
                                        .shadow(radius: 10.0)
                                        .padding()
                                        .frame(width: 200, height: 70)
                                        .overlay(
                                            Button("Stop Noise Machine") {
                                                soundMachine.stopSoundMachine()
                                            })
                                        .position(x: 200, y: -30)
                                }
                                    .position(x: 220, y: 170))
                            .position(x: 197, y: 30)
                            .frame(height: 100)
                    }
                })
            .foregroundColor(.white) //White text
    }
}

//Preview Providers
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}


//Extentions
extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        self.init(
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}
