//
//  AccessibleHeading.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleHeadingModifier

/// A view modifier that makes a view accessible as a heading.
/// - Parameters:
/// - level: The heading level.
public struct AccessibleHeadingModifier: ViewModifier {
  private let level: Int

  public init(level: Int) {
    self.level = level
  }

  public func body(content: Content) -> some View {
    content
      .accessibilityAddTraits(.isHeader)
      .accessibilityLabel("Heading level \(level)")
  }
}

extension View {
  public func accessibleHeading(level: Int = 1) -> some View {
    modifier(AccessibleHeadingModifier(level: level))
  }
}
