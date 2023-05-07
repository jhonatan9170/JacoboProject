//
//  MovieDTO.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 22/04/23.
//

import Foundation

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
