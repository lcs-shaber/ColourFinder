//
//  Filter.swift
//  ColourFinder
//
//  Created by Sophie Haber on 05.04.25.
//

import Foundation

// Inputs (paramaters)
//      - the original list
//      - what outcome the user wants included
//          i.e.: undetermined (all results), light, dark
//
// Output:
//      - the filtered list
func filtering(
    originalList: [Colour],
    on desiredOutcome: Outcome
) -> [Colour] {
    
    // When the desired outcome is indertemined, just stop
    // and return the entire original list
    if desiredOutcome == .undetermind {
        return originalList
    }
    
    // Create an empty list to populate before returning
    var filteredColours: [Colour] = [] // empty
    
    // Iterate over the entire array
    for  result in originalList {
        
        // copy any results that match the desired outcome into the new list
        if  result.outcome == desiredOutcome {
            filteredColours.append(result)
        }
        
    }
    
    // Return only the filtered list
    return filteredColours
}
