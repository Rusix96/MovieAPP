//
//  NetworkView.swift
//  MovieAPP
//
//  Created by Ruslan on 05/07/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class NetworkError: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    func showAlert(error: Error) {
       // errorLabel.text = error as? String
    }
    
    
}
