//
//  PeopleService.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

protocol PeopleServiceProtocol {

    func getPeople(page: Int, completion: @escaping ([People]) -> Void)
}

class PeopleService: PeopleServiceProtocol {
    private var allPersons: [People]?
    private var personData: Data?
    private var provider: PeopleProviderProtocol?

    init(provider: PeopleProviderProtocol = PeopleProvider()) {
        fetchPersonData()
    }

    func getPeople(page: Int, completion: @escaping ([People]) -> Void) {
        if let data = personData {
            let decodedPersons = try? JSONDecoder().decode([People].self, from: data)
            completion(decodedPersons ?? [])
        } else {
            completion([])
        }
    }

    private func fetchPersonData() {
        guard let provider = self.provider else {
            debugPrint("People Service Provider Empty !")
            return
        }
        provider.fetchPeople { (data) in
            self.personData = data
        }
    }
}
