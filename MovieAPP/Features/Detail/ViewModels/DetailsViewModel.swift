//
//  DetailsViewModel.swift
//  MovieAPP
//
//  Created by Rusik on 27/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import Foundation

class DetailsViewModel: NSObject {
    var arrayMovies: [MovieModel]?
    var index: Int = 0 //Always it's better to put what type of var is (Like Int...)
    
   // override init() {
     //   setProperties(titleLabel: detailViewModel.title,
       //               overviewLabel: detailViewModel.overview,
         //             movieImageUrl: detailViewModel.portrait)
    //}
    
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
    
    public var portrait : String {
        if let array = arrayMovies, let portrait = array[index].posterPath {
            return "\(baseImageUrl + portrait)"
        } else {
            return "Empty"
        }
    }
    func getData (succes succed: @escaping (() -> ())) {
        MoviesResources.sharedMovies.getData(succes: { (arrayModels) in
            self.arrayMovies = arrayModels
            succed()
        })
    }
    
    
}
