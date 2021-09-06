# PASCO Shipping

A PASCO Shipping project created in flutter . PASCO supports both Android and IOS, clone the appropriate branches mentioned below:

* For IOS: https://github.com/yes-soft-de/pasco-shipping/tree/dev-client/flutter_boilerplate/ios
* For Android: https://github.com/yes-soft-de/pasco-shipping/tree/dev-client/flutter_boilerplate

## Getting Started

This project is a starting point for a Flutter application.

## Requirements

* Android Studio 4.2+ 
* Android sdk
* Flutter sdk 2.2 ~ 2.3

(If your flutter sdk is above 2.3 you may need to migrate the project to your preference by following this link (https://flutter.dev/docs/development/androidx-migration)

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
git clone --single-branch --branch dev-client https://github.com/yes-soft-de/pasco-shipping.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## PASCO Shipping Features:

* Splash
* Login
* Home
* User Profile
* Request new shipment
* User shipmentes
* Track User Shipments
* Code Generation
* Dependency Injection


### Up-Coming Features:

* Multilingual Support
* User Notifications
* Chat

### Libraries & Tools Used

* https://pub.dev/packages


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

## Conclusion

I will be happy to answer any questions that you may have on this project 🙂
