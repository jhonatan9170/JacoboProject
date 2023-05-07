//
//  MovieDetailViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 17/04/23.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imgMovie:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblReleaseDate:UILabel!
    @IBOutlet weak var lblSummary:UILabel!
    
    var imgSelected = UIImage()
    var lblTitleSelected = ""
    var lblReleaseDateSelected = ""
    var lblSummarySelected = ""
    
    var objMovieSelected : Movie!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDataMovie()
        
    }
    
    func showDataMovie(){
        self.lblTitle.text          = objMovieSelected.title
        self.lblReleaseDate.text    = objMovieSelected.releaseDateWithFormat
        self.lblSummary.text        = objMovieSelected.overview
        
        self.imgMovie.load(urlString: objMovieSelected.urlImage)
    }
    
}
