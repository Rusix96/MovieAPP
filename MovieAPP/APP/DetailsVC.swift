//
//  DetailsVC.swift
//  MovieAPP
//
//  Created by Rusik on 12/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var moviePoster : UIImage = UIImage()
    var titleMovie : String = ""
    var overviewMovie : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
            movieImage.image = moviePoster
            titleLabel.text = titleMovie
            overviewLabel.text = overviewMovie
      
      
    }
    

  

}
