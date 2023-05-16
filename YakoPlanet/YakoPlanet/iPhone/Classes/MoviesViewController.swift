//
//  MoviesViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 16/04/23.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var MoviesTable: UITableView!
    @IBOutlet weak var MoviesSearchBar: UISearchBar!
    
    var moviesViewModel: MoviesViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MoviesSearchBar.delegate = self
        
        let networkingProvider = NetworkingProvider()
        moviesViewModel = MoviesViewModel(networkingProvider: networkingProvider)
        moviesViewModel.delegate = self
        
        moviesViewModel.getAllMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let controller = segue.destination as? MovieDetailViewController, let objMovie =  sender as? Movie {
            let movieDetailViewModel = MovieDetailViewModel(movie: objMovie)
            controller.movieDetailViewModel = movieDetailViewModel
        }
    }

}

// MARK: - Data Source
extension MoviesViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let xCell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as! MovieTableViewCell
        
        let moviesShow = moviesViewModel.filteredMovies[indexPath.row]
        
        xCell.lblTitle.text         = moviesShow.title
        xCell.lblReleaseDate.text   = moviesShow.releaseDateWithFormat
        xCell.imgMovie.load(urlString: moviesShow.urlImage)

        return xCell
    }
    
}

// MARK: - Delegate
extension MoviesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieSelected = self.moviesViewModel.filteredMovies[indexPath.row]
                showMovieDetail(movie: movieSelected)
        
        
    }
    
    func showMovieDetail(movie: Movie) {
            let storyboard = UIStoryboard(name: "Movies", bundle: nil)
            if let movieDetailViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
                let movieDetailViewModel = MovieDetailViewModel(movie: movie)
                movieDetailViewController.movieDetailViewModel = movieDetailViewModel
                movieDetailViewController.modalPresentationStyle = .fullScreen
                present(movieDetailViewController, animated: true, completion: nil)
            }
        }
}

// MARK: - SearchBar Delegate
extension MoviesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            moviesViewModel.filteredMovies = moviesViewModel.movies
        } else {
            moviesViewModel.filteredMovies = moviesViewModel.movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        MoviesTable.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        moviesViewModel.filteredMovies = moviesViewModel.moviesToShow
        MoviesTable.reloadData()
    }
    
}
// MARK: - MoviesViewModel-Delegate
extension MoviesViewController: MoviesViewModelDelegate{
    func didFail(withError error: Error?) {
        print(error ?? "Error")
    }
    
    func didUpdateMovies(_ movies: [Movie]) {
        moviesViewModel.movies = movies
        moviesViewModel.filteredMovies = movies
        MoviesTable.reloadData()
    }
    
}
