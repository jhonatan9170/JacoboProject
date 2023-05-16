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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
