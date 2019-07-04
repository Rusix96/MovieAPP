//
//  MovieModel.swift
//  MovieAPP
//
//  Created by Ruslan on 02/07/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    let page: Int?
    let total_results: Int?
    let total_pages: Int?
    let results: [Results]
    
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
        case results = "results"
        
    }
}

struct Results: Codable {
    let posterPath: String?
    let backdropPath: String?
    let genreIds: [Int]?
    let voteCount: Int?
    let overview: String?
    let originalTitle: String?
    let popularity: Float?
    let releaseData: String?
    let id: Int?
    var video: Bool? = false
    let originalLanguage: String?
    let voteAverage: Float?
    let title: String?
    var adult: Bool? = false
    
    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case voteCount = "vote_count"
        case overview = "overview"
        case originalTitle = "original_title"
        case popularity = "popularity"
        case releaseData = "release_date"
        case id = "id"
        case video = "video"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case title = "title"
        case adult = "adult"
    }
}


