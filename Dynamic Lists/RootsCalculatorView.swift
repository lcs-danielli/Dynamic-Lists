//
//  ContentView.swift
//  Dynamic Lists
//
//  Created by 李泽宇 on 2025-01-14.
//

import SwiftUI

struct RootsCalculatorView: View {
    
    @State var a: Double = 0.0
    @State var b: Double = 0.0
    @State var c: Double = 0.0
    var result: String{
        
        let discriminant = b * b - 4 * a * c
        
        if discriminant < 0{
            return "No real roots"
        } else {
            let x1 = ( b * -1 - discriminant.squareRoot() ) / (2 * a)
            let x2 = ( b * -1 - discriminant.squareRoot() ) / (2 * a)
            
            return "x \(x1.formatted(.number.precision(.fractionLength(2)))) and x ≈ \(x2.formatted(.number.precision(.fractionLength(2))))"
        }
    }
    var body: some View {
        NavigationStack{
            VStack {
                Image("公式")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                
                Image("式子")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50)
                
                HStack{
                    Spacer()
                    Text("a: 1.0")
                    Spacer()
                    Text("b: -6.0")
                    Spacer()
                    Text("c: 8.0")
                    Spacer()
                }  .font(Font.custom("Times New Roman",
                                     size: 24.0,
                                     relativeTo: .body))
                
                HStack{
                    Slider(value: $a, in: 1...100, step: 1)
                        .padding(.horizontal)
                    Slider(value: $b, in: 1...100, step: 1)
                        .padding(.horizontal)
                    Slider(value: $c, in: 1...100, step: 1)
                        .padding(.horizontal)
                }
                
                Text("x ≈ 2.00 and x ≈ 4.00")
                    .font(Font.custom("Times New Roman",
                                       size: 24.0,
                                       relativeTo: .body))
                
                Spacer()
            }.navigationTitle("Find the Roots")
            // A value that will be stored as a Double
            let someValue = 3.14159
             
            // Create a string with this value rounded to one decimal place
            let someFormattedValue = someValue.formatted(.number.precision(.fractionLength(1)))
             
            // someFormattedValue will contain 3.1
        }
        .padding()
    }
}

#Preview {
    RootsCalculatorView()
}
