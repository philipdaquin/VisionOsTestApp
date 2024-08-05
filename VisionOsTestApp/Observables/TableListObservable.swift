//
//  TableListObservable.swift
//  VisionOsTestApp
//
//  Created by Philip Daquin on 5/8/2024.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class TableListObservable {

    let client = FootballDataClient(apiKey: "")
    
    var fetchState = FetchState<[TeamStandingTable]>.INITIAL
    var standings: [TeamStandingTable]? { fetchState.value }
    
    
    var selectedFilter: FilterOption = .latest
    var filterOptions : [FilterOption] = {
        var currentDate = Calendar.current.date(byAdding: .year, value: -4, to: Date())!
        
        var options = [FilterOption]()
        for i in 0..<3 {
            if let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: currentDate) {
                options.append(.year(Calendar.current.component(.year, from: nextYear)))
                currentDate = nextYear
            }
        }
        options.append(.latest)
        return options
    }()
    
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
