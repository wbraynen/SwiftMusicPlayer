//
//  Catalog.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/2/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import UIKit

class Catalog {
    
    let albums: [Album]
    var totalAlbums: Int {
        return albums.count
    }
    
    required init() {
        self.albums = Catalog.fetchAlbums()
    }
    
    class func fetchAlbums() -> [Album] {
        let slow = Album( title: "Slow", year: "2016", filenameBase: "slow" )
        let birdsheart = Album( title: "The Bird's Heart", year: "2015", filenameBase: "birdsheart" )
        let valentinevignettes = Album( title: "Valentine Vignettes", year: "2014", filenameBase: "valentinevignettes" )
        let pipesanddreams = Album( title: "Pipes and Dreams", year: "2013", filenameBase: "pipesanddreams" )
        let awaketooearly = Album( title: "Awake Too Early", year: "2012", filenameBase: "awaketooearly" )
        
        return [ slow, birdsheart, valentinevignettes, pipesanddreams, awaketooearly ]
    }
}
