//
//  MetadataRowView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI

struct MetadataRowView: View {
    let key: String
    let value: Any

    var body: some View {
        HStack {
            Text("\(key):")
            Spacer()
            metadataValueView
        }
        .padding(.horizontal)
    }

    private var metadataValueView: some View {
        switch value {
        case let stringValue as String:
            return Text(stringValue)
        case let intValue as Int:
            return Text("\(intValue)")
        case let floatValue as Float:
            return Text("\(floatValue)")
        // Add more cases for other types if needed
        default:
            return Text(String(describing: value))
        }
    }
}
