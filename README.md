# hackpack-swift-ui

### Overview

In this hackpack we will cover the basics of SwiftUI and create a simple iOS app. SwiftUI is a framework that allows you to build user interfaces across all Apple platforms with the power of Swift. It is a declarative framework, meaning that you can describe your user interface in a declarative manner, and SwiftUI will handle the rest. SwiftUI is also cross-platform, meaning that you can use the same code to build apps for iOS, macOS, watchOS, and tvOS (assuming the user interface is updated to fit the platform). Without further ado, let's get started!

### Setup

1. Install Xcode from the App Store (https://apps.apple.com/us/app/xcode/id497799835?mt=12)

2. Open Xcode and click "Create New Project"

![](/hackpack-assets/new_project_0.png)

3. Select "App" under "iOS"

![](/hackpack-assets/new_project_1.png)

4. Enter a product name. For the organization identifier, enter your name in reverse domain name notation (e.g. com.apple). Leave the rest of the fields as default and click "Next"

![](/hackpack-assets/new_project_2.png)

5. Choose a location to save your project and click "Create". You should see a screen as shown below. On the right side of the screen, you should see a preview of your app. This is the default view that Xcode provides for you. You can click the play button on the top left of the screen to run your app in the simulator (or on your device if you have one connected).

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

4. Within the `body` property, you'll see a `VStack`. This is a view that stacks its children vertically [(docs)](https://developer.apple.com/documentation/swiftui/vstack). Within the `VStack`, you'll see an `Image` [(docs)](https://developer.apple.com/documentation/swiftui/image) and a `Text` [(docs)](https://developer.apple.com/documentation/swiftui/text). You'll also see a modifier called `padding` [(docs)](<https://developer.apple.com/documentation/swiftui/view/padding(_:_:)>).

5. A modifier is a method that returns a modified version of the view. They should be indented under the view they modify. You can chain multiple modifiers together to modify the view. For example, you can add a background color to the view by adding a modifier called `background` to the end of the view [(docs)](<https://developer.apple.com/documentation/swiftui/view/background(alignment:content:)>). The order of the modifiers matters. If you add the `background` modifier before the `padding` modifier, the background color will only be applied to the view itself, not the padding. If you add the `background` modifier after the `padding` modifier, the background color will be applied to the view and the padding.

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
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(label)
        }
    }
}
```

3. Go back to `ContentView.swift`. Add the following code to the `VStack`, under `Text`:

```swift
ButtonView(
    label: "Tap me!",
    action: {
        print("Button tapped")
    }
)
```

4. Click the play button on the top left of the screen to run your app in the simulator. You should see a button that says "Tap me!". When you tap the button, you should see "Button tapped" printed in the console (which is at the bottom of the screen).

![](/hackpack-assets/console.png)

### Navigation

1. Navigation is a way to navigate between different views. Let's add a navigation view to the app. Go back to `ContentView.swift`. Wrap the `VStack` in a `NavigationStack`[(docs)](https://developer.apple.com/documentation/swiftui/navigationstack).

```swift
NavigationStack {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
        ButtonView(
            label: "Tap me!",
            action: {
                print("Button tapped")
            }
        )
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

4. Go back to `ContentView.swift`. Add a navigation link to the `VStack`, under `ButtonView`. You can read more about navigation links [here](https://developer.apple.com/documentation/swiftui/navigationlink).

```swift
NavigationStack {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
        ButtonView(
            label: "Tap me!",
            action: {
                print("Button tapped")
            }
        )
        NavigationLink(destination: ListView(items: ["Item 1", "Item 2", "Item 3"])) {
            Text("Go to list")
        }
    }
    .padding()
}
```

5. Here's what the app should look like now:

![](/hackpack-assets/navigation.gif)

### Networking

1. Let's create a new screen that displays a list of items from an API. Right click on the folder tree and click "New File...". Select "Swift File" and click "Next". Enter "NetworkingView.swift" as the file name and click "Create". You should see a new file called `NetworkingView.swift` in the folder tree.

2. In `NetworkingView.swift`, let's call the [JSON Placeholder API](https://jsonplaceholder.typicode.com/) to get a list of posts. Add the following shown below. By creating a `@State var posts: [Post]` property, we can store the list of posts in the view. You can read more about states [here](https://developer.apple.com/documentation/swiftui/state).

```swift
import SwiftUI

struct NetworkingView: View {
    @State var posts: [Post] = []

    var body: some View {
        List(posts, id: \.id) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
            }
        }
        .task {
            do {
                posts = try await fetchPosts()
            } catch {
                print(error)
            }
        }
    }

    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
```

3. A task is a piece of code that runs asynchronously. In the `task` modifier, we call the `fetchPosts` function to get a list of posts. We then set the `posts` property to the list of posts. You can read more about the `task` modifier [here](<https://developer.apple.com/documentation/swiftui/view/task(priority:_:)>).

4. A `Codable` type is a type that can be encoded and decoded from JSON [(docs)](https://developer.apple.com/documentation/swift/codable). We create a `Post` struct that conforms to the `Codable` protocol. We also make it conform to the `Identifiable` protocol so that we can use it in a `List`.

5. An `Identifiable` type is a type that has a stable identity [(docs)](https://developer.apple.com/documentation/swiftui/identifiable). We make the `id` property of the `Post` struct the stable identity.

6. Go back to `ContentView.swift`. Add a navigation link to the `VStack`, under `NavigationLink`.

```swift
NavigationStack {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
        ButtonView(
            label: "Tap me!",
            action: {
                print("Button tapped")
            }
        )
        NavigationLink(destination: ListView(items: ["Item 1", "Item 2", "Item 3"])) {
            Text("Go to list")
        }
        NavigationLink(destination: NetworkingView()) {
            Text("Go to networking")
        }
    }
    .padding()
}
```

7. Here's what the app should look like now:

![](/hackpack-assets/network.gif)

### Layout

1. There are 3 main layout views in SwiftUI: `VStack`, `HStack`, and `ZStack`. We've already seen `VStack`, which stacks its children vertically. `HStack` stacks its children horizontally [(docs)](https://developer.apple.com/documentation/swiftui/hstack). `ZStack` stacks its children on top of each other [(docs)](https://developer.apple.com/documentation/swiftui/zstack).

2. You can also use the `Spacer` view to add space between views [(docs)](https://developer.apple.com/documentation/swiftui/spacer).

3. Let's add the following code to `ContentView.swift` (inside VStack, under the NavigationLink):

```swift
Spacer()

HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}

ZStack {
    Circle()
        .fill(Color.blue)
        .padding(50)
    Text("Hello, world!")
}
```

4. Here's what the app should look like now:

![](/hackpack-assets/spacer.png)

### Styling

1. Now that we've gotten some basic SwiftUI down, let's create a more structured layout with some styling.

2. First, let's make the buttons look more like clickable buttons. Go to `ButtonView.swift` and replace the contents of the file with the following:

```swift
import SwiftUI

struct ButtonView<Content: View>: View {
    var label: Content
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            label
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
```

3. By making the `label` property a generic type, we can pass in any view as the label. However, we also have to change the `ButtonView` header to `struct ButtonView<Content: View>: View {`, which means that the struct `ButtonView` has a generic type paramter `Content` that conforms to the `View` protocol. You can read more about generics [here](https://docs.swift.org/swift-book/LanguageGuide/Generics.html).

4. Let's make navigation links look more like buttons. Make a new file called `NavigationButtonView.swift` and add the following code:

```swift
import SwiftUI

struct NavigationButtonView<Content: View>: View {
    var label: Content
    var destination: AnyView

    var body: some View {
        NavigationLink(destination: destination) {
            label
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
```

5. Replace the contents of `ContentView.swift` with the following:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                    
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .padding(50)
                    Text("Hello, world!")
                }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()

                Spacer()

                HStack {
                    ButtonView(
                        label: Text("Tap me!")
                        action: {
                            print("Button tapped")
                        }
                    )

                    NavigationButtonView(
                        label: Text("Go to List View"),
                        destination: AnyView(ListView(items: ["Item 1", "Item 2", "Item 3"]))
                    )
                    
                    NavigationButtonView(
                        label: Text("Go to Network"),
                        destination: AnyView(NetworkingView())
                    )
                }
                    .padding(.horizontal)
            }
        }
    }
}
```

6. Notice how for the `destination` argument in `NavigationButtonView`, we have to wrap the view in `AnyView`, because that's what the `destination` argument expects. This is because the `destination` argument is of type `AnyView` [(docs)](https://developer.apple.com/documentation/swiftui/anyview).

7. Here's what the app should look like now:

![](/hackpack-assets/styling.png)

# Congratulations! 🎉

You've finished the SwiftUI hackpack! Now, you can build your own SwiftUI apps!

### License

MIT

# About HackPacks 🌲

HackPacks are built by the [TreeHacks](https://www.treehacks.com/) team and contributors to help hackers build great projects at our hackathon that happens every February at Stanford. We believe that everyone of every skill level can learn to make awesome things, and this is one way we help facilitate hacker culture. We open source our hackpacks (along with our internal tech) so everyone can learn from and use them! Feel free to use these at your own hackathons, workshops, and anything else that promotes building :)

If you're interested in attending TreeHacks, you can apply on our [website](https://www.treehacks.com/) during the application period.

You can follow us here on [GitHub](https://github.com/treehacks) to see all the open source work we do (we love issues, contributions, and feedback of any kind!), and on [Facebook](https://facebook.com/treehacks), [Twitter](https://twitter.com/hackwithtrees), and [Instagram](https://instagram.com/hackwithtrees) to see general updates from TreeHacks.
