//
//  NetworkView.swift
//  MovieAPP
//
//  Created by Ruslan on 05/07/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class NetworkView: UIView {

    @IBAction func passToMovieVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "moviesVC") as! MovieViewController
        
        
        

    }
    
}
