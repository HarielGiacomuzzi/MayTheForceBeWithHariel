//
//  ViewController.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    private var viewModel: PeopleViewModel!
    @IBOutlet var tableView: UITableView!

    private enum K {
        static let personCell = "personCell"
        static let storyBoardName = "Main"
        static let detailViewName = "detailView"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PeopleViewModel(delegate: self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.getNextPage()
    }
}

extension PeopleViewController: PeopleViewModelDelegate {

    func didFetchPersons() {
        self.tableView.reloadData()
    }
}

extension PeopleViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.personCell) as? PersonTableViewCell
        cell?.configure(people: self.viewModel.getRowData(for: indexPath.row))
        return cell ?? UITableViewCell()
    }
}

extension PeopleViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.getNumberOfRows() - 1 {
            self.viewModel.getNextPage()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personData = self.viewModel.getRowData(for: indexPath.row)
        let detailModel = DetailViewModel(people: personData)

        let detail = UIStoryboard.init(name: K.storyBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: K.detailViewName) as? DetailViewController
        detail?.viewModel = detailModel

        guard let detailView = detail else { return }
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
