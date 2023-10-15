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

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

4. Within the `body` property, you'll see a `VStack`. This is a view that stacks its children vertically. You can read more about it [here](https://developer.apple.com/documentation/swiftui/vstack). Within the `VStack`, you'll see an `Image` and a `Text`. These are both views. You can read more about `Image` [here](https://developer.apple.com/documentation/swiftui/image) and `Text` [here](https://developer.apple.com/documentation/swiftui/text). You'll also see a modifier called `padding`. This is a modifier that adds padding to the view. You can read more about it [here](<https://developer.apple.com/documentation/swiftui/view/padding(_:edges:)>).

5. A modifier is a method that returns a modified version of the view. You can chain multiple modifiers together to modify the view. For example, you can add a background color to the view by adding a modifier called `background` to the end of the view. You can read more about it [here](<https://developer.apple.com/documentation/swiftui/view/background(_:alignment:)>). The order of the modifiers matters. If you add the `background` modifier before the `padding` modifier, the background color will only be applied to the view itself, not the padding. If you add the `background` modifier after the `padding` modifier, the background color will be applied to the view and the padding.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .background(Color.red)
    }
}
```

6. At the very bottom of the file, there's a `#Preview` struct (albeit with special syntax) that conforms to the `PreviewProvider` protocol. This struct is what creates the preview on the right side of the screen.

### Creating a New View

1. Let's add a new view to the project that creates a button. Right click on the folder tree and click "New File...". Select "Swift File" and click "Next". Enter "ButtonView.swift" as the file name and click "Create". You should see a new file called `ButtonView.swift` in the folder tree.

2. In `ButtonView.swift`, add the following shown below. By creating a `var label: String` property, we can pass in a label to the view. You can read more about properties [here](https://docs.swift.org/swift-book/LanguageGuide/Properties.html).

```swift
import SwiftUI

struct ButtonView: View {
    var label: String

    var body: some View {
        Button(action: {
            print("Button tapped")
        }, label: {
            Text(label)
        })
    }
}
```

3. Go back to `ContentView.swift`. Add the following code to the `VStack`, under `Text`:

```swift
ButtonView(label: "Tap me!")
```

4. Click the play button on the top left of the screen to run your app in the simulator. You should see a button that says "Tap me!". When you tap the button, you should see "Button tapped" printed in the console (which is at the bottom of the screen).

![](/hackpack-assets/console.png)

### Navigation

1. Navigation is a way to navigate between different views. Let's add a navigation view to the app. Go back to `ContentView.swift`. Wrap the `VStack` in a `NavigationView`. You can read more about it [here](https://developer.apple.com/documentation/swiftui/navigationview).

```swift
NavigationView {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
        ButtonView(label: "Tap me!")
    }
    .padding()
}
```

2. Let's create a new screen that displays a list of items. Right click on the folder tree and click "New File...". Select "Swift File" and click "Next". Enter "ListView.swift" as the file name and click "Create". You should see a new file called `ListView.swift` in the folder tree.

3. In `ListView.swift`, add the following shown below. By creating a `var items: [String]` property, we can pass in a list of items to the view. You can read more about arrays [here](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html#ID105). 

```swift
import SwiftUI

struct ListView: View {
    var items: [String]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}
```

4. Go back to `ContentView.swift`. Add a navigation link to the `VStack`, under `ButtonView`. You can read more about it [here](https://developer.apple.com/documentation/swiftui/navigationlink).

```swift
NavigationView {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
        ButtonView(label: "Tap me!")
        NavigationLink(destination: ListView(items: ["Item 1", "Item 2", "Item 3"])) {
            Text("Go to list")
        }
    }
    .padding()
}
```

5. Here's what the app should look like now:

![](/hackpack-assets/navigation.gif)

### Uploading to the App Store

# Congratulations! 🎉

You've finished the SwiftUI hackpack! Now, you can build your own SwiftUI apps!

### License

MIT

# About HackPacks 🌲

HackPacks are built by the [TreeHacks](https://www.treehacks.com/) team and contributors to help hackers build great projects at our hackathon that happens every February at Stanford. We believe that everyone of every skill level can learn to make awesome things, and this is one way we help facilitate hacker culture. We open source our hackpacks (along with our internal tech) so everyone can learn from and use them! Feel free to use these at your own hackathons, workshops, and anything else that promotes building :)

If you're interested in attending TreeHacks, you can apply on our [website](https://www.treehacks.com/) during the application period.

You can follow us here on [GitHub](https://github.com/treehacks) to see all the open source work we do (we love issues, contributions, and feedback of any kind!), and on [Facebook](https://facebook.com/treehacks), [Twitter](https://twitter.com/hackwithtrees), and [Instagram](https://instagram.com/hackwithtrees) to see general updates from TreeHacks.
