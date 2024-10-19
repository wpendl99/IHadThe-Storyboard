//
//  MealDetailViewController.swift
//  IHadThe
//
//  Created by William Pendleton on 10/19/24.
//

import UIKit

class MealDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menuItem: MenuItem?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = menuItem?.name
        setupTableView()
        setupAddReviewButton()
    }

    func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    func setupAddReviewButton() {
        let addReviewButton = UIBarButtonItem(title: "Add Review", style: .plain, target: self, action: #selector(addReview))
        navigationItem.rightBarButtonItem = addReviewButton
    }

    @objc func addReview() {
        let reviewVC = ReviewSubmissionViewController()
        reviewVC.menuItem = menuItem
        navigationController?.pushViewController(reviewVC, animated: true)
    }

    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return menuItem?.reviews.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
       if let review = menuItem?.reviews[indexPath.row] {
           cell.textLabel?.text = "Rating: \(review.rating)/5"
           cell.detailTextLabel?.text = review.text
       }
       return cell
    }
}
