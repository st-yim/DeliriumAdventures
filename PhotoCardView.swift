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
        Image(uiImage: images.resizedToWidth(200))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 5)
        
    }
}

extension UIImage {
    func resizedToWidth(_ width: CGFloat) -> UIImage {
        let scale = width / self.size.width
        let newHeight = self.size.height * scale
        let newSize = CGSize(width: width, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}
