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
    func favoritePerson(person: People, completion: @escaping (Bool) -> Void)
}

class PeopleService: PeopleServiceProtocol {
    private var allPersons: [People]?
    private var personData: Data?
    private var provider: PeopleProviderProtocol?

    init(provider: PeopleProviderProtocol = PeopleProvider()) {
        self.provider = provider
    }

    func getPeople(page: Int, completion: @escaping ([People]) -> Void) {
        self.provider?.fetchPeople(page: page) { data in
            if let decodedPersons = try? JSONDecoder().decode(PeopleServerResponse.self, from: data) {
                completion(decodedPersons.results)
            }
            completion([])
        }
    }

    func favoritePerson(person: People, completion: @escaping (Bool) -> Void) {
        self.provider?.favoritePerson(person: person, completion: completion)
    }
}
