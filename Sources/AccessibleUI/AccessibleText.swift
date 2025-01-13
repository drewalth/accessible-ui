//
//  AccessibleText.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleTextModifier

public struct AccessibleTextModifier: ViewModifier {
  private let label: LocalizedStringKey
  private let hint: LocalizedStringKey?

  public init(label: LocalizedStringKey, hint: LocalizedStringKey?) {
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
  public func accessibleText(label: LocalizedStringKey, hint: LocalizedStringKey? = nil) -> some View {
    modifier(AccessibleTextModifier(label: label, hint: hint))
  }
}

#if DEBUG
#Preview {
  Text("Hello, world!")
    .accessibleText(label: "Hello, world!", hint: "This is a hint")
}
#endif
