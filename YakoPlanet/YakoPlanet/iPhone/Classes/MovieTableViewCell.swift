//
//  MovieTableViewCell.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 22/04/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblReleaseDate:UILabel!
    
    
    // Aun sin usar
    func updateDataMovie( objMovie: Movie){
        //self.lblTitle.text = objMovie.title
        //self. lblReleaseDate.text = objMovie.releaseDate.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
