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
  private let label: String
  private let hint: String?

  public init(label: String, hint: String?) {
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
  public func accessibleLink(label: String, hint: String? = nil) -> some View {
    modifier(AccessibleLinkModifier(label: label, hint: hint))
  }
}
