//
//  DetailViewController.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/2/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {

    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var player: Player!
    var paused: Bool
    
    var album: Album! { // This is our `detailItem`.  should be an optional?
        didSet {
            self.player = Player( album: album )!  // yeah, i'd rather this crash at this point
            self.player.delegate = self
            
            // Update the view.
            self.configureView()
        }
    }
    
    @IBAction func playButtonPressed(sender: UIButton) {
        if player.playing {
            player.pause()
        } else {
            player.play()
        }
        
        updatePlayButton()
        updateNextButton()
        
        self.paused = !self.paused
    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        player.nextTrack()
        updateBackButton()
        updateNextButton()
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        player.previousTrack()
        updateBackButton()
        updateNextButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        paused = true
        super.init(coder: aDecoder)
    }

    func configureView() {
        if album != nil {
            let newTitle = album.description
            self.title = newTitle
            if self.imageview != nil {
                self.imageview.image = UIImage( named: album.filenameFor1400image )
            }
            self.paused = false
            if backButton != nil {
                updateBackButton()
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.player.stop()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.totalTracks
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: DetailCell = tableView.dequeueReusableCellWithIdentifier("DetailCell_ReuseID") as! DetailCell
        cell.backgroundColor = UIColor.outerSpaceColor()
        let trackNumber = indexPath.row + 1
        cell.trackNumberButton.setImage( nil, forState:UIControlState.Normal )
        
        if (trackNumber != self.player.trackNumber) {
            // for most tracks, just displaying the track number.  no icon.  simple.
            cell.trackNumberButton.setTitle( "\(trackNumber)", forState: UIControlState.Normal )
        } else {
            // for current track, display an icon (so the user knows which track is currently playing or will play if the user pressed "play")
            let filename = self.player.playing ? "thisTrackIsPlaying.png" : "thisTrackIsPaused.png"
            let image = UIImage( named: filename )
            cell.trackNumberButton.setImage( image, forState: UIControlState.Normal )
        }
        cell.trackNameLabel.text = self.player.album.tracks[indexPath.row]
        cell.trackDurationLabel.text = "3:54"
        return cell

    }
    
    
    func updatePlayButton() {
        let filename = player.playing ? "pause.png" : "play.png"
        let image = UIImage( named: filename )
        playButton.setImage( image, forState: UIControlState.Normal )
    }
    
    func updateBackButton() {
        self.backButton.enabled = !self.player.firstTrack
        updateTableRows()
    }
    
    func updateNextButton() {
        self.nextButton.enabled = !self.player.lastTrack
        updateTableRows()
    }
    
    
    func updateTableRows() {
        if let indexPaths = self.tableview.indexPathsForVisibleRows {
            self.tableview.reloadRowsAtIndexPaths( indexPaths, withRowAnimation:UITableViewRowAnimation.None )
        }
    }
    
    func audioPlayerDidFinishPlaying( playerNotToUse: AVAudioPlayer, successfully flag: Bool) {
        if self.player.lastTrack {
            updatePlayButton()
        } else {
            self.player.nextTrack()
            self.player.play()
            updateNextButton()
            updateBackButton()
        }
    }
}

