//
//  MovieViewModel.swift
//  MovieAPP
//
//  Created by Rusik on 26/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Kingfisher

class MovieViewModel: NSObject {
    var arrayMovies: [Results]?
    var index: Int = 0
    
    public var title : String { 
        if let array = arrayMovies, let title = array[index].title {
            return "\(title)"
        } else {
            return "Empty"
        }
    }
    
    public var overview : String {
        if let array = arrayMovies, let overview = array[index].overview {
            return "\(overview)"
        } else {
            return "Empty"
        }
    }
    
    public var voteAverage : String {
        if let array = arrayMovies, let vote = array[index].voteAverage {
            let stringVote = String(vote)
            return "\(stringVote.prefix(3))"
        } else {
            return "Empty"
        }
    }
    
    public var portrait : String {
        if let array = arrayMovies, let portrait = array[index].posterPath {
            return "\(baseImageUrl + portrait)"
        } else {
            return "Empty"
        }
    }
    public var numberOfRows : Int {
        if let array = arrayMovies {
            return array.count
        } else {
            return 0
        }
    }
    
    /// Obtain the data of Movies and compare it with searchtext for fetch the results.
    ///
    /// - Parameters:
    ///   - text: text of searchtext.
    ///   - completionHandler: obtain the data of movies.
    ///   - throwError: error
    func filterMovies (text: String, completionHandler: @escaping (() -> ()), throwError: @escaping ((Error) -> ())) {
        MoviesRepositories.sharedMovies.filterData(texto: text) { (arrayMov, error) in
            if error != nil {
                throwError(error!)
            } else {
                self.arrayMovies = arrayMov
                completionHandler()
            }
        }
    }
    
    /// Obtain the data of movies
    ///
    /// - Parameter succed: Asign data of movies to array
    func getData (completionHandler: @escaping (() -> ()) ) {
        MoviesRepositories.sharedMovies.parseData { (arrayMov, error) in
            if error != nil {
                print(error?.localizedDescription) 
            } else {
                self.arrayMovies = arrayMov
                completionHandler()
            }
        }
    }
}
