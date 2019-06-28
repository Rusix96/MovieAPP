//
//  DetailsVC.swift
//  MovieAPP
//
//  Created by Rusik on 12/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    // necessites un viewmodel especific per al detall
    // Aquestes variables han de ser private 
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    
    // inicialitzador del viewmodel per rebre la informacio.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setProperties(titleLabel: String,overviewLabel: String, movieImageUrl: String) {
        self.titleLabel.text = titleLabel
        self.overviewLabel.text = overviewLabel
        if let imageURL = URL(string: movieImageUrl) {
            self.movieImage.kf.setImage(with: imageURL)
        }
    }
}
