//
//  File.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 11/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

protocol DetaivViewModelDelegate: class {

    func didFavoritedPerson(success: Bool)
}

class DetailViewModel {
    var people: People!
    weak var delegate: DetaivViewModelDelegate!
    private var service: PeopleServiceProtocol?

    init(people: People,
         service: PeopleServiceProtocol = PeopleService()) {
        self.people = people
        self.service = service
    }

    func favoritePerson() {
        guard let service = self.service,
              let person = self.people else { return }
        service.favoritePerson(person: person) { (success) in
            debugPrint("No specified action at this point")
            guard let delegate = self.delegate else { return }
            delegate.didFavoritedPerson(success: success)
        }
    }
}
