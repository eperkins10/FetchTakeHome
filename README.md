# FetchTakeHome
This is the take home assessment for an iOS Engineer position at Fetch Rewards!
Assessment guidelines: https://fetch-hiring.s3.amazonaws.com/iOS+coding+exercise.pdf

## Description
The **FetchTakeHome** project is an app that fetches a list of desserts from an API endpoint, and displays them in a list. Once a dessert is tapped, the user is navigated to a detail view, where they can find the image, name, category, and ingredients/measurements that are needed in order to successfully recreate the recipe. 
The app runs on the latest version of Xcode.

## The app is best enjoyed in dark mode!

# Architecture
Here's a diagram to show the architecture used in the **FetchTakeHome** project
![image](https://github.com/user-attachments/assets/44f2e8de-a8d0-4ddf-b973-610f4d5200f4)

The **FetchTakeHome** project utilizes MVVM in parity with SwiftUI for the Views.

The Model-View-ViewModel (MVVM) pattern is essential for structuring iOS apps in Swift, making code clean, easy to manage, and scalable. It separates the app into three parts: the View for the user interface, the Model for the data, and the ViewModel for the logic that connects them.

The **FetchTakeHome** project also utlizes another component that's added to the MVVM pattern, which is a NetworkManager. This stores the origin of the network calls, and takes a lot of the code out of the ViewModel making it easier to read and implement. It also makes it possible to assign decoded data to existing models, which is cruicial for MVVM. 

# Networking
All network calls in the app were made using Async/Await, one of the main components used to maintain Concurrency. 

The app also filters out any null or empty values that come from the JSON response, which was a requirement listed in the instructions.

# Screenshots

## DessertsView
![simulator_screenshot_01933F2B-18C6-485C-A8B2-8F5D437FF822](https://github.com/user-attachments/assets/ad995547-afce-4217-a788-8d52ef41a47b)

## DessertsDetailView
![simulator_screenshot_2A191766-D2DB-4365-AB06-B1FA21F39409](https://github.com/user-attachments/assets/1df1b317-8d5e-48d6-8646-63beb04da200)

![simulator_screenshot_F2527876-E34B-4C83-AE3D-E6CF5F65AA58](https://github.com/user-attachments/assets/c4e2b113-041b-4d0b-b59a-71f679974ce2)
