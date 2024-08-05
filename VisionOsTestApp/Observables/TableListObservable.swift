//
//  TableListObservable.swift
//  VisionOsTestApp
//
//  Created by Philip Daquin on 5/8/2024.
//

import Foundation
import Observation
import XCAFootballDataClient

class TableListObservable: ObservableObject {

    let client = FootballDataClient(apiKey: "")
    
    var fetchState = FetchState<[TeamStandingTable]>.INITIAL
    var standings: [TeamStandingTable]? { fetchState.value }
    
    func fetchLists(_ competition: Competition) async {
//        self.fetchState = .INPROGRESS
//        
//        do {
//            
//            let standings = try await client.fetchStandings(competitionId: competition.id)
//            
//            if Task.isCancelled {
//                return
//            }
//            
//            self.fetchState = .SUCCESS(standings)
//            
//        } catch {
//            if Task.isCancelled {
//                return
//            }
//            print(error)
//            self.fetchState = .FAILURE(error)
//        }
        
        self.fetchState = .SUCCESS(TeamStandingTable.stubs)
    }
    
     
}

extension TeamStandingTable {
    static var stubs: [TeamStandingTable] {
        let url = Bundle.main.url(forResource: "standings", withExtension: "json")!
        
        let standings: StandingResponse = Utils.loadStub(url: url)
        return standings.standings!.first { $0.type == "TOTAL"}!.table
    }
}
