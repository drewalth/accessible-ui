//
//  AccessibleSegmentedControl.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleSegmentedControlModifier

public struct AccessibleSegmentedControlModifier: ViewModifier {

  // MARK: Lifecycle


  public init(label: String, selectedSegment: Binding<Int>, segments: [String], hint: String?) {
    self.label = label
    self.selectedSegment = selectedSegment
    self.segments = segments
    self.hint = hint
  }

  // MARK: Public


  public func body(content: Content) -> some View {
    content
      .accessibilityLabel(label)
      .accessibilityValue(segments[selectedSegment.wrappedValue])
      .accessibilityHint(hint ?? "Swipe up or down to change selection")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .increment:
          selectedSegment.wrappedValue = min(selectedSegment.wrappedValue + 1, segments.count - 1)
        case .decrement:
          selectedSegment.wrappedValue = max(selectedSegment.wrappedValue - 1, 0)
        @unknown default:
          break
        }
      }
  }

  // MARK: Private

  private let label: String
  private let selectedSegment: Binding<Int>
  private let segments: [String]
  private let hint: String?
}

extension View {
  public func accessibleSegmentedControl(
    label: String,
    selectedSegment: Binding<Int>,
    segments: [String],
    hint: String? = nil)
    -> some View
  {
    modifier(AccessibleSegmentedControlModifier(
      label: label,
      selectedSegment: selectedSegment,
      segments: segments,
      hint: hint))
  }
}
