//
//  DetailCell.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/2/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var trackDurationLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackNumberButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
