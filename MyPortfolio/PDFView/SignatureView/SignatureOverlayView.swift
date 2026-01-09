//
//  SignatureOverlayView.swift
//  MyPortfolio
//
//  Created by Radhika on 31/12/25.
//

import SwiftUI

struct SignatureOverlayView: View {

    let image: UIImage
    @Binding var position: CGPoint

    @State private var dragOffset: CGSize = .zero

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.location
                    }
            )
    }
}


