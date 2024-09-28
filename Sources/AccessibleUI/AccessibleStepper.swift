//
//  AccessibleStepper.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleStepperModifier

/// A view modifier that makes a stepper accessible.
/// - Parameters:
/// - label: The label for the stepper.
/// - value: The binding to the stepper's value.
/// - range: The range of values for the stepper.
/// - hint: The hint for the stepper.
public struct AccessibleStepperModifier: ViewModifier {

  // MARK: Lifecycle

  public init(label: String, value: Binding<Int>, range: ClosedRange<Int>, hint: String?) {
    self.label = label
    self.value = value
    self.range = range
    self.hint = hint
  }

  // MARK: Public

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue("\(value.wrappedValue)")
      .accessibilityHint(hint ?? "Use swipe up or down to adjust")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .increment:
          value.wrappedValue = min(value.wrappedValue + 1, range.upperBound)
        case .decrement:
          value.wrappedValue = max(value.wrappedValue - 1, range.lowerBound)
        @unknown default:
          break
        }
      }
  }

  // MARK: Private

  private let label: String
  private let value: Binding<Int>
  private let range: ClosedRange<Int>
  private let hint: String?
}

extension View {
  public func accessibleStepper(label: String, value: Binding<Int>, range: ClosedRange<Int>, hint: String? = nil) -> some View {
    modifier(AccessibleStepperModifier(label: label, value: value, range: range, hint: hint))
  }
}
