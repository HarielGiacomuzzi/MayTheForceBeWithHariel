//
//  DetailViewController.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 11/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var viewModel: DetailViewModel?

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var massLabel: UILabel!
    @IBOutlet var hairColorLabel: UILabel!
    @IBOutlet var skinColorLabel: UILabel!
    @IBOutlet var eyeColorLabel: UILabel!
    @IBOutlet var birthYearLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    @IBAction func didTapFavoriteButton(_ sender: Any) {
        self.viewModel?.favoritePerson()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let model = self.viewModel else { return }
        self.configure(viewModel: model)
    }

    func configure(viewModel: DetailViewModel) {

        self.nameLabel.text = viewModel.people.name
        self.heightLabel.text = viewModel.people.height
        self.massLabel.text = viewModel.people.mass
        self.hairColorLabel.text = viewModel.people.hairColor
        self.skinColorLabel.text = viewModel.people.skinColor
        self.eyeColorLabel.text = viewModel.people.eyeColor
        self.birthYearLabel.text = viewModel.people.birthYear
        self.genderLabel.text = viewModel.people.gender
        viewModel.delegate = self
    }
}

extension DetailViewController: DetaivViewModelDelegate {

    func didFavoritedPerson(success: Bool) {
        let message = success ? "Success" : "Failed"
        var alert = UIAlertController(
            title: "Favorite \(self.viewModel?.people.name ?? "")",
            message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))

        self.present(alert, animated: true, completion: nil)
    }
}
