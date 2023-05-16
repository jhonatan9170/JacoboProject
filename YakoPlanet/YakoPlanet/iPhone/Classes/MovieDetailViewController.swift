//
//  MovieDetailViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 17/04/23.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var MovieImage:UIImageView!
    @IBOutlet weak var TitleLbl:UILabel!
    @IBOutlet weak var ReleaseDateLbl:UILabel!
    @IBOutlet weak var DescriptionLbl:UILabel!
    
    var movieDetailViewModel: MovieDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showDataMovie()
        
    }
    
    func showDataMovie(){
        self.TitleLbl.text          = movieDetailViewModel.title
        self.ReleaseDateLbl.text    = movieDetailViewModel.releaseDate
        self.DescriptionLbl.text    = movieDetailViewModel.description
        
        self.MovieImage.load(urlString: movieDetailViewModel.imageURL)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
