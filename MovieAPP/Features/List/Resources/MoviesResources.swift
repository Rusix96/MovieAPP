//
//  MoviesDataSources.swift
//  MovieAPP
//
//  Created by Rusik on 25/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Alamofire

public class MoviesResources: NSObject {
    
    public static let sharedMovies = MoviesResources()
    
    func getData (succes succed: @escaping ( ([MovieModel]) -> ( ))) {
        
        Alamofire.request(finalUrl).responseJSON {
            response in
            
            if let json = response.result.value as? [String : Any?] {
                if let results = json ["results"] as? [[String : Any?]] {
                    var arrayTemp = [MovieModel]()
                    
                    for result in results {
                        if let movie = MovieModel(JSON: result as [String : Any]) {
                            arrayTemp.append(movie)
                        }
                    }
                    succed (arrayTemp)
                }
            }
        }
    }
}

