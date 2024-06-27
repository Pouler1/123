//
//  fifthView.swift
//  State+Binding
//
//  Created by Павел Ершов on 27.06.2024.
//

import SwiftUI

struct FourthView: View {
    
    @Binding var isChangingText2: Bool
    @Environment(\.presentationMode) var presentationMode
    @State var changeTheText = true
    
    var body: some View {
        VStack {
            Text("Fourth View")
        } .onTapGesture {
            isChangingText2 = true
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    FourthView(isChangingText2: .constant(true))
}
