<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/HugoFranc/Crypto-Calculator">

  </a>

  <h1 align="center"> Crypto Currency App </h1>

  <p align="center">
    Personal Project
    <br />
    <br />
    <a href="https://github.com/HugoFranc/Crypto-Calculator/issues">Report Bug or Request Feature</a>
  </p>
</p>

Cryptocurrency calculator mobile application for iOS and Android using the Flutter

Integrates the coinlayer API to deliver accurate and up-to-date information on a variety of currencies, including current prices and also implemented a feature enabling users to perform conversions between any two currencies of their choice.


## Getting Started

This app uses the [coinlayer Api](https://coinlayer.com/) in where you can get your free public API key

Create a `.env` file and inside input the following

```
  ACCESS_KEY = 'YOUR_API_KEY'
``` 

## You should now be able to run the app without a problem.



Running App

```
flutter run lib/main.dart
```


## Demo

<img src="https://user-images.githubusercontent.com/55465856/214483785-543c0cd8-1d9d-4165-ae4a-571b8b55da16.png" width="400"> <img src="https://user-images.githubusercontent.com/55465856/214483884-4162b2b9-5a54-4b2e-8322-74eb7ebd631b.png" width="398">

## Dependencies


Used to format time: `intl`
\
Used for a custom Bottom Navigation Bar: `google_nav_bar`

Used to incorporate some features of Bloc
```
  - flutter_bloc
  - equatable
  - hydrated_bloc  
```
Used to get main fonts for the app
  `google_fonts`

## Upcoming Features

1. Implement Bloc for state managment 
2. Implement Functional themes (Dark/Light)
3. Implement Settings screen
4. Implement Live screen


