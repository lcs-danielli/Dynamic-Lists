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
    
    @State var priorResult: [Result] = []
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
                    Text("\(a.formatted(.number.precision(.fractionLength(1))))")
                    Spacer()
                    Text("\(b.formatted(.number.precision(.fractionLength(1))))")
                    Spacer()
                    Text("\(c.formatted(.number.precision(.fractionLength(1))))")
                    Spacer()
                }  .font(Font.custom("Times New Roman",
                                     size: 24.0,
                                     relativeTo: .body))
                
                HStack{
                    Slider(value: $a, in: 1...10, step: 1)
                        .padding(.horizontal)
                    Slider(value: $b, in: 1...10, step: 1)
                        .padding(.horizontal)
                    Slider(value: $c, in: 1...10, step: 1)
                        .padding(.horizontal)
                }
                
                Text("\(result)")
                    .font(Font.custom("Times New Roman",
                                       size: 24.0,
                                       relativeTo: .body))
                Button(action: {
                    let latestResult = Result(a:a, b:b, c:c, roots:result)
                    priorResult.append(latestResult)
                }, label: {
                    Text("Save Result")
                })
                .buttonStyle(.bordered)
                .padding()
                
                Spacer()
                
                VStack{
                    HStack{
                        Text("History")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                }
                List(priorResult.reversed()) {
                    currentResult in
                    HStack{
                        Spacer()
                        ResultView(somePriorResult: currentResult)
                        Spacer()
                    }
                }
                
                
                Spacer()
            }.navigationTitle("Find the Roots")
    
        }
        .padding()
    }
}

#Preview {
    RootsCalculatorView()
}
