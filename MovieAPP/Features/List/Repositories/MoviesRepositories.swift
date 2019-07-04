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
    
    /// Obtain data of movies using URL, decode the JSON and save it into array.
    ///
    /// - Parameter succed: Update object Results
    func parseData (succes succed: @escaping ( ([Results]?, Error?) -> ( ))) {
        guard let movieURL = URL(string: finalUrl) else {
            return
        }
        URLSession.shared.dataTask(with: movieURL) { (data, response, error) in
            if let data = data {
                do {
                    var arrayMov = [Results]()
                    let results = try JSONDecoder().decode(MovieModel.self, from: data)
                    for movie in results.results {
                        arrayMov.append(movie)
                    }
                    DispatchQueue.main.async {
                        succed(arrayMov, error)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                return
            }
            
        }.resume()
    }
}
