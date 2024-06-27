//
//  ContentView.swift
//  State+Binding
//
//  Created by Павел Ершов on 27.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    @State private var isShowingSheet = false
    @State private var isShowingBackgroundColorView = true
    
    var body: some View {
        ZStack {
            Color(isShowingBackgroundColorView ? .orange : .pink).ignoresSafeArea()
            
            VStack {
                TimeofDayImage(imageTitle: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                Button {
                    isShowingSheet = true
                } label: {
                    ButtonLabel(title: "Change Time of Day", imageName: "clock.fill", color: .green)
                }
                .padding(.top, 100)
            }
        }
        .sheet(isPresented: $isShowingSheet, content: {
            ChangeTimeOfDayView(isNight: $isNight, isShowingORANGE: $isShowingBackgroundColorView)
        })
    }
}

struct TimeofDayImage: View {
    var imageTitle: String
    
    var body: some View {
        Image(systemName: imageTitle)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct ButtonLabel: View {
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: imageName)
            .frame(width: 280, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
    }
}

#Preview {
    ContentView()
}
