//
//  MovieViewModel.swift
//  MovieAPP
//
//  Created by Rusik on 26/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {
    var arrayMovies : [MovieModel]?
    var index : Int = 0
    
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
            return "\(portrait)"
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
    func getData (succes succed: @escaping (() -> ())) {
        MoviesDataSources.sharedMovies.getData(succes: { (arrayModels) in
            self.arrayMovies = arrayModels
            succed()
        })
    }
}
