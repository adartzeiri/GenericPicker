//
//  Service.swift
//  GenericPicker
//
//  Created by Adar Tzeiri on 22/07/2020.
//  Copyright © 2020 Adar Tzeiri. All rights reserved.
//

import Foundation

protocol Service {
    func fetchCountryCodes(completion: @escaping (Result<[CountryCodesModel], Error>) -> Void)
}
