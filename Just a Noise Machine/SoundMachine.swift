//
//  SoundMachine.swift
//  Just a Noise Machine.
//
//This file contains all of the sound machine logic.
//
//  Created by Max Broome on 4/26/24.
//  Date Modified: 3/15/2025
//

import Foundation
import AVFoundation

struct SoundMachine
{
    /**
     Starts playing the sound machine audio with the given timer.
     */
    func startSoundMachine(soundFileName: String, soundFileType: String, hour: Int, min: Int, sec: Int)
    {
        // Stop audio already playing (if needed) and start playing the sound machine.
        stopSoundMachine()
        audioManager.playSound(soundFileName: soundFileName, soundFileType: soundFileType)
        
        // Set up audio stop timer.
        let totalTimeInSeconds = TimeInterval(hour * 3600 + min * 60 + sec)
        timer = Timer.scheduledTimer(withTimeInterval: totalTimeInSeconds, repeats: false) { timer in
            audioManager.stopSound()
        }
    }
    
    /**
     Stops the sound machine and invalidates the timer.
     */
    func stopSoundMachine()
    {
        audioManager.stopSound()
        timer?.invalidate()
    }
}

struct Audio
{
    var audio: AVAudioPlayer = AVAudioPlayer()
    /**
     Plays the given audiofile.
     */
    mutating func playSound(soundFileName: String, soundFileType: String)
    {
        // Set the applications background audio properties. This allows audio to play while the device is locked or app is minimized.
        do
        {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _
        {
            return print("Unable to set AVAudioSession background audio mode.")
        }
        
        // Get the URL for the audio.
        let audioURL = Bundle.main.url(forResource: soundFileName, withExtension: soundFileType)
        
        // Play the audio
        audio = try! AVAudioPlayer(contentsOf: audioURL!)
        audio.play()
    }
    
    /**
     Stops the currently playing audio.
     */
    mutating func stopSound()
    {
        audio.stop()
    }
}
