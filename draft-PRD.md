# Project Overview

A simple and beginner-friendly iOS app for creating, managing, and studying flashcards. The app allows users to add flashcards with questions and answers, flip them for active recall, and review them anytime. It features a clean design, smooth animations, and light/dark mode support. All data is stored locally using UserDefaults, making it lightweight and perfect for personal use.

# Core Functionalities

- Add a flashcard with a question and answer
- Flip the flashcard for active recall
- Review the flashcard anytime
- Light/dark mode support
- All data is stored locally using UserDefaults
- Quiz Mode:
  - Multiple-choice quizzes based on the flashcards.
  - Text input answers for active recall.


# File Structure

MyFlashcardApp/
│
├── MyFlashcardApp.xcodeproj            # Xcode project file
├── MyFlashcardAppApp.swift              # App entry point (App lifecycle)
│
├── Models/                              # 📚 Data models
│   └── Flashcard.swift                   # Flashcard data model (front/back text)
│
├── Views/                               # 🎨 User interface screens
│   └── ContentView.swift                 # Main view displaying flashcards
│   └── FlashcardView.swift               # Single flashcard view with flip animation
│   └── AddFlashcardView.swift            # View to add a new flashcard
│   └── EditFlashcardView.swift           # View to edit an existing flashcard (optional)
│
├── ViewModels/                          # 🧠 Business logic and data handling
│   └── FlashcardStore.swift              # Handles loading/saving flashcards (UserDefaults)
│
├── Resources/                           # 🎨 App resources (images, colors, etc.)
│   └── Assets.xcassets                   # App icons, colors, and other assets
│   └── LaunchScreen.storyboard           # Launch screen (if needed)
│
├── Documentation/                       # 📄 Project documentation
│   └── README.md                         # Project overview and setup instructions
│   └── PROJECT_STRUCTURE.md              # Explanation of folder/file structure
│   └── DATA.md                           # Data storage explanation
│   └── UI_NOTES.md                       # UI/UX design decisions
│   └── TODO.md                           # List of future improvements
│
├── Tests/                                # ✅ Unit and UI tests
│   └── MyFlashcardAppTests.swift          # Unit tests for data and view logic
│   └── MyFlashcardAppUITests.swift        # UI tests for user interface interactions
│
└── Info.plist                            # App configuration file

# Additional Requirements

- Use SwiftUI for the UI
- Use UserDefaults for data storage
- Use the latest SwiftUI syntax and features