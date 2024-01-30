//
//  MainPageView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/27/24.
//

import SwiftUI

struct MainPageView: View {
    @State private var isZoomed = false

    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(
                            gradient: Gradient(colors: [Color.purple, Color("universal")]),
                            center: .center,
                            startRadius: 0,
                            endRadius: 300
                        )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {

                    // Text above the image
                    Text("Ready?")
                        .font(.system(size: isZoomed ? 20 : 55, weight: .heavy))
                        .foregroundColor(.white.opacity(0.8))

                    
                    // Image with constant zoom animation and navigation
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                        Image("brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isZoomed ? 95 : 70, height: isZoomed ? 95 : 70)
                            .onAppear {
                                // Start a timer to toggle the isZoomed state every second
                                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                                    withAnimation {
                                        isZoomed.toggle()
                                    }
                                }
                            }
                    }
                    
                    // Text below the image
                    Text("Press the brain to start!").underline()
                        .font(.system(size: isZoomed ? 30 : 20, weight: .heavy))
                        .foregroundColor(.white.opacity(0.8))

                }
                .padding(.top, -70)
                .navigationTitle("Delirium Adventures")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            //Image(systemName: "house.fill")
                            Text("Delirium Adventures")
                                .font(.largeTitle)
                                .fontWeight(.black)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainPageView()
}
