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
    var detailViewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    ///Add visual changes to UI
    func configureUI() {
        if let viewModel = detailViewModel {
            self.titleLabel.text = viewModel.title
            self.overviewLabel.text = viewModel.overview
            let imageMovie = viewModel.portrait
            let imageUrl = URL(string: imageMovie)!
            self.movieImage.kf.setImage(with: imageUrl)
        }
    }
    
    /// Go back to MovieViewController
    ///
    /// - Parameter sender: UIButton
    @IBAction func backButtonPushed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
