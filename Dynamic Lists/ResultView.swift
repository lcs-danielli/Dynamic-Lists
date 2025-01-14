//
//  ResultView.swift
//  Dynamic Lists
//
//  Created by 李泽宇 on 2025-01-14.
//

import SwiftUI

struct ResultView: View {
    
    let somePriorResult: Result

    var body: some View {
        VStack(spacing:10) {
            
            HStack(spacing: 30) {
                Text("a:\(somePriorResult.a.formatted(.number.precision(.fractionLength(1))))")
                    .font(Font.custom("Times New Roman", size: 20.0, relativeTo: .body))
                Text("b:\(somePriorResult.b.formatted(.number.precision(.fractionLength(1))))")
                    .font(Font.custom("Times New Roman", size: 20.0, relativeTo: .body))
                Text("c:\(somePriorResult.c.formatted(.number.precision(.fractionLength(1))))")
                    .font(Font.custom("Times New Roman", size: 20.0, relativeTo: .body))
            }
            
            Text(somePriorResult.roots)
                .font(Font.custom("Times New Roman", size: 20.0, relativeTo: .body))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
    }
}

#Preview {
    ResultView(somePriorResult: resultForPreviews)
}
