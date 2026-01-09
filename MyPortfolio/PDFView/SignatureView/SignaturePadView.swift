//
//  SignaturePadView.swift
//  MyPortfolio
//
//  Created by Radhika on 31/12/25.
//
import SwiftUI
import PencilKit

struct SignaturePadView: View {

    var onSave: (UIImage) -> Void
    @Environment(\.dismiss) private var dismiss

    @State private var canvasView = PKCanvasView()

    var body: some View {
        VStack {
            Text("Draw your signature")
                .font(.headline)
                .padding()

            CanvasView(canvasView: $canvasView)
                .background(Color.white)
                .border(Color.gray)

            HStack {
                Button("Clear") {
                    canvasView.drawing = PKDrawing()
                }

                Spacer()

                Button("Save") {
                    let image = canvasView.drawing.image(
                        from: canvasView.bounds,
                        scale: UIScreen.main.scale
                    )
                    onSave(image)
                    dismiss()
                }
            }
            .padding()
        }
        .padding()
    }
}

