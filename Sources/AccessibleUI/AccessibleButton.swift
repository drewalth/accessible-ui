//
//  AccessibleButton.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleButtonModifier

public struct AccessibleButtonModifier: ViewModifier {
  private let label: String
  private let hint: String?

  public init(label: String, hint: String?) {
    self.label = label
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityHint(hint ?? "Tap to activate")
      .accessibilityAddTraits(.isButton)
  }
}

extension View {
  public func accessibleButton(label: String, hint: String? = nil) -> some View {
    modifier(AccessibleButtonModifier(label: label, hint: hint))
  }
}
