//
//  ViewController.swift
//  MovieAPP
//
//  Created by Rusik on 11/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Kingfisher

var viewModel = MovieViewModel()
var filteredViewModel = MovieViewModel()
var search : String = "2"

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        viewModel.getData(succes: { ()
            self.tableView.reloadData()
        })
        searchingFilter()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for:  indexPath) as! MovieCell
        filteredViewModel.index = indexPath.row
        
        let imageMovie = filteredViewModel.portrait
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let imageUrl = URL(string: baseUrl + imageMovie)!
        cell.titleLabel.text = filteredViewModel.title
        cell.overviewLabel.text = filteredViewModel.overview
        cell.voteLabel.text = filteredViewModel.voteAverage
        cell.movieImageView.kf.setImage(with: imageUrl)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailMovie") as! DetailsVC
        
        searchBar.text = ""
        filteredViewModel.index = indexPath.row
        let imageMovie = filteredViewModel.portrait
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let imageUrl = URL(string: baseUrl + imageMovie)!
        let imageVMovie : UIImageView = UIImageView()
        vc.titleMovie = filteredViewModel.title
        vc.overviewMovie = filteredViewModel.overview
     
        let resource = ImageResource(downloadURL: imageUrl)
        imageVMovie.kf.setImage(with: resource)
        if imageVMovie.image != nil {
            vc.moviePoster = imageVMovie.image!
        } else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.alpha = 0
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.35) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    func searchingFilter () {
        
        
        if searchBar.text!.isEmpty {
            filteredViewModel.getData {
                self.tableView.reloadData()
            }
        } else {
            return
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredViewModel.arrayMovies = searchText.isEmpty ? viewModel.arrayMovies : viewModel.arrayMovies!.filter({ (movies : MovieModel) -> Bool in
            let title = movies.title!
            search = searchBar.text!
            
            
            return title.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
        
    }
}


