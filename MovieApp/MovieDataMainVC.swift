//
//  ViewController.swift
//  MovieApp
//
//  Created by Avinash Gupta on 27/07/24.
//

import UIKit

class MovieDataMainVC: UIViewController {
    
    private let viewModel = MovieViewModel()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var headerTitle = ["Year", "Genre", "Directors", "Actors", "All Movies"]
    var selectedTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .black
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.register(UINib(nibName: "MovieTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTypeTableViewCell")
        tableView.reloadData()
    }
    private func setupUI() {
        searchBar.placeholder = "Search Movies"
    }
    
}

extension MovieDataMainVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.clearFilter()
        } else {
            viewModel.searchMovies(with: searchText)
        }
        tableView.reloadData()
    }
}

extension MovieDataMainVC :  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedTitle == self.headerTitle[section] {
            return viewModel.currentMovies.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "MovieTypeTableViewCell") as? MovieTypeTableViewCell else {
            return nil
        }
        headerCell.lblMovieDetail.text = self.headerTitle[section]
        headerCell.headerbutton.tag = section
//        headerCell.headerButtonCallback = headerButtonCallback()
        headerCell.headerbutton.addTarget(self, action: #selector(headerButtonTapped(_:)), for: .touchUpInside)
        return headerCell.contentView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.movieDetail = viewModel.currentMovies[indexPath.row]
        cell.selectedType = self.selectedTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60 // Set the appropriate height for your header
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func headerButtonTapped(_ sender: UIButton) {
        let section = sender.tag
        if self.selectedTitle == self.headerTitle[section] {
            self.selectedTitle = ""
        }else{
            self.selectedTitle = self.headerTitle[section]
        }
        self.tableView.reloadData()
    }
    
    func headerButtonCallback() -> ((Int)->Void) {
        return { indexnum in
            if self.selectedTitle == self.headerTitle[indexnum] {
                self.selectedTitle = ""
            }else{
                self.selectedTitle = self.headerTitle[indexnum]
            }
            self.tableView.reloadData()
        }
    }
    
}
