//
//  TableView.swift
//  VisionOsTestApp
//
//  Created by Philip Daquin on 5/8/2024.
//

import SwiftUI
import XCAFootballDataClient



struct TableView: View {
    
    var competition: Competition
    let viewModel = TableListObservable()
    
    var body: some View {
        Table(of: TeamStandingTable.self) {
            
            TableColumn("Club Name") { team in
                HStack {
                    Text(team.positionText).fontWeight(.bold)
                        .frame(minWidth: 20)
                    
                    AsyncImage(url: URL(string: team.team.crest ?? "")) { phase in
                        switch phase {
                        case .success(let img):
                            img.resizable()
                            
                        default:
                            Circle()
                                .foregroundStyle(Color.gray.opacity(0.5))
                        }
                    }.frame(width: 40, height: 40)
                
                }
            }.width(min: 264)
            
            TableColumn("W") {
                Text($0.wonText)
                    .frame(minWidth: 40)
                   
            }.width(40)
            TableColumn("D") {
                Text($0.drawText)
                    .frame(minWidth: 40)
                    
            }.width(40)
            TableColumn("L:") {
                Text($0.lostText)
                    .frame(minWidth: 40)
                   
            } .width(40)
            TableColumn("GF") {
                Text($0.goalsForText)
                    .frame(minWidth: 40)
                    
            }.width(40)
            TableColumn("GA") {
                Text($0.goalsAgainstText)
                    .frame(minWidth: 40)
                    
            }.width(40)
            TableColumn("GD") {
                Text($0.goalDifferenceText)
                    .frame(minWidth: 40)
                    
            }.width(40)
            TableColumn("PTS") {
                Text($0.pointsText)
                    .frame(minWidth: 40)
                    
            }.width(40)
       
        } rows: {
            ForEach(viewModel.standings ?? []) {
                TableRow($0)
            }
        }
            .navigationTitle(competition.name)
            .task {
                await viewModel.fetchLists(competition)
            }
    }
}

#Preview {
    NavigationStack {
        TableView(competition: .defaultCompetitions[0])
        

    }
    
}
