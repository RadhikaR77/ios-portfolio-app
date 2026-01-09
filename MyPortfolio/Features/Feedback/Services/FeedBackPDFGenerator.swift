//
//  FeedBackPDFGenerator.swift
//  MyPortfolio
//
//  Created by Radhika on 31/12/25.
//

import UIKit

final class FeedBackPDFGenerator {

    static func generatePDF(from questions: [FeedbackQuestion]) throws -> URL {

            let pageWidth: CGFloat = 595    // A4 width (points)
            let pageHeight: CGFloat = 842   // A4 height (points)
            let margin: CGFloat = 40

            let renderer = UIGraphicsPDFRenderer(
                bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
            )

            let url = FileManager.default.temporaryDirectory
                .appendingPathComponent("Feedback.pdf")

            try renderer.writePDF(to: url) { context in
                context.beginPage()

                var cursorY: CGFloat = margin

                // Title
                cursorY += drawTitle(
                    "Quick Feedback Report",
                    at: cursorY,
                    pageWidth: pageWidth,
                    margin: margin
                )

                cursorY += 20

                // Questions & Answers
                for item in questions {
                    cursorY += drawQuestionBlock(
                        item,
                        at: cursorY,
                        pageWidth: pageWidth,
                        pageHeight: pageHeight,
                        margin: margin,
                        context: context
                    )
                }
            }

            return url
        }
}

extension FeedBackPDFGenerator {

    private static func drawTitle(
        _ text: String,
        at y: CGFloat,
        pageWidth: CGFloat,
        margin: CGFloat
    ) -> CGFloat {

        let font = UIFont.boldSystemFont(ofSize: 24)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]

        let attributed = NSAttributedString(string: text, attributes: attributes)

        let rect = CGRect(
            x: margin,
            y: y,
            width: pageWidth - margin * 2,
            height: .greatestFiniteMagnitude
        )

        attributed.draw(in: rect)

        return font.lineHeight
    }
    static func drawSubTitle(_ text: String, y: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 12)
        return drawText(text, font: font, y: y)
    }

    static func drawText(_ text: String, font: UIFont, y: CGFloat) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]

        let textRect = CGRect(x: 40, y: y, width: 515, height: .greatestFiniteMagnitude)
        let boundingRect = text.boundingRect(
            with: textRect.size,
            options: .usesLineFragmentOrigin,
            attributes: attributes,
            context: nil
        )

        text.draw(in: boundingRect, withAttributes: attributes)
        return boundingRect.maxY
    }
}

extension FeedBackPDFGenerator {

    private static func drawQuestionBlock(
        _ question: FeedbackQuestion,
        at y: CGFloat,
        pageWidth: CGFloat,
        pageHeight: CGFloat,
        margin: CGFloat,
        context: UIGraphicsPDFRendererContext
    ) -> CGFloat {

        var cursorY = y

        let questionFont = UIFont.boldSystemFont(ofSize: 14)
        let answerFont = UIFont.systemFont(ofSize: 13)

        // Question
        let questionText = question.question
        let questionHeight = drawText(
            questionText,
            font: questionFont,
            at: cursorY,
            pageWidth: pageWidth,
            margin: margin
        )

        cursorY += questionHeight + 6

        // Answer
        let answerText = formattedAnswer(question.answer)
        let answerHeight = drawText(
            answerText,
            font: answerFont,
            at: cursorY,
            pageWidth: pageWidth,
            margin: margin
        )

        cursorY += answerHeight + 16

        // Page break check
        if cursorY > pageHeight - margin {
            context.beginPage()
            cursorY = margin
        }

        return cursorY - y
    }
}

extension FeedBackPDFGenerator {
    private static func drawText(
        _ text: String,
        font: UIFont,
        at y: CGFloat,
        pageWidth: CGFloat,
        margin: CGFloat
    ) -> CGFloat {

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]

        let attributed = NSAttributedString(string: text, attributes: attributes)

        let rect = CGRect(
            x: margin,
            y: y,
            width: pageWidth - margin * 2,
            height: .greatestFiniteMagnitude
        )

        let calculatedRect = attributed.boundingRect(
            with: rect.size,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )

        attributed.draw(in: rect)

        return ceil(calculatedRect.height)
    }


    private static func formattedAnswer(_ answer: AnswerValue?) -> String {
        guard let answer else {
            return "Answer: Not provided"
        }

        switch answer {
        case .rating(let value):
            return "Answer: Rating \(value)/5"
        case .text(let text):
            return "Answer: \(text)"
        case .multipleChoice(let option):
            return "Answer: \(option)"
        }
    }


    static func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}







