# InterViewTask_02h
This app contain google sign in and list of images both in online and offline

**Description**
This app contain google sign in and list of images both in online and offline

**Screenshots**
![imag1](https://github.com/Manasa-Panasa/InterViewTask_02h/assets/152583344/e9064986-74e7-431b-a18d-f7c38736ff4d)
![image2](https://github.com/Manasa-Panasa/InterViewTask_02h/assets/152583344/9e245dd2-8fc7-4c09-b1bd-e54f22d7e3f8)
![image3](https://github.com/Manasa-Panasa/InterViewTask_02h/assets/152583344/ca3611d3-14c7-4553-bc82-f44e5d8f7b9b)
![image4](https://github.com/Manasa-Panasa/InterViewTask_02h/assets/152583344/68c97776-b869-4918-8c17-05b35accc169)
![image5](https://github.com/Manasa-Panasa/InterViewTask_02h/assets/152583344/e373f5eb-62bb-4385-87e0-5fd343509063)

**Getting Started**
These instructions will help you integrate GoogleSignIn and SDWebImage into your Swift project using CocoaPods.

**Prerequisites**
- Xcode installed
- CocoaPods installed (if not, run sudo gem install cocoapods in your terminal)

**Installing**
1. Clone the repository to your local machine.
git clone https://github.com/your-username/your-project.git

2. Navigate to the project directory.
cd your-project
Install CocoaPods dependencies.

3. pod init
4. open Podfile
5. Adding Pods
- To add GoogleSignIn and SDWebImage to your project, follow these steps:
- Create a Podfile in your project's root directory.
- Open the Podfile in a text editor and add the following lines:

platform :ios, '12.0'
use_frameworks!

target 'YourAppTarget' do
  pod 'GoogleSignIn'
  pod 'SDWebImage'
end
Replace 'YourAppTarget' with the actual target name of your app.

6. Install Pods.

pod install
Open the workspace.

open YourApp.xcworkspace
**Import modules in your Swift files.**
import GoogleSignIn
import SDWebImage
Now you're ready to use GoogleSignIn and SDWebImage in your project!

**Contributing**
If you'd like to contribute to this project, please follow the Contributing Guidelines.

**License**
This project is licensed under the MIT License - see the LICENSE file for details.
