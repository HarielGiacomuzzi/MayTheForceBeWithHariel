//
//  PeopleViewModel.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

protocol PeopleViewModelDelegate {
    func didFetchPersons()
}

class PeopleViewModel {
    var delegate: PeopleViewModelDelegate?
    private var service: PeopleServiceProtocol?
    private var people: [People] = []

    private var currentPage: Int!

    init(delegate: PeopleViewModelDelegate, service: PeopleServiceProtocol = PeopleService()) {
        self.service = service
        self.currentPage = 1
        self.delegate = delegate
    }

    func getNextPage() {
        guard let service = self.service,
              let delegate = self.delegate else { return }
        service.getPeople(page: self.currentPage) { (people) in
            if people.count > 0 {
                self.currentPage += 1
                self.people.append(contentsOf: people)
                delegate.didFetchPersons()
            }
        }
    }

    func getNumberOfRows() -> Int {
        return self.people.count
    }

    func getRowData(for index: Int) -> People {
        return self.people[index]
    }
}
