//
//  MoviesDataSources.swift
//  MovieAPP
//
//  Created by Rusik on 25/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Alamofire

public class MoviesRepositories: NSObject {
    
    public static let sharedMovies = MoviesRepositories()
    
    /// Obtain data of movies using url and save it into array.
    ///
    /// - Parameter succed: Update object MovieModel
    func getData (succes succed: @escaping ( ([MovieModel1]) -> ( ))) {
        
        Alamofire.request(finalUrl).responseJSON {
            response in
            
            if let json = response.result.value as? [String : Any?] {
                if let results = json ["results"] as? [[String : Any?]] {
                    var arrayTemp = [MovieModel1]()
                    
                    for result in results {
                        if let movie = MovieModel1(JSON: result as [String : Any]) {
                            arrayTemp.append(movie)
                        }
                    }
                    succed (arrayTemp)
                }
            }
        }
    }
}

