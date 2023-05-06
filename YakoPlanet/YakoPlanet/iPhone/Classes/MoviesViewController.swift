//
//  MoviesViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 16/04/23.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tblvMovies: UITableView!
    
    var movieToShow = [Movie]()
    var networkingProvider = NetworkingProvider()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllMovies()
        self.tabBarController?.navigationItem.title = "nav bar title"
    }
    
    
    func getAllMovies(){
        self.networkingProvider.getAllMovies { arrayMovieDTO in
            self.movieToShow = arrayMovieDTO.toMovies
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
        return movieToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let xCell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as! MovieTableViewCell
        
        let moviesShow = movieToShow[indexPath.row]
        
        xCell.lblTitle.text         = moviesShow.title
        xCell.lblReleaseDate.text   = moviesShow.releaseDateWithFormat
        xCell.imgMovie.load(urlString: moviesShow.urlImage)
        
//        let urld = URL(string: movieToShow[indexPath.row].urlImage)!
//
//                if let data = try? Data(contentsOf:urld) {
//                        // Create Image and Update Image View
//                    xCell.imgMovie.image = UIImage(data: data)
//                }

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
        
        let movieSelected = self.movieToShow[indexPath.row]
        //print(movieSelected.title)
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: movieSelected)
    }
}

