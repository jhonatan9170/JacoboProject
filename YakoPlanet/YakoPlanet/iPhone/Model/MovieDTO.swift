//
//  MovieDTO.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 22/04/23.
//

import Foundation
//{
//    "page": 1,
//    "results": [
//        {
//            "adult": false,
//            "backdrop_path": "/lWqjXgut48IK5f5IRbDBAoO2Epp.jpg",
//            "genre_ids": [
//                16,
//                12,
//                10751,
//                14,
//                35
//            ],
//            "id": 502356,
//            "original_language": "en",
//            "original_title": "The Super Mario Bros. Movie",
//            "overview": "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
//            "popularity": 11505.295,
//            "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
//            "release_date": "2023-04-05",
//            "title": "The Super Mario Bros. Movie",
//            "video": false,
//            "vote_average": 7.5,
//            "vote_count": 1211
//        }
//    ],
//    "total_pages": 37960,
//    "total_results": 759181
//}

struct PageMovieDTO: Decodable{
    
    let page: Int?
    let results: [MovieDTO]?
}

struct MovieDTO: Decodable{
    
    let id: Int?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let overview: String?
    
    
    
}
