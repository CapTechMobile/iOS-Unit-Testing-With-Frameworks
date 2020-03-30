// Copyright © 2020 CapTech. All rights reserved.

import UIKit

class ListViewController: UIViewController {
    var favoritesSource = FavoriteNamesSource()
    var isFavoritesSelected: Bool {
        return segmentedControl.selectedSegmentIndex == 1
    }

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesSource.isFavoritesSelected = isFavoritesSelected
    }

    @IBAction func didChangeSegmentedControl() {
        favoritesSource.isFavoritesSelected = isFavoritesSelected
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesSource.source.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        let currentElement = favoritesSource.source[indexPath.row]
        cell.accessoryType = currentElement.isFavorite ? .checkmark : .none
        cell.textLabel?.text = currentElement.item

        return cell
    }

}

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favoritesSource.toggleFavorite(at: indexPath.row)
        tableView.reloadData()
    }

}
