//
//  AccessibleImage.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleImageModifier

public struct AccessibleImageModifier: ViewModifier {
  private let label: String

  public init(label: String) {
    self.label = label
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityAddTraits(.isImage)
  }
}

extension View {
  public func accessibleImage(label: String) -> some View {
    modifier(AccessibleImageModifier(label: label))
  }
}
