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

  let label: String
  let selectedOption: Binding<T>
  let options: [T]
  let hint: String?
}

extension View {
  // A generic accessiblePicker function that can accept any type conforming to Hashable
  public func accessiblePicker<T: Hashable>(
    label: String,
    selectedOption: Binding<T>,
    options: [T],
    hint: String? = nil)
    -> some View
  {
    modifier(AccessiblePickerModifier(label: label, selectedOption: selectedOption, options: options, hint: hint))
  }
}
