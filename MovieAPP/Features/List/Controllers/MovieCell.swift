//
//  MovieCell.swift
//  MovieAPP
//
//  Created by Rusik on 12/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var overviewLabel: UILabel!
    @IBOutlet weak private var voteLabel: UILabel!
    @IBOutlet weak private var movieImageView: UIImageView!
    
    // CMD + Alt + Shift + 7
    /// Create a constructor, we use it for create movie objects
    ///
    /// - Parameters:
    ///   - titleLabel: Obtain the title of the movie
    ///   - overviewLabel: Obtain the overview of the movie
    ///   - voteLabel: Obtain the vote average of the movie
    ///   - movieImageUrl: Obtain the portrait of the movie
    func setProperties(titleLabel: String,overviewLabel: String,voteLabel: String, movieImageUrl: String) {
        self.titleLabel.text = titleLabel
        self.overviewLabel.text = overviewLabel
        self.voteLabel.text = voteLabel
        if let imageURL = URL(string: movieImageUrl) {
        self.movieImageView.kf.setImage(with: imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
