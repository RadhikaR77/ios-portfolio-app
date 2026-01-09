//
//  PDFPreviewView.swift
//  MyPortfolio
//
//  Created by Radhika on 31/12/25.
//

import SwiftUI
import PDFKit

struct PDFPreviewView: View {

    let pdfURL: URL
    @Environment(\.dismiss) private var dismiss

    @State private var showSignaturePad = false
    @State private var signatureImage: UIImage?
    @State private var signaturePosition: CGPoint = CGPoint(x: 150, y: 500)
    @Binding var signedPDFURL: URL?

    var body: some View {
        ZStack {
            PDFKitView(url: pdfURL)

            if let signatureImage {
                SignatureOverlayView(
                    image: signatureImage,
                    position: $signaturePosition
                )
            }
        }
        .navigationTitle("Review PDF")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Signature") {
                    showSignaturePad = true
                }
            }
            if signatureImage != nil {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Save") {
                        saveSignedPDF()
                    }
                }
            }
            
        }
        .sheet(isPresented: $showSignaturePad) {
            SignaturePadView { image in
                self.signatureImage = image
            }
        }
    }
    
    private func saveSignedPDF() {
        guard
            let document = PDFDocument(url: pdfURL),
            let page = document.page(at: 0),
            let signatureImage
        else { return }

        let pageBounds = page.bounds(for: .mediaBox)

        let renderer = UIGraphicsPDFRenderer(bounds: pageBounds)

        let signedPDFData = renderer.pdfData { context in
            context.beginPage()

            let cgContext = context.cgContext

            // 🔁 FIX: Flip context for PDFKit
            cgContext.saveGState()
            cgContext.translateBy(x: 0, y: pageBounds.height)
            cgContext.scaleBy(x: 1, y: -1)

            // Draw original PDF page correctly
            page.draw(with: .mediaBox, to: cgContext)

            cgContext.restoreGState()

            // 🖊️ Draw signature (UIKit coordinates)
            let pdfX = signaturePosition.x
            let pdfY = pageBounds.height - signaturePosition.y

            let signatureRect = CGRect(
                x: pdfX,
                y: pdfY,
                width: 150,
                height: 60
            )

            signatureImage.draw(in: signatureRect)
        }

        let signedURL = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0].appendingPathComponent("SignedFeedback.pdf")

        do {
            try signedPDFData.write(to: signedURL)
            signedPDFURL = signedURL
            dismiss()
            print("✅ Signed PDF saved correctly")
        } catch {
            print("❌ Failed to save PDF:", error)
        }
    }



    private func drawSignature(
        document: PDFDocument,
        page: PDFPage,
        image: UIImage,
        rect: CGRect
    ) {
        let pageBounds = page.bounds(for: .mediaBox)

        let renderer = UIGraphicsPDFRenderer(bounds: pageBounds)

        let newPDFData = renderer.pdfData { context in
            context.beginPage()

            // Draw original PDF
            page.draw(with: .mediaBox, to: context.cgContext)

            // Draw signature
            image.draw(in: rect)
        }

        let outputURL = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0].appendingPathComponent("SignedFeedback.pdf")

        do {
            try newPDFData.write(to: outputURL)
            print("✅ Signed PDF saved at:", outputURL)
        } catch {
            print("❌ Failed to save PDF:", error)
        }
    }

}



