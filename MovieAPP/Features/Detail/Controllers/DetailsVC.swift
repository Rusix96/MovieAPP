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
    @IBOutlet weak var scrollView: UIScrollView!
    
    // inicialitzador del viewmodel per rebre la informacio.
    var detailViewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
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
    
    func configureConstraints() {
        
        //SCROLLVIEW
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
        //MOVIE
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        movieImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 500).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        //TITLE
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        //titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //OVERVIEW
        //overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        
        
        
        /* movieImage.translatesAutoresizingMaskIntoConstraints = false
         movieImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         movieImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
         movieImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         // movieImage.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = false
         movieImage.widthAnchor.constraint(equalToConstant: 500).isActive = true
         movieImage.heightAnchor.constraint(equalToConstant: 500).isActive = true
         
         
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         titleLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor).isActive = true
         titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
         titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         titleLabel.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor, constant: -200).isActive = true
         //titleLabel.heightAnchor.constraint(equalToConstant: 500).isActive = true
         //titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
         
         overviewLabel.translatesAutoresizingMaskIntoConstraints = false
         overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
         overviewLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
         overviewLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         overviewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         // overviewLabel.heightAnchor.constraint(equalToConstant: 500).isActive = true
         //overviewLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
         */
    }
    
    /// Go back to MovieViewController
    ///
    /// - Parameter sender: UIButton
    @IBAction func backButtonPushed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
