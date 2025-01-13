//
//  AccessibleLink.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleLinkModifier

/// A view modifier that makes a view accessible as a link.
/// - Parameters:
/// - label: The label for the link.
/// - hint: The hint for the link.
public struct AccessibleLinkModifier: ViewModifier {
  private let label: LocalizedStringKey
  private let hint: LocalizedStringKey?

  public init(label: LocalizedStringKey, hint: LocalizedStringKey?) {
    self.label = label
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityHint(hint ?? "Double tap to open the link")
      .accessibilityAddTraits(.isLink)
  }
}

extension View {
  public func accessibleLink(label: LocalizedStringKey, hint: LocalizedStringKey? = nil) -> some View {
    modifier(AccessibleLinkModifier(label: label, hint: hint))
  }
}
