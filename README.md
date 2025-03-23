# 📰 SwiftUI News App

A modern SwiftUI application that fetches and displays top headlines using a free News API. The app demonstrates best practices for network handling, API key security, and dynamic data loading through pagination.

---

## 🚀 Features

- ✅ **API Interceptor with Authorization Token**  
  All network requests are automatically appended with a bearer token using a custom `NetworkInterceptor` powered by Alamofire.

- 📄 **Paginated News List**  
  News articles are fetched page-by-page. A "Load More News" button enables the user to fetch and view additional pages dynamically.

- 🔐 **Secure API Key Storage**  
  API keys are securely stored using **Keychain Services** and optionally fallback to a **Secrets.plist** file or environment variable. No hardcoded keys are present in the source code.

---

## 🛠 Architecture

- **MVVM** pattern with `NewsViewModel` managing state and network logic.
- **SwiftUI** for UI components and list rendering.
- **Alamofire** for networking and request interception.
- **Keychain Services** and optional `.plist` for secure key storage.

---

## 🔧 Setup & Usage

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/swiftui-news-app.git

---

## 📚 Technologies Used

- **SwiftUI**
- **Combine**
- **Alamofire**
- **Keychain Services**


