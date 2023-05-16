//
//  MovieDetailViewModel.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 15/05/23.
//

import Foundation

class MovieDetailViewModel {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var releaseDate: String {
        return movie.releaseDateWithFormat
    }
    
    var description: String {
        return movie.description
    }
    
    var imageURL: String {
        return movie.urlImage
    }
}
