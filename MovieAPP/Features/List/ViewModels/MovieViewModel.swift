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
    //FUNCION QUE PUEDA FILTRAR
    func filterMovies () {
        
    }
    
    /// Obtain the data of movies
    ///
    /// - Parameter succed: Asign data of movies to array
    func getData (succes succed: @escaping (() -> ())) {
        DispatchQueue.main.async {
            MoviesRepositories.sharedMovies.parseData(succes: { (arrayMov, error) in
                if error == nil {
                    self.arrayMovies = arrayMov
                    succed()
                }
            })
        }
    }
}
