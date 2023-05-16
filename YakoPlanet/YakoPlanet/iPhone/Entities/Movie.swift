//
//  Movie.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 28/04/23.
//

import Foundation

struct Movie{
    
    let id: Int
    let posterPath: String
    let releaseDate: Date?
    let title: String
    let description: String
    
    var urlImage: String {
        return "https://www.themoviedb.org/t/p/w1280" + self.posterPath
    }

    var releaseDateWithFormat: String {
        return releaseDate?.convertDateToString(format: "dd MMMM YYYY") ?? "Proximamente..."
    }
    
    init(dto : MovieDTO) {
        self.id             = dto.id ?? 0
        self.posterPath     = dto.poster_path ?? ""
        self.releaseDate    = dto.release_date?.convertStringToDateWithFormat("yyyy-MM-dd")
        self.title          = dto.title ?? ""
        self.description    = dto.overview ?? ""
    }
    
}

// MARK: Conversions
extension String{
    func convertStringToDateWithFormat(_ format: String) -> Date? {
        let fadeFormatter = DateFormatter()
        fadeFormatter.dateFormat = format
        return fadeFormatter.date(from: self)
    }
}

extension Date{
    func convertDateToString( format: String) -> String {
        let fadeFormatter = DateFormatter()
        fadeFormatter.dateFormat = format
        return fadeFormatter.string(from: self)
    }
}

// MARK: MoviesDto to Array
extension Array where Element == MovieDTO{
    
    var toMovies: [Movie]{

        var arrayMovies = [Movie]()
        for dto in self { 
            arrayMovies.append(Movie(dto: dto))
        }
        return arrayMovies
        }
}
