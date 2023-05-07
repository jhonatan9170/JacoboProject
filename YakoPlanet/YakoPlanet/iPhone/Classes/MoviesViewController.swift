//
//  MoviesViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 16/04/23.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tblvMovies: UITableView!
    @IBOutlet weak var searchBarMovies: UISearchBar!
    
    var networkingProvider = NetworkingProvider()
    
    var moviesToShow = [Movie]()
    var filteredMovies = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarMovies.delegate = self
        
        self.getAllMovies()
        
    }
    
    
    func getAllMovies(){
        self.networkingProvider.getAllMovies { arrayMovieDTO in
            self.moviesToShow = arrayMovieDTO.toMovies
            self.filteredMovies = self.moviesToShow
            self.tblvMovies.reloadData()
                        
        } failure: { error in
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let controller = segue.destination as? MovieDetailViewController, let objMovie =  sender as? Movie{
            controller.objMovieSelected = objMovie
        }
    }
    
}

// MARK: - Data Source
extension MoviesViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let xCell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as! MovieTableViewCell
        
        let moviesShow = filteredMovies[indexPath.row]
        
        xCell.lblTitle.text         = moviesShow.title
        xCell.lblReleaseDate.text   = moviesShow.releaseDateWithFormat
        xCell.imgMovie.load(urlString: moviesShow.urlImage)

        return xCell
    }
    
}

// MARK: - Delegate
extension MoviesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let detailMoview = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
//
//        let movieSelected = self.movieToShow[indexPath.row]
//
//        //detailMoview?.imgMovie.image = movieSelected.urlImage
//
//        detailMoview?.lblTitle.text = movieSelected.title
//        detailMoview?.lblReleaseDate.text = movieSelected.releaseDateWithFormat
//        detailMoview?.lblSummary.text = movieSelected.overview
//
//        self.navigationController?.pushViewController(detailMoview!, animated: false)
//
        
        let movieSelected = self.filteredMovies[indexPath.row]

        self.performSegue(withIdentifier: "MovieDetailViewController", sender: movieSelected)
    }
}

// MARK: - SearchBar Delegate
extension MoviesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredMovies = moviesToShow
        } else {
            filteredMovies = moviesToShow.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        tblvMovies.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredMovies = moviesToShow
        tblvMovies.reloadData()
    }
    
}
