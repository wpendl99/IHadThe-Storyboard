//
//  MenuListViewController.swift
//  IHadThe
//
//  Created by William Pendleton on 10/19/24.
//

import UIKit

class MenuListViewController: UITableViewController {

    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = restaurant?.name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant?.menuItems.count ?? 0
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        if let menuItem = restaurant?.menuItems[indexPath.row] {
            cell.textLabel?.text = menuItem.name
            let averageRating = calculateAverageRating(for: menuItem)
            cell.detailTextLabel?.text = "Rating: \(averageRating)/5"
        }
        return cell
    }

    func calculateAverageRating(for menuItem: MenuItem) -> Double {
        let total = menuItem.reviews.reduce(0) { $0 + $1.rating }
        return menuItem.reviews.isEmpty ? 0 : Double(total) / Double(menuItem.reviews.count)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let mealDetailVC = MealDetailViewController()
        mealDetailVC.menuItem = restaurant?.menuItems[indexPath.row]
        navigationController?.pushViewController(mealDetailVC, animated: true)
    }
}
