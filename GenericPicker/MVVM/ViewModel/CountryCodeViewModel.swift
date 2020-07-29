//
//  CountryCodeViewModel.swift
//  GenericPicker
//
//  Created by Adar Tzeiri on 22/07/2020.
//  Copyright © 2020 Adar Tzeiri. All rights reserved.
//

import Foundation

class CountryCodeViewModel {
    //DataModel Type
    typealias GenericPickerDataModel = CountryCodesModel
    
    //Service Method
    private var service: Service = MockService()
    
    //Observable
    var selectedItem : DynamicValue<String> = DynamicValue<String>("")
    var items : DynamicValue<[GenericRow<GenericPickerDataModel>]> = DynamicValue<[GenericRow<GenericPickerDataModel>]>([GenericRow<GenericPickerDataModel>]())
    
    //Property Observer
    var item: Any? {
        didSet{
            guard let item = item as? GenericRow<GenericPickerDataModel> else { return }
            selectedItem.value = item.title
        }
    }
    
    
    init(service: Service) {
        self.service = service
        fetchCountryCodes()
    }
    
    private func fetchCountryCodes() {
        service.fetchCountryCodes { [weak self] (result) in
            switch result {
            case .failure( _):
                break
            case .success(let models):
                for model in models {
                    if  let dialCode = model.dial_code,
                        let name = model.name {
                        let title = dialCode + " " + name
                        self?.items.value.append(GenericRow<GenericPickerDataModel>(type: model, title: title))
                    }
                }
            }
        }
    }
}

