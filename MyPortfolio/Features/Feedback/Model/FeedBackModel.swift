//
//  FeedBackModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation

enum AnswerValue: Codable, Equatable {
    case rating(Int)
    case text(String)
    case multipleChoice(String)
}

struct FeedbackQuestion: Identifiable, Codable {

    enum QuestionType: String, Codable {
        case rating
        case multipleChoice
        case text
    }

    let id: UUID
    let question: String
    let type: QuestionType
    let options: [String]?
    let isRequired: Bool

    var answer: AnswerValue?
}

extension FeedbackQuestion {

    func answerAsString() -> String? {
        switch answer {
        case .rating(let value):
            return "\(value)"
        case .text(let text):
            return text
        case .multipleChoice(let choice):
            return choice
        case .none:
            return nil
        }
    }
}

func feedbackToJSONString(questions: [FeedbackQuestion]) -> String? {

    let jsonArray: [[String: String]] = questions.compactMap { question in
        guard let answer = question.answerAsString() else { return nil }

        return [
            "question": question.question,
            "answer": answer
        ]
    }

    guard let data = try? JSONSerialization.data(
        withJSONObject: jsonArray,
        options: [.prettyPrinted]
    ) else {
        return nil
    }

    return String(data: data, encoding: .utf8)
}




func loadFeedBackData() -> [FeedbackQuestion] {
    var feedBackData: [FeedbackQuestion] = []
    
    feedBackData.append(FeedbackQuestion(
        id: UUID(),
        question: "How would you rate this portfolio app?",
        type: .rating,
        options: nil,
        isRequired: false
    ))
    feedBackData.append(FeedbackQuestion(
        id: UUID(),
        question: "Did the app clearly represent my iOS skills?",
        type: .multipleChoice,
        options: ["Yes", "Somewhat", "No"],
        isRequired: false
    ))
    feedBackData.append(FeedbackQuestion(
        id: UUID(),
        question: "How did you find the UI/UX?",
        type: .multipleChoice,
        options: ["Excellent", "Good", "Needs Improvement"],
        isRequired: false
    ))
    feedBackData.append(FeedbackQuestion(
        id: UUID(),
        question: "Which aspect stood out the most?",
        type: .text,
        options: nil,
        isRequired: false
    ))
    feedBackData.append(FeedbackQuestion(
        id: UUID(),
        question: "Any suggestions for improvement?",
        type: .text,
        options: nil,
        isRequired: false
    ))
    return feedBackData
}

