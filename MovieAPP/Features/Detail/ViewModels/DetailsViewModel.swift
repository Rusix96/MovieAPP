//
//  DetailsViewModel.swift
//  MovieAPP
//
//  Created by Rusik on 27/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DetailsViewModel: NSObject {
    
    public var title : String
    public var overview : String
    public var portrait : String
    
    init(title: String, overview: String, portrait: String) {
        self.title = title
        self.overview = overview
        self.portrait = portrait
    }
    
    override init() {
        self.title = ""
        self.overview = ""
        self.portrait = ""
    }
    
    
}
