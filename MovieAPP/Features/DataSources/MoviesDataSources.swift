//
//  MoviesDataSources.swift
//  MovieAPP
//
//  Created by Rusik on 25/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit
import Alamofire

public class MoviesDataSources: NSObject {
    
    public static let sharedMovies = MoviesDataSources()
    
    func getData (succes succed: @escaping ( ([MovieModel]) -> ( ))) {
        let url = "https://api.themoviedb.org/3/search/movie?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page=&query=\(1)"
        
        Alamofire.request(url).responseJSON {
            response in
            
            if let json = response.result.value as? [String : Any?] {
                print("JSON: \(json)") // serialized json response
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

