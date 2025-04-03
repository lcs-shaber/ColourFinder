//
//  CreateColoureView.swift
//  ColourFinder
//
//  Created by Sophie Haber on 03.04.25.
//

import SwiftUI

struct CreateColoureView: View {
    
    //MARK: Stored properties
    @State var currenHue = 0.0
    
    //MARK: Computed properties
    var body: some View {
        VStack {
            
            Slider(value: $currenHue, in: 0...360.0)
            Rectangle()
                .fill(
                    Color(
                        hue: currenHue/360.0,
                        saturation: 100.0/100.0,
                        brightness: 100.0/100.0
                    )
                )
                .frame(width: 100, height: 100)
                
        }
        .padding()
    }
}

#Preview {
    CreateColoureView()
        .frame(width: 400, height: 400)
}
