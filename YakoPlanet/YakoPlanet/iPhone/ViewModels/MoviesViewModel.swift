//
//  MoviesViewModel.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 14/05/23.
//

import Foundation

protocol MoviesViewModelDelegate: AnyObject {
    func didUpdateMovies(_ movies: [Movie])
    func didFail(withError error: Error?)
}

class MoviesViewModel {
    weak var delegate: MoviesViewModelDelegate?
    private let networkingProvider: NetworkingProvider
    
    var movies: [Movie] = []
    var moviesToShow: [Movie] = []
    var filteredMovies: [Movie] = []
    
    init(networkingProvider: NetworkingProvider) {
        self.networkingProvider = networkingProvider
        self.networkingProvider.delegate = self
    }
    
    func getAllMovies() {
        networkingProvider.getAllMovies()
    }
}

extension MoviesViewModel: NetworkingProviderDelegate {
    func didFetchMovies(_ movies: [MovieDTO]) {
        let mappedMovies = movies.map { Movie(dto: $0) }
        self.movies = mappedMovies
        delegate?.didUpdateMovies(mappedMovies)
    }
    
    func didFail(withError error: Error?) {
        delegate?.didFail(withError: error)
    }
}
