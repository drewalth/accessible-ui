//
//  AccessibleSlider.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleSliderModifier

/// A view modifier that makes a slider accessible.
/// - Parameters:
/// - label: The label for the slider.
/// - value: The value of the slider.
/// - minValue: The minimum value of the slider.
/// - maxValue: The maximum value of the slider.
/// - hint: The hint for the slider.
public struct AccessibleSliderModifier: ViewModifier {

  // MARK: Lifecycle

  public init(label: String, value: Binding<Double>, minValue: Double, maxValue: Double, hint: String?) {
    self.label = label
    self.value = value
    self.minValue = minValue
    self.maxValue = maxValue
    self.hint = hint
  }

  // MARK: Public

  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue("\(Int(value.wrappedValue))")
      .accessibilityHint(hint ?? "Adjust the slider")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .increment:
          value.wrappedValue = min(value.wrappedValue + 1, maxValue)
        case .decrement:
          value.wrappedValue = max(value.wrappedValue - 1, minValue)
        @unknown default:
          break
        }
      }
  }

  // MARK: Private

  private let label: String
  private let value: Binding<Double>
  private let minValue: Double
  private let maxValue: Double
  private let hint: String?
}

extension View {
  public func accessibleSlider(
    label: String,
    value: Binding<Double>,
    minValue: Double,
    maxValue: Double,
    hint: String? = nil)
    -> some View
  {
    modifier(AccessibleSliderModifier(label: label, value: value, minValue: minValue, maxValue: maxValue, hint: hint))
  }
}
