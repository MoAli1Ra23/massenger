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
   ```
### Usage
### Authentication

- On app launch, users can sign up or log in using their email and password.
- Authentication status is managed using Firebase Authentication.
### Chat Functionality
- Users can send and receive messages in real-time.
- Messages are stored in Firestore, and UI updates are handled using Riverpod.
### Contributing
- Contributions are welcome! Please follow these steps to contribute:
1. ***Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
4. Create a pull request.
## License
This project is licensed under the MIT License. See the [title]LICENSE file for details.


