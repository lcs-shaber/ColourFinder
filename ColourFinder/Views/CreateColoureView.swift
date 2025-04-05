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
    @State var currentHueB = 0.0
    @State var currentSaturationB = 100.0
    @State var currentBrightnessB = 100.0
    
    //the list of new colours
    @State var newColours: [Colour] = []
    
    // what was the outcome of the mixed colour
    @State var currentOutcome: Outcome = .undetermind
    
    // Keep track of what the user selected from the picker for filtering
    @State var selectedOutcomeFilter: Outcome = .undetermind // everything
    
    //MARK: Computed properties
    var body: some View {
        
        HStack{
            //Left side
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
                        Slider(value: $currentHueA, in: 0...360.0)
                        
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
                        Slider(value: $currentHueB, in: 0.0...360.0)
                        
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
                    
                    //Button to check wether the colour is light or dark
                    Button {
                        filterColour()
                    } label: {
                        Text("Check whether the colour is a light or dark colour")
                    }
                    
                    
                }
                .padding()
               

            }
            
            //Right side
            VStack{
                
                //Picker to select or filter through the colours, to select what you want to show
                Picker("Filtering colours for", selection: $selectedOutcomeFilter) {
                    //options for the user to pick from
                    Text("All colours").tag(Outcome.undetermind)
                    Text("Only dark colours").tag(Outcome.dark)
                    Text("Only light colours").tag(Outcome.light)
                } .padding()
                
                //List of created colours
                List(
                    //the list iterated over the filtered list
                    filtering(originalList: newColours, on: selectedOutcomeFilter)
                    
                ) { currentColour in
                    
                    HStack {
                        //first rectangle of colour on display
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentColour.firstHue,
                                    saturation: currentColour.firstSaturation,
                                    brightness: currentColour.firstBrightness
                                )
                            )
                            .frame(width: 50, height: 50)
                        
                        
                        Text("+")
                       
                        //second rectangle of colour on display
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentColour.secondHue,
                                    saturation: currentColour.secondSaturation,
                                    brightness: currentColour.secondBrightness
                                )
                            )
                            .frame(width: 50, height: 50)
                        
                        
                        Text("=")
                        
                        //third rectangle of colour on display (the mixed colour)
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentColour.mixedHue,
                                    saturation: currentColour.mixedSaturation,
                                    brightness: currentColour.mixedBrightness
                                )
                            )
                            .frame(width: 50, height: 50)
                        
                        Spacer()
                        
                        //shows if the colour is dark or light
                        Text(currentColour.outcome.rawValue)
                        
                    }
                }
            }
            
        }

  
    }
    
    //MARK: Functions
    //function to save the colour
    func saveColour() {
        
        //Save the new colour
        newColours.insert(
            Colour(
                //first colour
                firstHue: currentHueA/360.0,
                firstSaturation: currentSaturationA/100.0,
                firstBrightness: currentBrightnessA/100.0,
                
                //second colour
                secondHue: currentHueB/360.0,
                secondSaturation: currentSaturationB/100.0,
                secondBrightness: currentBrightnessB/100.0,
                
                //mixed colour
                mixedHue: (currentHueA + currentHueB)/360.0,
                mixedSaturation: (currentSaturationA + currentSaturationB)/100.0,
                mixedBrightness: (currentBrightnessA + currentBrightnessB)/100.0,
                
                outcome: currentOutcome
            ),
            at: 0
        )
        //DEBUG: What is in the array now?
        print(newColours)
    }
    
    //function to determine whether the colour is light or dark
    func filterColour() {
        
        if (currentHueA + currentHueB)/360.0 < 0.5 {
            
            currentOutcome = .light
            print("light colour")
            
        } else {
            
            currentOutcome = .dark
            print("dark colour")
        }
    }
    
    
}

#Preview {
    CreateColoureView()
       
}
