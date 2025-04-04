//
//  CreateColoureView.swift
//  ColourFinder
//
//  Created by Sophie Haber on 03.04.25.
//

import SwiftUI

struct CreateColoureView: View {
    
    //MARK: Stored properties
    
    //properties for the sliders for colour A
    @State var currentHueA = 0.0
    @State var currentSaturationA = 100.0
    @State var currentBrightnessA = 100.0
    
    //properties for the sliders for colour B
    @State var currentHueB = 180.0
    @State var currentSaturationB = 100.0
    @State var currentBrightnessB = 100.0
    
    //properties for the mixed colour
//    @State var mixedHue:
//    @State var mixedSaturation:
//    @State var mixedBrightness:
    
    
    //the list of new colours
    @State var newColours: [Colour] = []
    
    //MARK: Computed properties
    var body: some View {
        
        VStack {
            
             Text("Choose your Colour:")
                 .bold()
                 .font(.title3)
                 .padding()
             
             Spacer()
            
           //Colours to mix
            HStack {
                
                //Colour 1:
                VStack {
              
                    //Slider to choose the colour (hue)
                    Text("Choose your Hue:")
                    Slider(value: $currentHueA, in: 0...180.0)
                    
                    Slider(value: $currentSaturationA, in: 0...100.0)
                   
                    Slider(value: $currentBrightnessA, in: 0...100.0)
                    
                    HStack{
                        
                        Text("Your first Colour:")
                        
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentHueA/360.0,
                                    saturation: currentSaturationA/100.0,
                                    brightness: currentBrightnessA/100.0
                                )
                            )
                            .frame(width: 100, height: 100)
                    }
                  
                        
                }
                .padding()
                
                Text("+")
                .font(.largeTitle)
                .bold()
                .padding()
                
                //Colour 2:
                VStack {
                  
                    //Slider to chose the colour (hue)
                    Text("Choose your Hue:")
                    Slider(value: $currentHueB, in: 180.0...360.0)
                    
                    Slider(value: $currentSaturationB, in: 0...100.0)
                   
                    Slider(value: $currentBrightnessB, in: 0.0...100.0)
                    
                    HStack{
                        
                        Text("Your second Colour:")
                        
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentHueB/360.0,
                                    saturation: currentSaturationB/100.0,
                                    brightness: currentBrightnessB/100.0
                                )
                            )
                            .frame(width: 100, height: 100)
                    }
                  
                        
                }
                .padding()
            }
            
            Text("=")
            .font(.largeTitle)
            .bold()
            .padding()
            
            //Colour 3 (the mix of the two colours you chose):
            HStack {
                
                Text("Here is your mixed colour:")
               
                Rectangle()
                    .fill(
                        Color(
                            hue: (currentHueA + currentHueB)/360.0,
                            saturation: (currentSaturationA + currentSaturationB)/100.0,
                            brightness: (currentBrightnessA + currentBrightnessB)/100.0
                        )
                    )
                    .frame(width: 100, height: 100)
                
                //Button to save the colour
                Button {
                    saveColour()
                } label: {
                        Text("Save Colour")
                    }
                
                
            }
            .padding()
           

        }
    }
    
    //MARK: Functions
    func saveColour() {
        
        //Save the new colour
        newColours.insert(
            Colour(
                firstHue: currentHueA,
                firstSaturation: currentSaturationA,
                firstBrightness: currentBrightnessA,
                secondHue: currentHueB,
                secondSaturation: currentSaturationB,
                secondBrightness: currentBrightnessB,
                mixedHue: currentHueA + currentHueB,
                mixedSaturation: currentSaturationA + currentSaturationB,
                mixedBrightness: currentBrightnessA + currentBrightnessB
            ),
            at: 0
        )
        //DEBUG: What is in the array now?
        print(newColours)
    }
    
}

#Preview {
    CreateColoureView()
       
}
