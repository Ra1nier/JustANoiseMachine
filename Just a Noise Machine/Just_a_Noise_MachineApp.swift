//
//  Just_a_Noise_MachineApp.swift
//  Just A Noise Machine
//  Just a noise machine for sleeping. No fucking ads, no notications, and no tracking. This one also has the correct sound which no other app does.
//
//  Contains the main function that wraps both the model and view together.
//
//  Created by Max Broome on 4/7/24.
//  Date Modified: 3/15/2025
//

import SwiftUI

var audioManager = Audio()
var soundMachine = SoundMachine()
var timer: Timer?

@main
struct Just_a_Noise_MachineApp: App
{
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
