//
//  CountryCodesModel.swift
//  GenericPicker
//
//  Created by Adar Tzeiri on 22/07/2020.
//  Copyright © 2020 Adar Tzeiri. All rights reserved.
//

import Foundation

struct CountryCodesModel : Codable {
    let name      : String?
    let dial_code : String?
    let code      : String?

    enum CodingKeys: String, CodingKey {

        case name      = "name"
        case dial_code = "dial_code"
        case code      = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        dial_code = try values.decodeIfPresent(String.self, forKey: .dial_code)
        code = try values.decodeIfPresent(String.self, forKey: .code)
    }

}
