//
//  NetworkView.swift
//  MovieAPP
//
//  Created by Ruslan on 05/07/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import UIKit

class NetworkError: UIView {
    
    @IBOutlet weak var errorImage: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    var delegate: ErrorMessageDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func awakeFromNib() {
        
    }
    
    func configureConstraints() {
        errorImage.translatesAutoresizingMaskIntoConstraints = false
       // errorImage.topAnchor.constraint(equalTo: NetworkError.topAnchor).isActive = true
        //errorImage.leftAnchor.constraint(equalTo: NetworkError.leftAnchor).isActive = true
        //errorImage.rightAnchor.constraint(equalTo: NetworkError.rightAnchor).isActive = true
        //errorImage.bottomAnchor.constraint(equalTo: NetworkError.bottomAnchor).isActive = true
        
    }
    
    @IBAction func retry(_ sender: Any) {
        delegate?.refresh()
    }

    func showAlert(error: Error) {
        // errorLabel.text = error as? String
    }
}
