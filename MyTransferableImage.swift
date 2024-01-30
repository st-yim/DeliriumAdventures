//
//  MyTransferableImage.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI
import PhotosUI

struct MyTransferableImage: Transferable {
    let data: Data

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: .image) { myTransferableImage in
            myTransferableImage.data
        } importing: { data in
            MyTransferableImage(data: data)
        }
    }
}

