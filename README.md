# messenger

A **Flutter-based chat application** following **Clean Architecture**, using **Riverpod** for state management and **Firebase** as the backend. This app allows users to sign in and chat in real time, offering a clean and efficient architecture for maintainable and scalable development.

## Features

- User authentication (login/signup)
- Real-time chat functionality
- Clean Architecture pattern
- State management with Riverpod
- Firebase Firestore for message storage
- Responsive and easy-to-navigate UI

## Getting Started

### Prerequisites

Before you start, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (v2.0.0 or higher)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- A Google Firebase project (with Firestore enabled)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/chat-app.git
2. **Navigate to the project directory:**
    ```bash
   cd chat-app
 3. **Install dependencies:**
     Run the following command to install all necessary Flutter packages:
     ```bash
       flutter pub get

4. **Configure Firebase:**

 

- Create a Firebase project in the Firebase Console.
- Enable Firebase Authentication (Email/Password).
- Create a Firestore database.
- Download the `google-services.json` file for Android or `GoogleService-Info.plist` for iOS and place them in the appropriate directories:
- android/app for `google-services.json`
- ios/Runner for `GoogleService-Info.plist`
5- **Run the app:**

Once everything is set up, run the app with
   ```bash
    flutter run

  
