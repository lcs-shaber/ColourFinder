//
//  CreateColoureView.swift
//  ColourFinder
//
//  Created by Sophie Haber on 03.04.25.
//

import SwiftUI

struct CreateColoureView: View {
    
    //MARK: Stored properties
    @State var currentHueA = 0.0
    @State var currentSaturationA = 100.0
    @State var currentBrightnessA = 100.0
    
    @State var currentHueB = 180.0
    @State var currentSaturationB = 100.0
    @State var currentBrightnessB = 100.0
    
    //MARK: Computed properties
    var body: some View {
        
        VStack {
            
             Text("Choose your Colour:")
                 .bold()
                 .font(.title3)
                 .padding()
             
             Spacer()
            
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
            
            
            HStack {
                
                //Colour 3 (the mix of the two colours you chose):
                Rectangle()
                    .fill(
                        Color(
                            hue: (currentHueA + currentHueB)/360.0,
                            saturation: (currentSaturationA + currentSaturationB)/100.0,
                            brightness: (currentBrightnessA + currentBrightnessB)/100.0
                        )
                    )
                    .frame(width: 100, height: 100)
                
            }
            .padding()
           

        }
    }
}

#Preview {
    CreateColoureView()
       
}
