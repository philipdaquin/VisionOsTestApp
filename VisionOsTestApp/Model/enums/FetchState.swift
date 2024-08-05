//
//  FetchState.swift
//  VisionOsTestApp
//
//  Created by Philip Daquin on 5/8/2024.
//

import Foundation


enum FetchState<T> {
    case INITIAL
    case INPROGRESS
    case SUCCESS(T)
    case FAILURE(Error)
    
    var value: T? {
        if case .SUCCESS(let t) = self {
            return t
        }
        return nil
        
    }
    
    var error: Error? {
        if case .FAILURE(let error) = self {
            return error
        }
        return nil
    }
    
}
