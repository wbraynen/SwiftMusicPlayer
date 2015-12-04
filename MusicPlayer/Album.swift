//
//  Album.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/2/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import UIKit

class Album: CustomStringConvertible {
    
    let filenameFor100image, filenameFor375image, filenameFor1400image: String
    
    let title, year, filenameBase: String
    let tracks: [String]
    var totalTracks: Int {
        return tracks.count
    }
    var description: String {
        return "(\(year)) \(title)"
    }
    
    required init( title: String, year: String, filenameBase: String ) {
        self.title = title
        self.year = year
        self.tracks = Album.fetchTracks( title )
        self.filenameBase = filenameBase
        
        self.filenameFor100image = "\(filenameBase).100.jpg"
        self.filenameFor375image = "\(filenameBase).375.jpg"
        self.filenameFor1400image = "\(filenameBase).1400.jpg"
    }
    
    
    class func fetchTracks( albumTitle: String ) -> [String] {
    
        let slowTracks = [
            "It's Hard To Hear",
            "I'm Grillin My Meat And There Is Enough For Two",
            "The Foreboding: The Neighbors Are Quiet",
            "[Outtakes] Whispers",
            "A Tiger Is Not A Submarine",
            "I'm [on?] A Mountain Top",
            "Hush",
            "Summertime",
            "[Outtakes] Aengus's Got A Ride"]
    
        let birdsheartTracks = [
            "Julia's Bedtime Song: Uncle Vills, I Want to Go to the Forest",
            "Fall On Your Back, Wake Up in the Sun",
            "The Bird's Heart: A Song in Nine Parts - II. The Muttering Sound Gone",
            "Fairy Dream Maker with a Stitched Cello",
            "Ambience Forging",
            "Mango Dog",
            "Why Muertos?",
            "'Mountain Bike and Upright Meet in Forest' by Bart Fade 'Em",
            "Fairy Dream Maker without a Stitched Cello",
            "Someone Is Watching the Telly",
            "They Took My Pitcherometer",
            "Dissatisfaction",
            "Weird",
            "The Three of Us Are a Little Drunk But We Are Friendly"]
    
        let valentinevignettes = [
            "The Chord",
            "Valentine #3",
            "Valentine #",
            "Valetine",
            "Thingy",
            "Silliness"]
    
        let pipesanddreams = [
            "Birds Calling in the Ravine",
            "Laconic Trio",
            "(Haiku Of) Raindrops",
            "Palo Alto",
            "Rêverie", // Unicode support :)
            "The Little One With the Big One",
            "The Big One: Shouldn't've Eaten the Little One! (But Then Feeling Better)",
            "Serejka Plans Improv"]
    
        let awaketooearly = [
            "Awake Too Early",
            "You are Sweet, but Your Sweetness Has Hurt Me",
            "Stewardess of Jalapenos",
            "844 Miles",
            "Delo Hozyaiskoe",
            "Marginal Love",
            "You Take My Heart To Strangers"]
    
        // album titles : tracks names
        let allTracks = [
            "Slow" : slowTracks,
            "The Bird's Heart": birdsheartTracks,
            "Valentine Vignettes": valentinevignettes,
            "Pipes and Dreams": pipesanddreams,
            "Awake Too Early": awaketooearly]
    
        return allTracks[albumTitle]!
    }
}
