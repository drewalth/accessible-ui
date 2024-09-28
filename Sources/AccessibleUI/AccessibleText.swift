//
//  AccessibleText.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleTextModifier

public struct AccessibleTextModifier: ViewModifier {
  private let label: String
  private let hint: String?

  public init(label: String, hint: String?) {
    self.label = label
    self.hint = hint
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityHint(hint ?? "")
  }
}

extension View {
  public func accessibleText(label: String, hint: String? = nil) -> some View {
    modifier(AccessibleTextModifier(label: label, hint: hint))
  }
}
