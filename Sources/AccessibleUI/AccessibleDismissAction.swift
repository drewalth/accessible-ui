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
  private let label: LocalizedStringKey
  private let hint: LocalizedStringKey?

  public init(label: LocalizedStringKey, hint: LocalizedStringKey?) {
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
  public func accessibleDismissAction(label: LocalizedStringKey, hint: LocalizedStringKey? = nil) -> some View {
    modifier(AccessibleDismissActionModifier(label: label, hint: hint))
  }
}

#if DEBUG
#Preview {
  Button("Hello, world!") {
    print("Hello, world!")
  }
  .accessibleDismissAction(label: "Hello, world!", hint: "Double tap to dismiss")
}
#endif
