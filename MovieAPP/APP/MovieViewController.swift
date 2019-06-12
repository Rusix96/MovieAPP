//
//  ViewController.swift
//  MovieAPP
//
//  Created by Rusik on 11/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import AFNetworking

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var movies: [NSDictionary] = []
    var moviesFilter : [NSDictionary] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        moviesFilter = movies
        self.hideKeyboardWhenTappedAround()
        getMovies()
    }
    
    func getMovies() {
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = URLRequest (
            url: url!,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        let task: URLSessionDataTask = session.dataTask(
            with: request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let dataDictionary = try! JSONSerialization.jsonObject(
                        with: data, options:[]) as? NSDictionary {
                        print("response: \(dataDictionary)")
                        self.movies = (dataDictionary["results"] as! [NSDictionary])
                        self.moviesFilter = self.movies
                        self.tableView.reloadData()
                        
                    }
                }
        })
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //If all OK, return all the movies, else, default 0
        return moviesFilter.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for:  indexPath)  as! MovieCell
        let movie = moviesFilter[indexPath.row]
        
        let title = movie["title"] as! String
        //moviesFilter.append(title)
        let overview = movie["overview"] as! String
        let voteAverage = movie["vote_average"] as! NSNumber
        let image2 = movie["poster_path"] as! String
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let imageUrl = URL(string: baseUrl + image2)!
        
        
        cell.titleLabel.text = title
        cell.overviewLabel.text = "\(overview)"
        cell.voteLabel.text = "\(voteAverage)"
        cell.movieImageView.setImageWith(imageUrl)
        // cell.movieImageView.setImageUrl(image)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailMovie") as! DetailsVC
        let movie = moviesFilter[indexPath.row]
        
        let image2 = movie["poster_path"] as! String
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let imageUrl = URL(string: baseUrl + image2)!
        
        let imageVi : UIImageView = UIImageView()
        
        imageVi.setImageWith(imageUrl)
     
        vc.titleMovie = title
        vc.overviewMovie = overview
        vc.moviePoster = imageVi.image!
        
        //Present to the view controller
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.35) {
         cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
            moviesFilter = searchText.isEmpty ? movies : movies.filter({(movie: NSDictionary) -> Bool in
                let title = movie["title"] as! String
                
                return title.range(of: searchText, options: .caseInsensitive) != nil
        
                
            })
        tableView.reloadData()
        }
    
    //Hide keyboard when press search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
    
}

