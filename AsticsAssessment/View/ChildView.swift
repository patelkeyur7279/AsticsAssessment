//
//  ChildView.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 17/01/23.
//

import SwiftUI

struct ChildView: View {
    
    @State var data: University
    @State private var isExpanded: Bool = false
    
    var body: some View {
        
        Button {
            withAnimation {
                self.isExpanded.toggle()
            }
        } label: {
            VStack(alignment: .leading) {
                
                HStack {
                    Text(data.name ?? "-")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .fixedSize(horizontal: false, vertical: true)
                
                
                if self.isExpanded {
                
                    Divider()
                    
                    VStack(alignment: .leading,spacing: 8) {
                        
                        Text("Location: \(data.stateProvince ?? ""), \(data.alphaTwoCode ?? "-")")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        if let webPages = data.webPages {
                            ForEach(webPages, id: \.self) { webPage in
                                Text("Website: \(webPage)")
                                    .font(.caption2)
                            }
                        }
                        
                    }
                    
                }
                
            }
        }
        
    }
}
