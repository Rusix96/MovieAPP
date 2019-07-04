//
//  ViewController.swift
//  MovieAPP
//
//  Created by Rusik on 11/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Kingfisher


class MovieViewController: UIViewController  {
    
    //TODO No es pot usar 2 instancies del mateix ViewModel en una mateixa vista
    //FINISHED Estas utilitzant var enlloc de let en una variable que no canvia
    //TODO Comentar tots els metodes custom
    
    let viewModel = MovieViewModel()
    let filteredViewModel = MovieViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //FINISHED Dividir el codi per Data / UI / Delegates amb funcions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureUI()
        getData()
    }
    ///Place all the dataSources and delegates
    func configureDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    /// Add visual changes to UI
    func configureUI() {
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
    }
   
    //TODO:  Estas fent 2 crides simultanees que no saps si l'usuari les va a utilitzar
    func getData () {
            self.filteredViewModel.getData(succes: { ()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
            self.viewModel.getData(succes: { ()
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        })
    }
}

// MARK: - UITableViewDelegate
extension MovieViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension MovieViewController: UITableViewDataSource {
    ///Display the number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredViewModel.numberOfRows
    }
    
    
    //TODO:  Cada cela s'ha d'adaptar automaticamnt per contraints
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /// Display data of tableView in cells
    ///
    /// - Parameters:
    ///   - tableView: Represent our tableview
    ///   - indexPath: Represent the path to a specific location in a tree of nested arrays.
    /// - Returns: cell with information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for:  indexPath) as! MovieCell
        filteredViewModel.index = indexPath.row
        
        cell.setProperties(titleLabel: filteredViewModel.title,
                           overviewLabel: filteredViewModel.overview,
                           voteLabel: filteredViewModel.voteAverage,
                           movieImageUrl: filteredViewModel.portrait)
        
        return cell
    }
    
    /// Display data when we select specific cell
    ///
    /// - Parameters:
    ///   - tableView: Represent our tableview
    ///   - indexPath: Represent the path to a specific location in a tree of nested arrays.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailMovie") as! DetailsVC
        
        searchBar.text = ""
        filteredViewModel.index = indexPath.row
        
        let detailViewModel = DetailViewModel(title: filteredViewModel.title,
                                              overview: filteredViewModel.overview,
                                              portrait: filteredViewModel.portrait)
        
        detailViewController.detailViewModel = detailViewModel
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

// MARK: - UISearchBarDelegate
extension MovieViewController: UISearchBarDelegate {
    
    /// Filter movies by user interaction with searchbar and keyboard.
    ///
    /// - Parameters:
    ///   - searchBar: Searchbar used by user for searching.
    ///   - searchText: Text placed by user.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //filteredViewModel.arrayMovies = searchText.isEmpty ? viewModel.arrayMovies : viewModel.arrayMovies!.filter({ (movies : Results) -> Bool in
           // for titles in movies.title! {
            //let title = titles
            //}
            //return title!.range(of: searchText, options: .caseInsensitive) != nil
       // })
        tableView.reloadData()
    }
    
    /// Toggle keyboard when user touch searchbar.
    ///
    /// - Parameter searchBar: Searchbar used by user for searching.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
}

