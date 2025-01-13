//
//  AccessibleProgressView.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleProgressViewModifier

/// A view modifier that makes a progress view accessible.
/// - Parameters:
/// - label: The label for the progress view.
/// - value: The value of the progress view.
/// - hint: The hint for the progress view.
public struct AccessibleProgressViewModifier: ViewModifier {
  private let label: LocalizedStringKey
  private let value: Double? // Optional for indeterminate states
  private let hint: LocalizedStringKey?

  public init(label: LocalizedStringKey, value: Double?, hint: LocalizedStringKey?) {
    self.label = label
    self.value = value
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue(value != nil ? "\(Int(value! * 100))% complete" : "Loading")
      .accessibilityHint(hint ?? "Indicates progress")
  }
}

extension View {
  public func accessibleProgressView(
    label: LocalizedStringKey,
    value: Double? = nil,
    hint: LocalizedStringKey? = nil)
    -> some View
  {
    modifier(AccessibleProgressViewModifier(label: label, value: value, hint: hint))
  }
}

#if DEBUG
#Preview {
  ProgressView("Hello, world!", value: 0.5)
    .accessibleProgressView(label: "Hello, world!", value: 0.5, hint: "Indicates progress")
}
#endif
