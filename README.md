# 🧭 iNiLabs GitHub Explorer (Flutter Developer Task)

A Flutter project built following **Clean Architecture** and **GetX pattern**, demonstrating:

- GitHub REST API integration
- Light/Dark theme switching
- Grid/List view toggle
- Sorting & filtering repositories
- Error handling and clean state management
- Clean and scalable code architecture

---

## 🚀 Features

### ✅ GitHub User Search
- Fetches user info from:  
  `https://api.github.com/users/{username}`
- Displays user profile details on the home screen.

### ✅ Repository Listing
- Fetches repositories using:  
  `https://api.github.com/users/{username}/repos`
- Supports **List view** and **Grid view** toggle.
- Includes **search**, **sort**, and **filter** options (by name, date, stars, etc.).

### ✅ Repository Details
- Tap on a repository to view its details such as description, language, stars, forks, and last updated time.
- Includes a **"View on GitHub"** button that redirects to the repository page.

### ✅ Theming
- Supports **Light** ☀️ and **Dark** 🌙 themes.
- Theme state is preserved throughout navigation.

### ✅ Error Handling
- Gracefully handles API errors and empty states.
- Shows user-friendly messages and retry options.

---

## 🧱 Architecture

Organized into **Clean Architecture layers** for maintainability and scalability:

