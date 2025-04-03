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
    
    @State var currentHueB = 0.0
    
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
                    Slider(value: $currentHueA, in: 0...360.0)
                   
                    HStack{
                        
                        Text("Your first Colour:")
                        
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentHueA/360.0,
                                    saturation: 100.0/100.0,
                                    brightness: 100.0/100.0
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
                    Slider(value: $currentHueB, in: 0...360.0)
                   
                    HStack{
                        
                        Text("Your second Colour:")
                        
                        Rectangle()
                            .fill(
                                Color(
                                    hue: currentHueB/360.0,
                                    saturation: 100.0/100.0,
                                    brightness: 100.0/100.0
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
                            hue: currentHueA + currentHueB/360.0,
                            saturation: 100.0/100.0,
                            brightness: 100.0/100.0
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
