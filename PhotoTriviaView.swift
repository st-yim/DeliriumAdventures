//
//  PhotoTriviaView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI
import PhotosUI

struct PhotoTriviaView: View {
    @State private var images: [UIImage] = []
    @State private var imageMetadata: [[String: Any]] = []  // Array to store metadata for each image
    @State private var photosPickerItems: [PhotosPickerItem] = []
    @State private var selectedImageIndex: Int? = nil
    @State private var dateTimeOriginalList: [String] = [] // Array to store DateTimeOriginal values

    @State private var isPlaying: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                PhotosPicker(selection: $photosPickerItems, maxSelectionCount: 4, selectionBehavior: .ordered) {
                    Label("Select Photo", systemImage: "photo")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color("green"))
//                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
//                        )
                        
                }
                .tint(.accentColor)
                .buttonStyle(.borderedProminent)

                ScrollView(.horizontal) {
                    LazyHStack() {
                        ForEach(0..<images.count, id: \.self) { i in
                            PhotoCardView(images: images[i])
//                                .onTapGesture {
//                                    // Show metadata overlay when tapped
//                                    selectedImageIndex = i
//                                }
//                                .overlay(
//                                    Group {
//                                        if selectedImageIndex == i {
//                                            PhotoMetadataView(metadata: imageMetadata[i])
//                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                                .background(Color.black.opacity(0.5))
//                                                .onTapGesture {
//                                                    // Hide metadata overlay when tapped
//                                                    selectedImageIndex = nil
//                                                }
//                                        }
//                                    }
//                                )
                        }
                    }
                    .padding()
                }
                .frame(width: 300, height: 300)
                 
                .onChange(of: photosPickerItems) { _ in
                    Task {
                        images.removeAll()
                        
                        for item in photosPickerItems {
                            do {
                                // Attempt to load transferable
                                let transferable = try await item.loadTransferable(type: MyTransferableImage.self)

                                // Check if the transferable is of type MyTransferableImage
                                if let myTransferableImage = transferable {
                                    // Extract data from the custom type
                                    let imageData = myTransferableImage.data

                                    // Retrieve metadata using your provided code
                                    if let cgImageSource = CGImageSourceCreateWithData(imageData as CFData, nil),
                                       let properties = CGImageSourceCopyPropertiesAtIndex(cgImageSource, 0, nil) as? [String: Any] {
                                        print("Metadata: \(properties)")
                                        // Append metadata to the array
                                        imageMetadata.append(properties)

                                        // Extract DateTimeOriginal value
                                        if let exifData = properties["{Exif}"] as? [String: Any] {
                                            // Extract DateTimeOriginal value
                                            if let dateTimeOriginal = exifData["DateTimeOriginal"] as? String {
                                                print("DateTimeOriginal: \(dateTimeOriginal)")
                                                dateTimeOriginalList.append(dateTimeOriginal)
                                            }
                                        }
                                    }

                                    // Create UIImage from data
                                    if let image = UIImage(data: imageData) {
                                        images.append(image)
                                    }
                                }
                            } catch {
                                print("Error loading transferable: \(error)")
                            }
                        }
                    }
                }

                // Display or use the extracted DateTimeOriginal values
                if !dateTimeOriginalList.isEmpty {
                    //NavigationLink(destination: PhotoPlayView(isPlaying: $isPlaying)) {
//                        GameButtonView(title: "Let's Play", color: Color("green"), width: 200, height: 50, action: {
//                            isPlaying.toggle()
//                        })
                        NavigationLink(destination: PhotoPlayView(isPlaying: $isPlaying)) {
                            Text("Let's Play")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: CGFloat(200), height: CGFloat(50)) // Set the width and height
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("green"))
                                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                                )
                        }
                    
                }
            }
        }
    }
}

