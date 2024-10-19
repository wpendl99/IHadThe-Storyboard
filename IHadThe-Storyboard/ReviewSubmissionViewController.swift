//
//  ReviewSubmissionViewController.swift
//  IHadThe
//
//  Created by William Pendleton on 10/19/24.
//

import UIKit

class ReviewSubmissionViewController: UIViewController {

    var menuItem: MenuItem?

    let ratingSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["1", "2", "3", "4", "5"])
        sc.selectedSegmentIndex = 4
        return sc
    }()

    let reviewTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Write your review..."
        tf.borderStyle = .roundedRect
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Review"
        view.backgroundColor = .white
        setupViews()
    }

    func setupViews() {
        view.addSubview(ratingSegmentedControl)
        view.addSubview(reviewTextField)
        // Set frames or use AutoLayout for positioning
        ratingSegmentedControl.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 30)
        reviewTextField.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 40)

        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit Review", for: .normal)
        submitButton.frame = CGRect(x: 20, y: 210, width: view.frame.width - 40, height: 50)
        submitButton.addTarget(self, action: #selector(submitReview), for: .touchUpInside)
        view.addSubview(submitButton)
    }

    @objc func submitReview() {
        guard let rating = Int(ratingSegmentedControl.titleForSegment(at: ratingSegmentedControl.selectedSegmentIndex) ?? "5"),
              let text = reviewTextField.text,
              !text.isEmpty else {
            // Show an alert to fill in all fields
            return
        }

        let newReview = Review(rating: rating, text: text)
        menuItem?.reviews.append(newReview)
        navigationController?.popViewController(animated: true)
    }
}
