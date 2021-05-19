# Mercury iOS App 📱 

This package contains the code to create a mobile application for iOS which allows users to login in the Mercury Smart Store and check the status of their virtual cart as well as past receipts. 

### 🎨 Layout preview

TODO: Layout pictures, include gif images for different actions

### 🔧 Installation

The authentication of the users is carried by [Firebase](https://firebase.google.com/) so, in order to successfully use the app, you will need to create a project in Firebase, download the *GoogleService-Info.plist* file and add it to the package.

Then, you will need to download or clone [Mercury Client Manager](https://github.com/Mercury-Smartstores/Mercury-Client-Manager) which is the server needed to establish communication with the store.

### 📦 Deploying 

First of all, you should run the Client Manager by executing
```
node server.js
```
in [Mercury Client Manager](https://github.com/Mercury-Smartstores/Mercury-Client-Manager) package.

Once the server has successfully deployed, you just simply open this project on Xcode and launch the Simulator (preferred for iPhone 12 Pro).

### 📄 License

This repository is licensed under the [MIT License](LICENSE).

### ♦️ About Mercury

This repository contains the code for a package from the Mercury infrastructure.
If you want to know more about Mercury check out the [Mercury Organization](https://github.com/Mercury-Smartstores).
