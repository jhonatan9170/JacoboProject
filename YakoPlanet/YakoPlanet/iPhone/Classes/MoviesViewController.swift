//
//  MoviesViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 16/04/23.
//

import UIKit

class MoviesViewController: UIViewController {

    
    
//    var moviesToShow: [MovieDTO] = [
//        MovieDTO(id: 111, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", release_date: "04/05/2023", title: "The Super Mario Bros. Movie", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi."),
//        MovieDTO(id: 222, poster_path: "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg", release_date: "12/15/2022", title: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure."),
//        MovieDTO(id: 333, poster_path: "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg", release_date: "02/16/2023", title: "Ant-Man and the Wasp: Quantumania", overview: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible."),
//        MovieDTO(id: 444, poster_path: "/3GrRgt6CiLIUXUtoktcv1g2iwT5.jpg", release_date: "03/16/2023", title: "Shazam! Fury of the Gods", overview: "Billy Batson and his foster siblings, who transform into superheroes by saying SHAZAM are forced to get back into action and fight the Daughters of Atlas, who they must stop from using a weapon that could destroy the world."),
//        MovieDTO(id: 555, poster_path: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg", release_date: "03/23/2023", title: "John Wick: Chapter 4", overview: "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.")
//    ]
    
    var movieToShow = [Movie]()
    var networkingProvider = NetworkingProvider()
    
    
    @IBOutlet weak var tblvMovies: UITableView!
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllMovies()
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


extension MoviesViewController: UITableViewDataSource{
//    NumberOfSections, numberOfRows and cellForRowAt
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let xCell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as! MovieTableViewCell
        
        let moviesShow = movieToShow[indexPath.row]
        
        xCell.lblTitle.text = moviesShow.title
        xCell.lblReleaseDate.text = moviesShow.releaseDateWithFormat
        
        let urld = URL(string: movieToShow[indexPath.row].urlImage)!
                
                if let data = try? Data(contentsOf:urld) {
                        // Create Image and Update Image View
                    xCell.imgMovie.image = UIImage(data: data)
                }
        
        
        
        return xCell
    }
    
}

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
        print(movieSelected.title)

        //movieSelected.title = lblTitulo
        
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: movieSelected)
    }
}

