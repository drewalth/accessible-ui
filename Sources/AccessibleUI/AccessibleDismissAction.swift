//
//  AccessibleDismissAction.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleDismissActionModifier

/// A view modifier for a ``Button`` view that communicates to VoiceOver users that the button will perform a dismiss action.
/// - Parameters:
/// - label: The label for the button.
/// - hint: The hint for the button.
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
