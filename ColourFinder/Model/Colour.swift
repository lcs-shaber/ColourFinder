//
//  Color.swift
//  ColourFinder
//
//  Created by Sophie Haber on 04.04.25.
//

import Foundation

struct Colour: Identifiable {
    
    let id = UUID()
    
    //the first colour the user inputed
    let firstHue: Double
    let firstSaturation: Double
    let firstBrightness: Double
    
    //the second colour the user inputed
    let secondHue: Double
    let secondSaturation: Double
    let secondBrightness: Double
    
    //the colour they got out
    let mixedHue: Double
    let mixedSaturation: Double
    let mixedBrightness: Double
    
    //Whether the colour is dark or bright
    let outcome: Outcome
    
}
