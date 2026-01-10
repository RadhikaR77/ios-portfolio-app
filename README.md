# 📱 MyPortfolio – Interactive iOS App

**MyPortfolio** is a SwiftUI iOS application built to showcase real-world engineering skills, including:
- MVVM architecture
- Local persistence with Core Data
- Dynamic user flows and state
- PDF generation and digital signature capture
- Repository-based data access and unit testing

This project highlights my ability to design and implement clean, scalable, and maintainable mobile applications using modern iOS technologies.


---

## ✨ Overview

The app allows users to:
- Explore profile and portfolio-related content
- Provide structured feedback
- Review and sign a generated feedback document
- Experience intelligent, non-intrusive user interaction flows

> Note: All data shown in the app is sample data. Backend integration is intentionally left for future enhancement.

---

## 📸 Screenshots

### Home / Profile Screen
![Home Screen](screenshots/home_profile.png)

---

### Tab Navigation
![Tab Navigation](screenshots/tab_navigation.png)

---

### First-Time Contact Prompt
The app intelligently asks for contact details only when the user first meaningfully interacts with the app.

![First Contact Prompt](screenshots/contact_prompt_first_time.png)

---

### Feedback Questionnaire
Users can submit structured feedback through a guided questionnaire.

![Feedback Questions](screenshots/feedback_questions.png)

---

### Contact Prompt on Feedback Submission
If contact details were skipped initially, the app prompts the user again before final feedback submission.

![Contact Prompt on Feedback](screenshots/contact_prompt_on_feedback.png)

---

### Feedback PDF Preview
Submitted feedback is compiled into a PDF document that the user can review.

![Feedback PDF](screenshots/feedback_pdf_preview.png)

---

### Digital Signature
Users can add a digital signature before completing feedback submission.

![Digital Signature](screenshots/digital_signature.png)

---

## 🧠 Key UX Decisions

- Contact details are requested only when necessary
- Users can skip contact input without blocking app usage
- Validation is contextual and non-intrusive
- Feedback flow ensures meaningful data collection without harming user experience

---

## 🏗️ Architecture

- SwiftUI
- MVVM Architecture
- Repository Pattern
- Core Data for local persistence
- Feature-based modular structure

---

## 🧪 Testing

- Repository-level unit tests included
- Focus on data correctness and business logic
- UI test scaffolding present

---

## 🚀 Future Enhancements

- Backend integration
- Authentication
- Cloud storage
- Android version using Jetpack Compose

---

## 🛠️ Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9+

---

## 📂 Project Structure
MyPortfolio/
├── App
├── CoreData
├── Features
│   ├── Feedback
│   │   ├── Views
│   │   ├── ViewModels
│   │   └── Helpers
│   └── Profile
├── Shared
├── Resources
├── Tests
└── README.md

