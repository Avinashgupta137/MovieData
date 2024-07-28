//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Avinash Gupta on 27/07/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: MovieDataBase?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        let posterImageView = UIImageView()
        let titleLabel = UILabel()
        let plotLabel = UILabel()
        let castAndCrewLabel = UILabel()
        let releaseDateLabel = UILabel()
        let genreLabel = UILabel()
        let ratingControl = RatingControl()
        
        // Add subviews to the view and set up constraints
        // Assuming constraints are set correctly
        
        if let movie = movie {
            if let posterURL = movie.poster, let url = URL(string: posterURL) {
                // Assuming some async image loading method
                posterImageView.loadImage(from: url)
            }
            titleLabel.text = movie.title
            plotLabel.text = movie.plot
            castAndCrewLabel.text = "Cast: \(movie.actors ?? "")\nDirector: \(movie.director ?? "")"
            releaseDateLabel.text = "Released: \(movie.released ?? "")"
            genreLabel.text = "Genre: \(movie.genre ?? "")"
            // Set ratingControl's rating
        }
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
