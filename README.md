# AccessibleUI: Simplifying Accessibility in SwiftUI

![hero image](/hero.png)

Welcome to **AccessibleUI**, a Swift package designed to streamline the implementation of accessibility features in your SwiftUI apps. This package abstracts the most common accessibility view modifiers, helping you make your apps more inclusive with minimal effort. Whether you're a seasoned iOS developer or just starting out, **AccessibleUI** makes it easier to meet the accessibility standards recommended in Apple's Human Interface Guidelines.

## 🎯 Project Goal

The goal of **AccessibleUI** is to lower the barrier to building accessible apps by providing a set of pre-configured view modifiers to effortlessly add accessibility features like labels, hints, and traits to common SwiftUI components, ensuring all users have a seamless experience, including those using assistive technologies like VoiceOver.

By using **AccessibleUI**, you’ll spend less time configuring accessibility and more time creating incredible user experiences!

## 🚀 Getting Started

To get started with **AccessibleUI**, simply add the package to your project via Swift Package Manager:

1. In Xcode, go to **File** > **Add Packages**.
2. Paste the package URL: `https://github.com/drewalth/accessible-ui`
3. Select the version or branch you want to use and integrate it into your app!

### How to Use

Here’s a quick look at how **AccessibleUI** simplifies common SwiftUI accessibility patterns:

```swift
import SwiftUI
import AccessibleUI

struct ContentView: View {
    @State private var sliderValue: Double = 50
    @State private var isSwitchOn: Bool = false
    @State private var stepperValue: Int = 2
    @State private var selectedSegment: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            // Accessible button
            Button(action: {
                print("Button pressed")
            }) {
                Text("Press Me")
            }
            .accessibleButton(label: "Press Me", hint: "Activates a simple action")
            
            // Accessible image
            Image(systemName: "star.fill")
                .accessibleImage(label: "A filled star")
            
            // Accessible slider
            Slider(value: $sliderValue, in: 0...100)
                .accessibleSlider(label: "Brightness", value: $sliderValue, minValue: 0, maxValue: 100, hint: "Slide to adjust brightness level")
            
            // Accessible toggle
            Toggle("Switch", isOn: $isSwitchOn)
                .accessibleToggle(label: "Toggle Switch", isOn: $isSwitchOn)
            
            // Accessible stepper
            Stepper("Value: \(stepperValue)", value: $stepperValue, in: 0...10)
                .accessibleStepper(label: "Select value", value: $stepperValue, range: 0...10)
            
            // Accessible segmented control
            Picker("Options", selection: $selectedSegment) {
                Text("Option 1").tag(0)
                Text("Option 2").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .accessibleSegmentedControl(label: "Choose option", selectedSegment: $selectedSegment, segments: ["Option 1", "Option 2"])
        }
        .padding()
    }
}
```

With **AccessibleUI**, you can quickly apply accessibility best practices to your views without having to write custom accessibility code for each component over and over again. This makes it easier to build inclusive apps that cater to all users, regardless of their abilities.

## 🔧 Customization

Every app is different, so **AccessibleUI** allows you to customize hints, labels, and traits to suit your specific needs. Each modifier accepts parameters that you can adjust based on the context of your app, making the framework flexible while ensuring your app meets accessibility standards.
