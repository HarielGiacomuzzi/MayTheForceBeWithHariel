//
//  PeopleProvider.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation
import Alamofire

protocol PeopleProviderProtocol {

    func fetchPeople(page: Int, completion: @escaping (Data) -> Void)
    func favoritePerson(person: People, completion: @escaping (_ result: Bool) -> Void)
}

class PeopleProvider: PeopleProviderProtocol {

    func favoritePerson(person: People, completion: @escaping (Bool) -> Void) {

        let parameters: [String: Any] = [
            "name": person.name,
            "height": person.height,
            "mass": person.mass,
            "hairColor": person.hairColor,
            "skinColor": person.skinColor,
            "eyeColor": person.eyeColor,
            "birthYear": person.birthYear,
            "gender": person.gender,
            "homeworld": person.homeworld,
            "films": person.films,
            "species": person.species,
            "vehicles": person.vehicles,
            "starships": person.starships,
            "created": person.created,
            "edited": person.edited,
            "url": person.url
        ]

        Alamofire.request(WebHook.Production,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default).response { response in
                            if response.response?.statusCode == 200 {
                                completion(true)
                            } else {
                                completion(false)
                            }
        }
    }

    func fetchPeople(page: Int = 1, completion: @escaping (Data) -> Void) {
        Alamofire.request("\(Server.Production)\(Routes.People)\(page)").responseData { response in
            debugPrint("All Response Info: \(response)")

            switch response.result {
            case .success(let response):
                completion(response)
            case .failure(let error):
                debugPrint("There's a error while fetching data. Details: \(error.localizedDescription)")
                    completion(Data())
            }
        }
    }
}
