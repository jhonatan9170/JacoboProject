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
    let overview: String
    
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
        self.overview       = dto.overview ?? ""
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
        // tengo mi array de DTOs
        // lo quiero convertir en un array de Peliculas
        
        var arrayMovies = [Movie]()
        for dto in self { // Recorro elemento x elemento
            arrayMovies.append(Movie(dto: dto))
        }
        return arrayMovies
        }
}

//class asd {
//    func asdasd() -> [Movie] {
//
//        // tengo mi array de DTOs
//        let arrayDTO = [MovieDTO]()
//        // lo quiero convertir en un array de Peliculas
//
//
//        var arrayMovies = [Movie]()
//        for dto in arrayDTO { // Recorro elemento x elemento
//            arrayMovies.append(Movie(dto: dto))
//        }
//        return arrayMovies
//        }
//
//}
