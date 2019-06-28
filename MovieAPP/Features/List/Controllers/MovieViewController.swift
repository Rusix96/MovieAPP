//
//  ViewController.swift
//  MovieAPP
//
//  Created by Rusik on 11/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Kingfisher

let filteredViewModel = MovieViewModel()
class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //TODO No es pot usar 2 instancies del mateix ViewModel en una mateixa vista
    //FINISHED Estas utilitzant var enlloc de let en una variable que no canvia
    //TODO Comentar tots els metodes custom
    let viewModel = MovieViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //FINISHED Dividir el codi per Data / UI / Delegates amb funcions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureUI()
        getData()
    }
    
    //Place all the dataSources and delegates
    func configureDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    //Add visual changes to UI
    func configureUI() {
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
    }
    //Display the number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredViewModel.numberOfRows
    }
    
    // Cada cela s'ha d'adaptar automaticamnt per contraints
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //Display data of tableView in cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for:  indexPath) as! MovieCell
        filteredViewModel.index = indexPath.row
        
        cell.setProperties(titleLabel: filteredViewModel.title,
                           overviewLabel: filteredViewModel.overview,
                           voteLabel: filteredViewModel.voteAverage,
                           movieImageUrl: filteredViewModel.portrait)
        
        return cell
    }
    
    //Display data when we select specific cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailMovie") as! DetailsVC
        
        searchBar.text = ""
        filteredViewModel.index = indexPath.row
        
        vc.setProperties(titleLabel: filteredViewModel.title,
                         overviewLabel: filteredViewModel.overview,
                         movieImageUrl: filteredViewModel.portrait)
        /*let imageMovie = filteredViewModel.portrait
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
        */
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Estas fent 2 crides simultanees que no saps si l'usuari les va a utilitzar
    func getData () {
        filteredViewModel.getData(succes: { ()
            self.tableView.reloadData()
        })
        viewModel.getData(succes: { ()
            self.tableView.reloadData()
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredViewModel.arrayMovies = searchText.isEmpty ? viewModel.arrayMovies : viewModel.arrayMovies!.filter({ (movies : MovieModel) -> Bool in
            let title = movies.title!
            
            return title.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
}


