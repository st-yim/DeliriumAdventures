//
//  PhotoMetadataView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI

struct PhotoMetadataView: View {
    let metadata: [String: Any]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(metadata.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                MetadataRowView(key: key, value: value)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
