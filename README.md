# Mercury iOS App 📱 

This package contains the code to create a mobile application for iOS which allows users to login in the Mercury Smart Store and check the status of their virtual cart as well as past receipts. 

### 🎨 Layout preview

The following images show how the app looks like once you have successfully set it up and it is working.

Login            |  Signup |  Home
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-login.png" alt="Login screen" width="250"/>  |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-signup.png" alt="Signup screen" width="250"/> |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-home.png" alt="Home screen" width="250"/>

Home while client entered            |  Cart while client not entered |  Cart
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-client-already-in.png" alt="Home screen (client entered)" width="250"/>  |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-not-in-shop.png" alt="Cart screen (not entered)" width="250"/> |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-cart.png" alt="Cart screen" width="250"/>

Tickets           |  Ticket in detail
:-------------------------:|:-------------------------:
<img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-tickets.png" alt="Tickets screen" width="250"/>  |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-ticket-detail.png" alt="Ticket in detail" width="250"/> 

Ticket resume          |  Ticket resume when no purchase          |  Explanation video displayed
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-purchase.png" alt="Ticket resume" width="250"/>  |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-no-purchase.png" alt="Ticket resume (no purchase)" width="250"/> |  <img src="https://github.com/Mercury-Smartstores/Mercury-iOS-App/blob/main/readme-assets/App-explanation.png" alt="Explanation" width="250"/> 
  
### 🔧 Installation

The authentication of the users is carried by [Firebase](https://firebase.google.com/) so, in order to successfully use the app, you will need to create a project in Firebase, download the *GoogleService-Info.plist* file and add it to the package.

Then, you will need to download or clone [Mercury Client Manager](https://github.com/Mercury-Smartstores/Mercury-Client-Manager) which is the server needed to establish communication with the store.

### 📦 Deploying 

First of all, you should run the Client Manager by executing
```
npm start
```
in [Mercury Client Manager](https://github.com/Mercury-Smartstores/Mercury-Client-Manager) package.

Once the server has successfully deployed, you just simply open this project on Xcode and launch the Simulator (preferred for iPhone 12 Pro).

### 📄 License

This repository is licensed under the [MIT License](LICENSE).

### ♦️ About Mercury

This repository contains the code for a package from the Mercury infrastructure.
If you want to know more about Mercury check out the [Mercury Organization](https://github.com/Mercury-Smartstores).
