//
//  ThirdView.swift
//  State+Binding
//
//  Created by Павел Ершов on 27.06.2024.
//

import SwiftUI

struct ThirdView: View {
    
    @State var isShowingFourthView = false
    @State var isChangingText2 = true
    @Binding var changeTheText: Bool
    
    var body: some View {
        VStack {
            Text(isChangingText2 ? "Hello" : "Hello BLYAT")
        }
        .onTapGesture {
            isShowingFourthView = true
        }
        .sheet(isPresented: $isShowingFourthView, content: {
            FourthView(isChangingText2: .constant(true))
        })
    }
}

#Preview {
    ThirdView(changeTheText: .constant(true))
}
