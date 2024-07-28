//
//  RatingControl.swift
//  MovieApp
//
//  Created by Avinash Gupta on 27/07/24.
//


import UIKit

class MovieTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblMovieDetail: UILabel!
    @IBOutlet weak var headerbutton: UIButton!
    
    var headerButtonCallback: ((_ indexnum: Int)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
