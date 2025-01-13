//
//  AccessibleToggle.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleToggleModifier

public struct AccessibleToggleModifier: ViewModifier {
  private let label: LocalizedStringKey
  private let isOn: Binding<Bool>
  private let hint: LocalizedStringKey?

  public init(label: LocalizedStringKey, isOn: Binding<Bool>, hint: LocalizedStringKey?) {
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
  public func accessibleToggle(label: LocalizedStringKey, isOn: Binding<Bool>, hint: LocalizedStringKey? = nil) -> some View {
    modifier(AccessibleToggleModifier(label: label, isOn: isOn, hint: hint))
  }
}
