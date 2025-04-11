# PokéAPI Flutter App

A sample Flutter application that integrates with the [PokéAPI](https://pokeapi.co/) to demonstrate API usage, UI rendering, navigation, and state management using BLoC.

## 📱 Features

### 🏠 Home Page
- Displays a list of Pokémon with **name** and **image**.
- Toggle between **List View** and **Grid View**.
- Implements **pagination** to load more Pokémon as the user scrolls.

### 🔍 Details Page
- Tapping on a Pokémon opens a detail screen showing:
  - Name
  - Image
  - Abilities
  - Types
  - Base Experience
  - Other additional details

## 🛠️ Tech Stack

| Feature         | Tech Used        |
|----------------|------------------|
| State Management | BLoC (`flutter_bloc`) |
| API Calls        | http (`http`)     |
| UI              | Flutter Widgets |
| Null Safety     | ✅ Enabled       |
| Responsive UI   | ✅ Supported     |

## 📷 Screenshots

| Home (List View) | Home (Grid View) | Details Page |
|------------------|------------------|--------------|
| ![List View](screenshots/list_view.png) | ![Grid View](screenshots/grid_view.png) | ![Detail View](screenshots/detail_view.png) |
