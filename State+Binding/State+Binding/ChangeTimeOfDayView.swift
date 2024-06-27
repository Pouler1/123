//
//  ChfngeTimeOfDayView.swift
//  State+Binding
//
//  Created by Павел Ершов on 27.06.2024.
//

import SwiftUI

struct ChangeTimeOfDayView: View {
    
    @Binding var isNight: Bool
    @Binding var isShowingORANGE : Bool
    @Environment(\.presentationMode) var presentationMode
    @State var isShowThirdView = false
    @State var changeTheText = true
    
    var body: some View {
        VStack {
            Button {
                isNight = true
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Night", imageName: "moon.stars.fill", color: .black)
            }
            
            Button {
                isNight = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Day", imageName: "cloud.sun.fill", color: .blue)
            }
        }
        .padding(.bottom, 100)
        
        VStack {
            Button {
                isShowingORANGE = true
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Change Backgound Color\nON ORANGE")
                    .font(.title)
                    .frame(width: 340, height: 80)
                    .foregroundStyle(.link)
                    .background(Color.orange)
                    .cornerRadius(20)
            }
            Button {
                isShowingORANGE = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Change Backgound Color\nON PINK")
                    .font(.title)
                    .frame(width: 340, height: 80)
                    .foregroundStyle(.link)
                    .background(Color.pink)
                    .cornerRadius(20)
            }
        } .padding(.bottom, 50)
        VStack {
            Button {
                isShowThirdView = true
            } label: {
                Text("Open Next View")
                    .font(.title)
                    .frame(width: 340, height: 80)
                    .foregroundStyle(.white)
                    .background(Color.black)
                    .cornerRadius(20)
            }
        }
        .sheet(isPresented: $isShowThirdView, content: {
            ThirdView( changeTheText: $changeTheText)
        })
    }
}

#Preview {
    ChangeTimeOfDayView(isNight: .constant(false), isShowingORANGE: .constant(false))
}
