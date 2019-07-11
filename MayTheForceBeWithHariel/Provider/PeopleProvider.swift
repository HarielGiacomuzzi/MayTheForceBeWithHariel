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
}

class PeopleProvider: PeopleProviderProtocol {

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
