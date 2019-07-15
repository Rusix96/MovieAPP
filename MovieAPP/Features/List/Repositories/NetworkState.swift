//
//  Reachability.swift
//  MovieAPP
//
//  Created by Ruslan on 15/07/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//
import Alamofire

struct NetworkState {
    
    var isConnected: Bool {
        return NetworkReachabilityManager(host: "www.apple.com")!.isReachable
    }
}
