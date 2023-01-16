//
//  ContentView.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var data: FetchedResults<University>
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        List(data) { item in
            //Text(item.name ?? "Unknown")
            ChildView(data: item)
                .swipeActions {
                    Button(role: .destructive, action: {
                        deleteUnniversity(data: item)
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
        }
    }
    
    func deleteUnniversity(data: University) {
        managedObjectContext.delete(data)
        try? managedObjectContext.save()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(dataController: DataController()))
    }
}
