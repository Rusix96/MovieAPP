//
//  MoviesDataSources.swift
//  MovieAPP
//
//  Created by Rusik on 25/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
import Alamofire

public class MoviesRepositories: NSObject {
    
    public static let sharedMovies = MoviesRepositories()
    /// Obtain data of movies using URL, decode the JSON and save it into array.
    ///
    /// - Parameter succed: Update object Results
    func parseData (completionHandler: @escaping ( ([Results]?, Error?) -> ( ))) {
        guard let movieURL = URL(string: finalUrl) else {
            return
        }
        
        // TODO Reachability - Saber si te internet
        // completionHandler(nil, error)
        
        DispatchQueue.global(qos: .background).async {
           
            let urlRequest = URLRequest(
                url: movieURL,
                cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                timeoutInterval: 2
            )

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data {
                    do {
                        var arrayMov = [Results]()
                        let results = try JSONDecoder().decode(MovieModel.self, from: data)
                        for movie in results.results {
                            arrayMov.append(movie)
                        }
                        DispatchQueue.main.async {
                            completionHandler(arrayMov, error)
                        }
                    } catch let error {
                        completionHandler(nil, error)
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
                }.resume()
        }
        
    }
    
    func filterData (text: String, completionHandler: @escaping ( ([Results]?, Error?) -> ( ))) {
        guard let movieURL = URL(string: filterdUrl  + text) else {
            return
        }
        
        // TODO Reachability - Saber si te internet
        // completionHandler(nil, error)
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: movieURL) { (data, response, error) in
                if let data = data {
                    do {
                        var arrayMov = [Results]()
                        let results = try JSONDecoder().decode(MovieModel.self, from: data)
                        for movie in results.results {
                            arrayMov.append(movie)
                        }
                        DispatchQueue.main.async {
                            completionHandler(arrayMov, error)
                        }
                        
                    } catch let error {
                        completionHandler(nil, error)
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
                }.resume()
        }
    }
}
