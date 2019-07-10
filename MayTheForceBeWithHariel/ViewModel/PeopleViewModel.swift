//
//  PeopleViewModel.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

protocol PeopleViewModelDelegate {
    func didFetchPersons(people: [People])
}

class PeopleViewModel {
    var delegate: PeopleViewModelDelegate?
    private var service: PeopleServiceProtocol?
    private var currentPage: Int = 0

    init(service: PeopleServiceProtocol = PeopleService()) {
        self.service = service
    }

    func getNextPage() {
        guard let service = self.service,
              let delegate = self.delegate else { return }
        service.getPeople(page: 0) { (people) in
            self.currentPage += 1
            delegate.didFetchPersons(people: people)
        }
    }
}
