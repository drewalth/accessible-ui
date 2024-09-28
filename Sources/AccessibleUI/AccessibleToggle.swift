//
//  AccessibleToggle.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleToggleModifier

public struct AccessibleToggleModifier: ViewModifier {
  private let label: String
  private let isOn: Binding<Bool>
  private let hint: String?

  public init(label: String, isOn: Binding<Bool>, hint: String?) {
    self.label = label
    self.isOn = isOn
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue(isOn.wrappedValue ? "On" : "Off")
      .accessibilityHint(hint ?? "Double tap to toggle")
      .accessibilityAddTraits(.isButton)
  }
}

extension View {
  public func accessibleToggle(label: String, isOn: Binding<Bool>, hint: String? = nil) -> some View {
    modifier(AccessibleToggleModifier(label: label, isOn: isOn, hint: hint))
  }
}
