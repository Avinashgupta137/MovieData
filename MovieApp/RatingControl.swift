//
//  RatingControl.swift
//  MovieApp
//
//  Created by Avinash Gupta on 27/07/24.
//

import UIKit

class RatingControl: UIView {
    var rating: Ratings? {
        didSet {
            // Update UI with rating value
            if let rating = rating {
                ratingLabel.text = "\(rating.source ?? ""): \(rating.value ?? "")"
            }
        }
    }
    
    private let ratingLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(ratingLabel)
        // Setup constraints for ratingLabel
        // Assuming constraints are set correctly
    }
}

