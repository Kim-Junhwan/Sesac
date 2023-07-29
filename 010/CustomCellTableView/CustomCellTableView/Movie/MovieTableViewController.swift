//
//  MovieTableViewController.swift
//  CustomCellTableView
//
//  Created by JunHwan Kim on 2023/07/28.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movieList: MovieInfo = MovieInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 178.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else { return MovieTableViewCell() }
        cell.configureCell(movie: movieList.movie[indexPath.row])
        return cell
    }
}
