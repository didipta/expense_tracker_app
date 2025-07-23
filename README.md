# expense_tracker_app

expense tracker app.

## Getting Started

# 🚀 Flutter Advanced App

A robust, scalable, and production-ready Flutter application built with clean architecture, domain-driven design (DDD), and modern engineering practices. This project includes full support for localization, crash reporting, analytics, offline-first capability, REST API integration, unit testing, and security.

---

## 🧩 Features

✅ **Localization**  
Multi-language support powered by `flutter_localizations`, enabling seamless user experience across different regions.

✅ **Crashlytics**  
Integrated with Firebase Crashlytics to monitor, detect, and report real-time app crashes and errors.

✅ **Analytics**  
Integrated analytics (e.g., Firebase Analytics) to track user behavior, screen transitions, and event logs for business insights.

✅ **Security**  
- Secure data storage using `flutter_secure_storage`  
- API request security and token management  
- Obfuscation support for release builds

✅ **Unit Testing**  
Testable architecture using `mocktail`. Covers:
- Use cases

✅ **Clean Architecture**  
Layered architecture with `data`, `domain`, and `presentation` layers for high maintainability and testability.

✅ **DDD (Domain-Driven Design)**  
Follows DDD principles with value objects, aggregates, use cases, and repositories abstracted properly.

✅ **Pixel-Perfect UI**  
Responsive design using `flutter_screenutil`, `custom themes`, and consistent design system ensuring pixel-perfect implementation based on design specs.

✅ **REST API Integration**  
Consuming RESTful APIs using `Dio` with:
- Interceptors
- Token handling
- Error management

✅ **Offline-First**  
Built with local caching using `sqflite` to ensure data persistence even without an internet connection.

---

## 📁 Project Structure

bash
lib/
├── core/                   # Constants, themes, services, errors, interceptors
├── features/
│   └── <feature_name>/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/                 # Shared widgets & utilities
└── main.dart

<img width="1919" height="1036" alt="image" src="https://github.com/user-attachments/assets/abdea0cf-4657-43e0-a52e-50ae77e9ec42" />
<img width="1919" height="1036" alt="image" src="https://github.com/user-attachments/assets/b6564b1c-a4ed-4e6d-bded-36b7252fbe93" />
<img width="1914" height="1037" alt="image" src="https://github.com/user-attachments/assets/81967bea-3467-4e6c-9a2e-f4c229e6469d" />



