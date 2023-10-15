# hackpack-swift-ui

### Overview

In this hackpack we will cover the basics of SwiftUI and create a simple iOS app. SwiftUI is a framework that allows you to build user interfaces across all Apple platforms with the power of Swift. It is a declarative framework, meaning that you can describe your user interface in a declarative manner, and SwiftUI will handle the rest. SwiftUI is also cross-platform, meaning that you can use the same code to build apps for iOS, macOS, watchOS, and tvOS (assuming the user interface is updated to fit the platform). Without further ado, let's get started!

### Setup

1. Install Xcode from the App Store (https://apps.apple.com/us/app/xcode/id497799835?mt=12)

### Creating a New Project

1. Open Xcode and click "Create New Project"

![](/hackpack-assets/new_project_0.png)

2. Select "App" under "iOS"

![](/hackpack-assets/new_project_1.png)

3. Enter a product name. For the organization identifier, enter your name in reverse domain name notation (e.g. com.apple). Leave the rest of the fields as default and click "Next"

![](/hackpack-assets/new_project_2.png)

4. Choose a location to save your project and click "Create". You should see a screen as shown below. On the right side of the screen, you should see a preview of your app. This is the default view that Xcode provides for you. You can click the play button on the top left of the screen to run your app in the simulator (or on your device if you have one connected).

![](/hackpack-assets/new_project_3.png)

### Overview of Xcode

1. On the left side of the screen, you should see a file navigator. This is where you can view all of the files in your project and also create new files/folders. Above the folder tree, you should see a row of buttons that show you different properties of the project. For example, you can see all the breakpoints or monitor the memory usage of your app. 

![](/hackpack-assets/folder_tree.png) ![](/hackpack-assets/performance.png)

2. At the very top, you should see the current device Xcode would run your app on. You can click this to change the device. 

![](/hackpack-assets/device.png)

3. Github is integrated into Xcode. You can click the source control button on the top right of the screen to see all the changes you've made to your project. You can also commit and push your changes to Github from here.

### Code Structure

1. By default, you should see a file called `ContentView.swift`. This is the file that contains the code for the default view that Xcode provides for you. You can see the code for the view on the right side of the screen.

2. `ContentView.swift` is called in `My_AppApp.swift`. This is the file that contains the code for the app itself. You can see the code for the app on the right side of the screen. For now, you can ignore this file.

3. Let's go back to `ContentView.swift`. You'll notice that it's a struct that conforms to the `View` protocol. This means that it's a view. You can see the code for the view on the right side of the screen. The `body` property is a computed property that returns a `some View`. This means that the type of the view is unknown, but it conforms to the `View` protocol. The `some` keyword is used to hide the type of the view. You can read more about opaque return types [here](https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html).


### Uploading to the App Store

# Congratulations! 🎉

You've finished the SwiftUI hackpack! Now, you can build your own SwiftUI apps!

### License

MIT

# About HackPacks 🌲

HackPacks are built by the [TreeHacks](https://www.treehacks.com/) team and contributors to help hackers build great projects at our hackathon that happens every February at Stanford. We believe that everyone of every skill level can learn to make awesome things, and this is one way we help facilitate hacker culture. We open source our hackpacks (along with our internal tech) so everyone can learn from and use them! Feel free to use these at your own hackathons, workshops, and anything else that promotes building :)

If you're interested in attending TreeHacks, you can apply on our [website](https://www.treehacks.com/) during the application period.

You can follow us here on [GitHub](https://github.com/treehacks) to see all the open source work we do (we love issues, contributions, and feedback of any kind!), and on [Facebook](https://facebook.com/treehacks), [Twitter](https://twitter.com/hackwithtrees), and [Instagram](https://instagram.com/hackwithtrees) to see general updates from TreeHacks.
