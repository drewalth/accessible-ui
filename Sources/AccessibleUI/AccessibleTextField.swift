//
//  AccessibleTextField.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleTextFieldModifier

public struct AccessibleTextFieldModifier: ViewModifier {
  private let label: String
  private let hint: String?

  public init(label: String, hint: String?) {
    self.label = label
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityHint(hint ?? "Double tap to edit")
      .accessibilityAddTraits(.isKeyboardKey)
  }
}

extension View {
  public func accessibleTextField(label: String, hint: String? = nil) -> some View {
    modifier(AccessibleTextFieldModifier(label: label, hint: hint))
  }
}
