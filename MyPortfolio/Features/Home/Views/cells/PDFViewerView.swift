//
//  PDFViewerView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//
import SwiftUI
import PDFKit

struct PDFViewerView: View {
    @State var pdfFileName: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            if let pdfURL = Bundle.main.url(forResource: pdfFileName, withExtension: "pdf"),
            let pdfDocument = PDFDocument(url: pdfURL){
                PDFKitRepresentedView(pdfDocument: pdfDocument)
                    .edgesIgnoringSafeArea(.all)
                    .navigationTitle(pdfFileName)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                sharePDF(pdfURL)
                            } label: {
                                Label ("Download", systemImage: "arrow.triangle.down")
                            }
                        }
                    }
            } else {
                Text("PDF not found")
            }
        }
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    let pdfDocument : PDFDocument
    
    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage
        pdfView.displayDirection = .vertical
        return pdfView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.setNeedsDisplay()
    }
}

private func sharePDF(_ pdfURL: URL) {
    let activity = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)
    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let rootVC = scene.windows.first?.rootViewController{
        DispatchQueue.main.async {
            rootVC.present(activity, animated: true)
        }
        
    }
        
    
    
}

