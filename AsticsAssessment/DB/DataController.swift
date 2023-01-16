//
//  DataController.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "UniversityData")
    lazy var universityEntity = {
        return NSEntityDescription.entity(forEntityName: "University", in: self.container.viewContext)
    }
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveData(data: StructUniversity) {
        
        let addNewData = NSManagedObject(entity: universityEntity()!, insertInto: container.viewContext) as? University
        addNewData?.id = UUID()
        addNewData?.name = data.name
        addNewData?.stateProvince = data.stateProvince
        addNewData?.alphaTwoCode = data.alphaTwoCode
        addNewData?.country = data.country
        addNewData?.webPages = data.webPages
        addNewData?.domains = data.domains
        
        do {
            try container.viewContext.save()
        } catch {
            print("Failed to save.!!")
        }
        
    }
    
    func isUniversityEmpty() -> Bool {
        var data: [University] = []
        let fetchRequest=NSFetchRequest<NSFetchRequestResult>(entityName: "University")
        do {
            data = try container.viewContext.fetch (fetchRequest) as! [University]
        } catch{
            print ("Failed")
        }
        return data.isEmpty
    }
    
    func deleteUniversity(data: University) {
        
        container.viewContext.delete(data)
        
        do {
            try container.viewContext.save()
        } catch {
            print ("Failed")
        }
        
    }
    
}
