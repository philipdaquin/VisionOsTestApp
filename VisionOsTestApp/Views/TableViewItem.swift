//
//  TableViewItem.swift
//  VisionOsTestApp
//
//  Created by Philip Daquin on 5/8/2024.
//

import SwiftUI
import XCAFootballDataClient

struct TableViewItem: View {
    
    @State
    var selectedCompetition: Competition?
    
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) {
                Text($0.name)
            }
            .navigationTitle("XCA Standings")
        } detail: {
            if let selectedCompetition {
                TableView(competition: selectedCompetition).id(selectedCompetition)
            } else {
                Text("Select a Competition")
            }
        }
    }
}

#Preview {
    TableViewItem()
}
