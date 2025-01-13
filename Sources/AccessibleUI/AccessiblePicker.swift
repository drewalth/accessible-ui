//
//  AccessiblePicker.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/28/24.
//

import SwiftUI

// MARK: - AccessiblePickerModifier

/// A view modifier that makes a picker accessible.
/// - Parameters:
///  - label: The label for the picker.
///  - selectedOption: The selected option in the picker.
///  - options: The available options in the picker.
///  - hint: The hint for the picker.
public struct AccessiblePickerModifier<T: Hashable>: ViewModifier {

  // MARK: Public

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue("\(selectedOption.wrappedValue)") // Convert selected option to a string
      .accessibilityHint(hint ?? "Swipe up or down to change options")
      .accessibilityAdjustableAction { direction in
        guard let currentIndex = options.firstIndex(of: selectedOption.wrappedValue) else { return }

        switch direction {
        case .increment:
          let nextIndex = min(currentIndex + 1, options.count - 1)
          selectedOption.wrappedValue = options[nextIndex]
        case .decrement:
          let previousIndex = max(currentIndex - 1, 0)
          selectedOption.wrappedValue = options[previousIndex]
        @unknown default:
          break
        }
      }
  }

  // MARK: Internal

  let label: LocalizedStringKey
  let selectedOption: Binding<T>
  let options: [T]
  let hint: LocalizedStringKey?
}

extension View {
  // A generic accessiblePicker function that can accept any type conforming to Hashable
  public func accessiblePicker<T: Hashable>(
    label: LocalizedStringKey,
    selectedOption: Binding<T>,
    options: [T],
    hint: LocalizedStringKey? = nil)
    -> some View
  {
    modifier(AccessiblePickerModifier(label: label, selectedOption: selectedOption, options: options, hint: hint))
  }
}

#if DEBUG
#Preview {
  struct MyTestPickerView: View {
    @State private var selectedOption = "Option 1"
    let options: [String] = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
      Picker("Hello, world!", selection: $selectedOption) {
        ForEach(options, id: \.self) { option in
          Text(option)
        }
      }
      .pickerStyle(.menu)
      .accessiblePicker(
        label: "Hello, world!",
        selectedOption: $selectedOption,
        options: options,
        hint: "Double tap to change options")
    }
  }
  return MyTestPickerView()
}
#endif
