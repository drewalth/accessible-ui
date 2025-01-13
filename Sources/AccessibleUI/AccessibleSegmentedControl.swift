//
//  AccessibleSegmentedControl.swift
//  AccessibleUI
//
//  Created by Andrew Althage on 9/27/24.
//

import SwiftUI

// MARK: - AccessibleSegmentedControlModifier

/// A view modifier that makes a segmented control accessible.
/// - Parameters:
/// - label: The label for the segmented control.
/// - selectedSegment: The index of the selected segment.
/// - segments: The segments of the segmented control.
/// - hint: The hint for the segmented control.
public struct AccessibleSegmentedControlModifier: ViewModifier {

  // MARK: Lifecycle

  public init(
    label: LocalizedStringKey,
    selectedSegment: Binding<Int>,
    segments: [LocalizedStringKey],
    hint: LocalizedStringKey?)
  {
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

  private let label: LocalizedStringKey
  private let selectedSegment: Binding<Int>
  private let segments: [LocalizedStringKey]
  private let hint: LocalizedStringKey?
}

extension View {
  public func accessibleSegmentedControl(
    label: LocalizedStringKey,
    selectedSegment: Binding<Int>,
    segments: [LocalizedStringKey],
    hint: LocalizedStringKey? = nil)
    -> some View
  {
    modifier(AccessibleSegmentedControlModifier(
      label: label,
      selectedSegment: selectedSegment,
      segments: segments,
      hint: hint))
  }
}
