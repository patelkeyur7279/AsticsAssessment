//
//  AsticsAssessmentApp.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import SwiftUI

@main
struct AsticsAssessmentApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel(dataController: dataController))
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
