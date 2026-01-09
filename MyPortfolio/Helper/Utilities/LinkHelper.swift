//
//  LinkHelper.swift
//  MyPortfolio
//
//  Created by Radhika on 29/12/25.
//

import UIKit

enum LinkType {
    case website(String)
    case email(String)
    case phone(String)
    case linkedin(String)
}

enum LinkOpener {

    static func open(_ type: LinkType) {
        guard let url = buildURL(from: type),
              UIApplication.shared.canOpenURL(url)
        else {
            print("❌ Invalid or unsupported URL")
            return
        }

        UIApplication.shared.open(url)
    }

    // MARK: - Private helpers
    private static func buildURL(from type: LinkType) -> URL? {
        switch type {

        case .website(let urlString):
            return normalizedURL(urlString)

        case .email(let email):
            return URL(string: "mailto:\(email)")

        case .phone(let number):
            let cleaned = number.filter { $0.isNumber || $0 == "+" }
            return URL(string: "tel:\(cleaned)")

        case .linkedin(let username):
            // Opens LinkedIn app if installed, else browser
            let appURL = URL(string: "linkedin://in/\(username)")
            let webURL = URL(string: "https://www.linkedin.com/in/\(username)")

            if let appURL, UIApplication.shared.canOpenURL(appURL) {
                return appURL
            }
            return webURL
        }
    }

    private static func normalizedURL(_ string: String) -> URL? {
        if string.lowercased().hasPrefix("http") {
            return URL(string: string)
        } else {
            return URL(string: "https://\(string)")
        }
    }
}

