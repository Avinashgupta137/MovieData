//
//  RatingControl.swift
//  MovieApp
//
//  Created by Avinash Gupta on 27/07/24.
//


import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieTypeDetail: UILabel!
    
    var movieDetail: MovieDataBase?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var selectedType: String? {
        didSet {
            self.movieImageView.loadImage(from: URL(string: movieDetail?.poster ?? "") ?? URL(fileURLWithPath: ""))
            self.movieLanguage.text = movieDetail?.language ?? ""
            self.movieTitle.text = movieDetail?.title ?? ""
            switch selectedType {
            case "Year":
                self.movieTypeDetail.text = "Year :" + (movieDetail?.year ?? "")
                
            case "Genre":
                self.movieTypeDetail.text = "Genre :" + (movieDetail?.genre ?? "")
            case "Directors":
                self.movieTypeDetail.text = "Directors :" + (movieDetail?.director ?? "")
            case "Actors":
                self.movieTypeDetail.text = "Actors :" + (movieDetail?.actors ?? "")
            case "All Movies":
                var alldata = "Genre : \(movieDetail?.genre ?? "")"
                 alldata += "\n\nActors: \(movieDetail?.actors ?? "")"
                 alldata += "\n\nDirectors : \(movieDetail?.director ?? "")"
                 alldata += "\n\nYear : \(movieDetail?.year ?? "")"
                self.movieTypeDetail.text = alldata
            default:
                print("Default")
            }
        }
    }
    
}
