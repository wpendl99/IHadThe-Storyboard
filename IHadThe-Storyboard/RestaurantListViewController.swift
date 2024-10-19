//
//  RestaurantListViewController.swift
//  IHadThe
//
//  Created by William Pendleton on 10/19/24.
//

import UIKit

class RestaurantListViewController: UITableViewController, UISearchBarDelegate {

    var restaurants: [Restaurant] = []
    var filteredRestaurants: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurants"
        setupDummyData()
        filteredRestaurants = restaurants
    }

    func setupDummyData() {
        let menuItems1 = [
            MenuItem(name: "Spaghetti Carbonara", reviews: [
                Review(rating: 5, text: "Creamy and delicious! Perfectly cooked pasta with a rich sauce."),
                Review(rating: 4, text: "Great flavor, but a bit too salty for my taste.")
            ]),
            MenuItem(name: "Margherita Pizza", reviews: [
                Review(rating: 5, text: "Classic and flavorful. The fresh basil really stands out."),
                Review(rating: 3, text: "The crust was a bit too thick, but the toppings were great.")
            ]),
            MenuItem(name: "Chicken Alfredo", reviews: [
                Review(rating: 4, text: "Rich and creamy sauce with tender chicken pieces."),
                Review(rating: 3, text: "Good, but could use a little more seasoning.")
            ])
        ]

        let menuItems2 = [
            MenuItem(name: "Beef Burger", reviews: [
                Review(rating: 5, text: "Juicy and cooked to perfection. One of the best burgers I've had."),
                Review(rating: 4, text: "Great taste, but the bun was a bit soggy.")
            ]),
            MenuItem(name: "Caesar Salad", reviews: [
                Review(rating: 4, text: "Fresh and crispy, with a nice tangy dressing."),
                Review(rating: 2, text: "Too much dressing, it overpowered the salad.")
            ]),
            MenuItem(name: "Fish Tacos", reviews: [
                Review(rating: 5, text: "Amazing! The fish was fresh and the flavors were perfect."),
                Review(rating: 4, text: "Great tacos, but I would have liked a bit more spice.")
            ])
        ]

        let menuItems3 = [
            MenuItem(name: "Sushi Platter", reviews: [
                Review(rating: 5, text: "Fresh and delicious. Loved the variety of rolls."),
                Review(rating: 3, text: "Good sushi, but the rice was a bit dry.")
            ]),
            MenuItem(name: "Ramen", reviews: [
                Review(rating: 5, text: "Fantastic broth and perfectly cooked noodles."),
                Review(rating: 4, text: "Great flavor, but could use more toppings.")
            ]),
            MenuItem(name: "Tempura Udon", reviews: [
                Review(rating: 4, text: "Crispy tempura and flavorful broth. Really enjoyed it."),
                Review(rating: 3, text: "The broth was great, but the tempura got soggy quickly.")
            ])
        ]

        let restaurant1 = Restaurant(name: "The Gourmet Kitchen", menuItems: menuItems1)
        let restaurant2 = Restaurant(name: "Urban Bites", menuItems: menuItems2)
        let restaurant3 = Restaurant(name: "Tokyo Eats", menuItems: menuItems3)
        let restaurant4 = Restaurant(name: "Coastal Cuisine", menuItems: [
            MenuItem(name: "Grilled Salmon", reviews: [
                Review(rating: 5, text: "Perfectly cooked with a great smoky flavor."),
                Review(rating: 4, text: "Good salmon, but the portion was a bit small.")
            ]),
            MenuItem(name: "Lobster Roll", reviews: [
                Review(rating: 4, text: "Tasty and fresh, but a little too much mayo for my liking."),
                Review(rating: 3, text: "Good flavor, but the bun was a bit stale.")
            ])
        ])

        restaurants = [restaurant1, restaurant2, restaurant3, restaurant4]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filteredRestaurants[indexPath.row].name
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let menuVC = MenuListViewController()
        menuVC.restaurant = filteredRestaurants[indexPath.row]
        navigationController?.pushViewController(menuVC, animated: true)
    }

    // MARK: - Search Bar Delegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRestaurants = searchText.isEmpty ? restaurants : restaurants.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}
