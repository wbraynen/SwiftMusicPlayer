//
//  Player.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/2/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import UIKit
import AVFoundation


class Player {
    
    var delegate: AVAudioPlayerDelegate!
    private var audioPlayer: AVAudioPlayer!
    
    var playing: Bool {
        return self.audioPlayer.playing
    }
    var paused: Bool {
        let currenTimeInSeconds = self.audioPlayer.currentTime
        return (!self.audioPlayer.playing && currenTimeInSeconds > 0.0)
    }
    
    var firstTrack: Bool {
        return (1 == self.trackNumber)
    }
    
    var lastTrack: Bool {
        return (self.album.totalTracks == self.trackNumber)
    }
    
    var album: Album
    var trackNumber: Int = 1 {
        didSet {
            // make sure trackNumber stays in the [1, album.totalTracks] range
            if trackNumber < 1 {
                trackNumber = 1
            } else if trackNumber > album.totalTracks {
                trackNumber = album.totalTracks
            }
        }
    }
    
    init?( album: Album ) {
        self.album = album
        self.delegate = nil
        self.audioPlayer = nil
        // #warning
        if let newAudioPlayer = createAudioPlayer( album, trackNumber: 1 ) {
            self.audioPlayer = newAudioPlayer
        } else {
            return nil
        }
    }
    
    func audioFilenameForTrack( trackNumber: Int ) -> String {
        guard trackNumber >= 1 && trackNumber <= album.totalTracks else {
            NSLog("Invalid track number passed to audioFilenameForTrack")
            return "Invalid trackNumber"
        }
        return "\(self.album.filenameBase).\(trackNumber)" // without extension
    }

    func createAudioPlayer( album: Album, trackNumber: Int ) -> AVAudioPlayer? {
        let filename = audioFilenameForTrack( trackNumber )
        if let path = NSBundle.mainBundle().pathForResource( filename, ofType: "mp3" ) {
            let url = NSURL.fileURLWithPath( path )
            do {
                let newAudioPlayer = try AVAudioPlayer( contentsOfURL: url )
                newAudioPlayer.prepareToPlay()
                newAudioPlayer.delegate = self.audioPlayer?.delegate // keep the old delegate
                return newAudioPlayer
            } catch _ {
                return nil
            }
        } else {
            NSLog( "Couldn't locate file \(filename).mp3" )
            return nil
        }
    }
    
    func stop() {
        self.audioPlayer.stop()
    }
    
    func pause() {
        self.audioPlayer.pause()
    }
    
    func play() {
        self.audioPlayer.play()
    }

    // todo: make this the setter for `trackNumber`
    func selectTrack( trackNumber: Int ) {
        guard trackNumber >= 1 && trackNumber <= album.totalTracks else {
            return
        }
        self.trackNumber = trackNumber
        audioPlayer = createAudioPlayer( album, trackNumber: trackNumber )! // yup, this might crash
    }
    
    ////
    // Returns the new track number (between 1 and album.totalTracks)
    //
    func nextTrack() -> Int {
        if (lastTrack) {
            return trackNumber
        }
        trackNumber++
        let wasPlaying = audioPlayer.playing
        selectTrack( trackNumber )
        if wasPlaying {
            // restore the player's previous state
            self.audioPlayer.play()
        }
        return trackNumber;
    }
    
    ////
    // Returns the new track number (between 1 and album.totalTracks)
    //
    func previousTrack() -> Int {
        if (firstTrack) {
            return trackNumber
        }
        trackNumber--
        let wasPlaying = audioPlayer.playing
        selectTrack( trackNumber )
        if wasPlaying {
            // restore the player's previous state
            self.audioPlayer.play()
        }
        return trackNumber
    }
}
