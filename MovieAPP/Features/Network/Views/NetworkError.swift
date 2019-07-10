//
//  NetworkView.swift
//  MovieAPP
//
//  Created by Ruslan on 05/07/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class NetworkError: UIView {
    
    var delegate: ErrorMessageDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @IBAction func retry(_ sender: Any) {
        delegate?.refresh()
    }
    
    func showAlert(error: Error) {
        // errorLabel.text = error as? String
    }
}
