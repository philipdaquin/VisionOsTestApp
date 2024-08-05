//
//  Utils.swift
//  VisionOsTestApp
//
//  Created by Philip Daquin on 5/8/2024.
//

import Foundation


struct Utils {
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    static func loadStub<D: Decodable>(url: URL) -> D {
        let data = try! Data(contentsOf: url)
        
        do {
            let wdata = try jsonDecoder.decode(D.self, from: data)
            return wdata
        } catch {
            fatalError("Failed to Decode Json Files \(error)")
        }
        
    }
    static let dateYearFormatter: DateFormatter = {
          let df = DateFormatter()
          df.dateFormat = "YYYY"
          return df
      }()
    
    
}

