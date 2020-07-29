//
//  MockService.swift
//  GenericPicker
//
//  Created by Adar Tzeiri on 22/07/2020.
//  Copyright © 2020 Adar Tzeiri. All rights reserved.
//

import Foundation

class MockService: Service {
    func fetchCountryCodes(completion: @escaping (Result<[CountryCodesModel], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "MockService", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data    = try Data(contentsOf: url)
            let results = try JSONDecoder().decode([CountryCodesModel].self, from: data)
            completion(.success(results))
        } catch let error {
            print(error)
        }
    }
}
