//
//  PhotoCardView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI
import PhotosUI

struct PhotoCardView: View {
    
    let images: UIImage
    let padding: CGFloat = 10
    
    var body: some View {
        Image(uiImage: images)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 5)
        
    }
}

