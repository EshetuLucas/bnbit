import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_range.freezed.dart';

@freezed
class TimeRange with _$TimeRange {
  factory TimeRange({
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) = _TimeRange;

  @override
  String toString() {
    return '$startTime - $endTime';
  }
}
