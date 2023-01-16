//
//  ViewModel.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import Foundation
import Combine
import CoreData

class ViewModel: ObservableObject {
    
    private var dataController: DataController
    private var cancellables = Set<AnyCancellable>()
    
    @Published var data = [University]()
    
    init(dataController: DataController) {
        self.dataController = dataController
        if dataController.isUniversityEmpty() {
            getUniversityList()
        }
    }
    
    func getUniversityList() {
        ServiceManager.shared.sessionManager.request(Router.search(country: "India"))
            .publishDecodable(type: [StructUniversity].self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (result) in
                print("Response: \(result)")
                if let value = result.value {
                    print("Response: \(value)")
                    DispatchQueue.global().async {
                        for item in value {
                            self?.dataController.saveData(data: item)
                        }
                    }
                } else if let error = result.error {
                    print("Error: \(String(describing: error.errorDescription))")
                }
            }
            .store(in: &cancellables)
    }
    
}
