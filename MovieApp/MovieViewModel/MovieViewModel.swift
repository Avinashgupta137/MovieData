//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Avinash Gupta on 27/07/24.
//

import Foundation

class MovieViewModel {
    private var movies: [MovieDataBase] = []
    private var filteredMovies: [MovieDataBase] = []
    
    var currentMovies: [MovieDataBase] {
        return filteredMovies.isEmpty ? movies : filteredMovies
    }
    
    init() {
        loadMovies()
    }
    
    private func loadMovies() {
        guard let filelocation = Bundle.main.url(forResource: "movies", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: filelocation)
            let decoder = JSONDecoder()
            movies = try decoder.decode([MovieDataBase].self, from: data)
        } catch {
            print(error)
        }
    }
    
    func filterMovies(by category: String, value: String) {
        switch category {
        case "Year":
            filteredMovies = movies.filter { $0.year == value }
        case "Genre":
            filteredMovies = movies.filter { $0.genre?.contains(value) == true }
        case "Director":
            filteredMovies = movies.filter { $0.director == value }
        case "Actor":
            filteredMovies = movies.filter { $0.actors?.contains(value) == true }
        default:
            filteredMovies = movies
        }
    }
    
    func searchMovies(with query: String) {
           filteredMovies = movies.filter { movie in
               (movie.title?.contains(query) ?? false) ||
               (movie.genre?.contains(query) ?? false) ||
               (movie.director?.contains(query) ?? false) ||
               (movie.actors?.contains(query) ?? false)
           }
       }
    
    func clearFilter() {
        filteredMovies.removeAll()
    }
}
