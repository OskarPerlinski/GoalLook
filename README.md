# 👕 GoalLook

## 📌 Application Description  
GoalLook is a modern mobile application built with Flutter that allows users to browse and add football jerseys from various leagues to their shopping bag. The app supports user authentication, registration, and password recovery via Firebase. It offers a user-friendly interface with logical navigation paths, including categorization by leagues and product types.

---

## ✨ Key Features

### 🔐 Authentication & Onboarding  
- Splash screen with automatic navigation based on user login status  
- Registration via email  
- Login via email and Google Sign-In  
- Password recovery supported through Firebase Authentication  

### 🏠 Home Screen  
- Categories such as "Newest Jerseys" and "Most Popular"  
- League-based filtering: Bundesliga, Serie A, Ligue 1, La Liga  

### 📂 Jersey Browsing  
- Detailed product pages with photos and descriptions  
- "Add to Bag" button to add jerseys to the shopping cart  

### 🛍️ Shopping Bag (Cart Page)  
- List of added jerseys  
- Ability to remove items from the bag  
- "Buy Now" button (currently inactive)  

### 🚀 Splash Screen Logic  
- If previously logged in, users are navigated directly to the Home Screen  
- Otherwise, redirected to the login or registration selection page  

---

## 🛠 Technologies  
- **Frontend:** Flutter  
- **Backend & Authentication:** Firebase (Authentication, Firestore)  
- **Routing:** GoRouter  
- **State Management:** flutter_bloc + flutter_hooks  
- **Dependency Injection:** injectable + get_it  
- **Code Generation:** freezed, json_serializable  

---

## 🧱 Technical Stack (pubspec.yaml excerpt)

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_bloc: ^8.0.1
  flutter_hooks: ^0.18.0
  injectable: ^2.5.0
  get_it: ^8.0.3
  go_router: ^15.1.2
  firebase_core: ^3.13.0
  freezed_annotation: ^3.0.0
  json_annotation: ^4.9.0
  firebase_auth: ^5.5.3
  cloud_firestore: ^5.6.7
  google_sign_in: ^6.3.0
  flutter_svg: ^2.1.0
  hooked_bloc: ^1.4.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  go_router_builder: ^2.9.0
  injectable_generator: ^2.7.0
  build_runner: ^2.4.15
  freezed: ^3.0.6
  json_serializable: ^6.9.5


---


📸 App Screenshots
![Screenshot_1747943770](https://github.com/user-attachments/assets/a5659553-6d9a-4998-8b05-9c93b09704e5)
![Screenshot_1747943774](https://github.com/user-attachments/assets/e2bc0027-72a6-4ac4-8603-9d5341c101e3)
![Screenshot_1747943785](https://github.com/user-attachments/assets/6c5d6b82-917c-44cb-a8da-e7bb29aac5ea)
![Screenshot_1747943788](https://github.com/user-attachments/assets/6c34dbf4-ff6e-4407-9614-8c01e3c4de65)
![Screenshot_1747943794](https://github.com/user-attachments/assets/69d91e1a-4e11-43cb-aede-e704dd6390fa)
![Screenshot_1747943935](https://github.com/user-attachments/assets/81d24635-231e-4a3d-84b4-19538ab96446)
![Screenshot_1747943942](https://github.com/user-attachments/assets/3c47fa1b-6ce3-433a-9c48-04378f267376)
![Screenshot_1747943951](https://github.com/user-attachments/assets/1ef0a3c3-23b2-46cc-a98a-3cc4877ca4eb)
![Screenshot_1747943979](https://github.com/user-attachments/assets/639f8ae0-97eb-4882-a2cc-0f89382b25a9)
![Screenshot_1747943996](https://github.com/user-attachments/assets/c54aea4f-3fcb-421f-91a7-d198cb04eca4)
![Screenshot_1747944031](https://github.com/user-attachments/assets/b840796a-749a-4336-9214-72631045d38c)
