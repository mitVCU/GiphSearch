# README for iOS Giphy Search App

## Overview
Welcome to the iOS Giphy Search App! This application is a fun and interactive way to search and view GIFs from the Giphy API. It is developed using UIKit and follows the Model-View-ViewModel (MVVM) architecture for a clean, maintainable, and scalable codebase. We also utilize the SDWebImage SDK for efficient decoding, caching, and displaying of GIFs.

## Features
- **Giphy API Integration**: Search the entire Giphy database for your favorite GIFs.
- **Efficient Image Handling**: Utilize SDWebImage for smooth loading and caching of GIF images.
- **MVVM Architecture**: Clear separation of concerns, which makes the codebase more maintainable and testable.
- **Responsive UI**: Built with UIKit, offering a responsive and intuitive user interface.

## Getting Started
### Soft Prerequisites (not actually needed, just what I tested on, it will probably work on older versions)
- Xcode 15 or later
- iOS 17.0 or later
- Swift 5

### Installation
1. **Unzip the project**: 
2. **Install Dependencies**: This project uses Swift Package Manager so Xcode should install the needed dependency for you.
3. **API Key**: There is already an API key in the info.plist by the key "Api Key", but feel free to update it or hardcode a new one in GifEndpoint.swift
4. **Build and Run**: Open the `.xcodeproj` file in Xcode and run the project on your simulator or device.

## Architecture
This app follows the MVVM architecture:

- **Model**: Represents the data of the app. It's responsible for fetching, and managing data from the Giphy API.
- **View**: UI components that present data to the user and handle user interactions.
- **ViewModel**: Serves as a middleman between the Model and View. It receives input from the View, processes (or gets it processed by the Model) the data, and sends it back to the View.

## Libraries
- **SDWebImage**: Used for downloading, caching, and displaying images from URLs.

## Usage
1. **Search for GIFs**: Use the search bar to find GIFs.
2. **View GIFs**: GIFs are displayed in a list format.
3. **Caching**: Images are automatically cached but not persisted, for faster reloading.


## Links
* [SDWebImage](https://github.com/SDWebImage/SDWebImage)
