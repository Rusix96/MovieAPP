//
//  ViewController.swift
//  MovieAPP
//
//  Created by Rusik on 11/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Kingfisher


class MovieViewController: UIViewController, ErrorMessageDelegate {
    
    let viewModel = MovieViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    //FINISHED Dividir el codi per Data / UI / Delegates amb funcions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureUI()
        getData()
    }

    func refresh() {
        getData()
        for subView in self.tableView.subviews {
            if let subView = subView as? NetworkError {
                subView.removeFromSuperview()
            }
        }
    }

    ///Place all the dataSources and delegates
    func configureDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }

    /// Add visual changes to UI
    func configureUI() {
        hideKeyboardWhenTappedAround()
        navigationController?.isNavigationBarHidden = true
        tableView.addSubview(refreshControl)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        refreshControl.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Reloading", attributes: attributes)
        tableView.estimatedRowHeight = 168
        tableView.rowHeight = UITableView.automaticDimension
    }

    //FINISHED:  Estas fent 2 crides simultanees que no saps si l'usuari les va a utilitzar
    func getData() {
        self.viewModel.getData(completionHandler: {
            self.tableView.reloadData()
        }) { error in
            if let networkView = Bundle.main.loadNibNamed("NetworkError", owner: nil, options: nil)?.first as? NetworkError {
                networkView.delegate = self
                self.tableView.addSubview(networkView)
                networkView.frame = self.tableView.frame
                print("SOME MESSAGE!")
            }
        }
    }
    /* func refreshData() {
     self.viewModel.getData(completionHandler: { ()
     self.refreshControl.endRefreshing()
     })
     }*/
}

// MARK: - UITableViewDelegate
extension MovieViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension MovieViewController: UITableViewDataSource {
    ///Display the number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    /// Display data of tableView in cells
    ///
    /// - Parameters:
    ///   - tableView: Represent our tableview
    ///   - indexPath: Represent the path to a specific location in a tree of nested arrays.
    /// - Returns: cell with information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //refreshData()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for:  indexPath) as! MovieCell
        viewModel.index = indexPath.row
        
        cell.setProperties(titleLabel: viewModel.title,
                           overviewLabel: viewModel.overview,
                           voteLabel: viewModel.voteAverage,
                           movieImageUrl: viewModel.portrait)
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
        viewModel.index = indexPath.row
        
        let detailViewModel = DetailViewModel(title: viewModel.title,
                                              overview: viewModel.overview,
                                              portrait: viewModel.portrait)
        
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
        
        viewModel.filterMovies(text: searchText, completionHandler: {
            self.tableView.reloadData()
        }) { (Error) in
            print(Error.localizedDescription)
        }
    }
    
    /// Toggle keyboard when user touch searchbar.
    ///
    /// - Parameter searchBar: Searchbar used by user for searching.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
}
