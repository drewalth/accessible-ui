//
//  AccessiblePicker.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/28/24.
//

import SwiftUI

// MARK: - AccessiblePickerModifier

public struct AccessiblePickerModifier: ViewModifier {

  // MARK: Lifecycle


  public init(label: String, selectedOption: Binding<Int>, options: [String], hint: String?) {
    self.label = label
    self.selectedOption = selectedOption
    self.options = options
    self.hint = hint
  }

  // MARK: Public


  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue(options[selectedOption.wrappedValue])
      .accessibilityHint(hint ?? "Swipe up or down to change options")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .increment:
          selectedOption.wrappedValue = min(selectedOption.wrappedValue + 1, options.count - 1)
        case .decrement:
          selectedOption.wrappedValue = max(selectedOption.wrappedValue - 1, 0)
        @unknown default:
          break
        }
      }
  }

  // MARK: Private

  private let label: String
  private let selectedOption: Binding<Int>
  private let options: [String]
  private let hint: String?
}

extension View {
  public func accessiblePicker(
    label: String,
    selectedOption: Binding<Int>,
    options: [String],
    hint: String? = nil)
    -> some View
  {
    modifier(AccessiblePickerModifier(label: label, selectedOption: selectedOption, options: options, hint: hint))
  }
}
