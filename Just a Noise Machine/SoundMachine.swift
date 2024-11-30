//
//  SoundMachine.swift
//  Just a Noise Machine
//
//  Created by Max Broome on 4/26/24.
//

import Foundation
import AVFoundation

var audioManager = Audio()
var soundMachine = SoundMachine()
var timer: Timer?

struct SoundMachine
{
    func startSoundMachine(soundFileName: String, soundFileType: String, hour: Int, min: Int, sec: Int)
    {
        stopSoundMachine()
        audioManager.playSound(soundFileName: soundFileName, soundFileType: soundFileType)
        
        let totalTimeInSeconds = TimeInterval(hour * 3600 + min * 60 + sec)
        
        timer = Timer.scheduledTimer(withTimeInterval: totalTimeInSeconds, repeats: false) { timer in
            audioManager.stopSound()
        }
    }
    
    func stopSoundMachine()
    {
        audioManager.stopSound()
        timer?.invalidate()
    }
}

struct Audio
{
    var audio: AVAudioPlayer?
    /**
     Plays the given audiofile.
     */
    mutating func playSound(soundFileName: String, soundFileType: String)
    {
        let audioURL = Bundle.main.url(forResource: soundFileName, withExtension: soundFileType)
        
        audio = try! AVAudioPlayer(contentsOf: audioURL!)
        audio!.play()
    }
    
    mutating func stopSound()
    {
        audio!.stop()
    }
}
