//
//  AccessibleDismissAction.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleDismissActionModifier

public struct AccessibleDismissActionModifier: ViewModifier {
  private let label: String
  private let hint: String?

  public init(label: String, hint: String?) {
    self.label = label
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityHint(hint ?? "Double tap to dismiss")
      .accessibilityAddTraits(.isButton)
  }
}

extension View {
  public func accessibleDismissAction(label: String, hint: String? = nil) -> some View {
    modifier(AccessibleDismissActionModifier(label: label, hint: hint))
  }
}
