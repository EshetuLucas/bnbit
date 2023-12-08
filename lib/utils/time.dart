import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/time_range/time_range.dart';
import 'package:bnbit_app/utils/day.dart';
import 'package:flutter/material.dart';

class TimeUtil {
  static String getDurationTimeFormat(int duration) {
    final now = DateTime.now();
    final time = DateTime(now.year, now.month, now.day, 0, duration);
    final hour = '${time.hour} Hour';
    final minutes = time.minute == 0 ? '' : '${time.minute} Minutes';

    return '$hour $minutes'.trim();
  }

  static Map<String, TimeRange?> convertOperatingHoursToTimeRanges(
    Map<String, OperatingHour?> operatingHours,
  ) {
    final Map<String, TimeRange> timeRanges = {};

    for (final entry in operatingHours.entries) {
      final weekDay = entry.key;
      final operatingHour = entry.value;
      if (operatingHour == null) {
        operatingHours[weekDay] = null;
      } else {
        final timeRange = formatTimeRange(operatingHour);
        if (timeRange != null) timeRanges[weekDay] = timeRange;
      }
    }

    //final rearrangedRanges = {};

    Map<String, TimeRange?> rearrangedRanges = {
      DayUtil.MONDAY: null,
      DayUtil.TUESDAY: null,
      DayUtil.WEDNESDAY: null,
      DayUtil.THURSDAY: null,
      DayUtil.FRIDAY: null,
      DayUtil.SATURDAY: null,
      DayUtil.SUNDAY: null,
    };

    rearrangedRanges.forEach((rKey, rValue) {
      timeRanges.forEach((key, value) {
        if (rKey == key) {
          rearrangedRanges[rKey] = value;
        }
      });
    });
    rearrangedRanges.removeWhere((key, value) => value == null);

    return rearrangedRanges;
  }

  static Map<String, OperatingHour?> convertTimeRangesToOperatingHours(
    Map<String, TimeRange?> timeRanges,
  ) {
    final Map<String, OperatingHour?> operatingHours = {};

    for (final entry in timeRanges.entries) {
      final weekDay = entry.key;
      final timeRange = entry.value;

      if (timeRange == null) {
        operatingHours[weekDay] = null;
      } else {
        final operatingHour = formatTimeRangeToDateTime(timeRange);
        operatingHours[weekDay] = operatingHour;
      }
    }

    return operatingHours;
  }

  static OperatingHour formatTimeRangeToDateTime(TimeRange timeRange) {
    return OperatingHour(
        startTime: DateTime(
            2023, 1, 1, timeRange.startTime.hour, timeRange.startTime.minute),
        endTime: DateTime(
            2023, 1, 1, timeRange.endTime.hour, timeRange.endTime.minute));
  }

  static TimeRange? formatTimeRange(OperatingHour slot) {
    return TimeRange(
      startTime: TimeOfDay.fromDateTime(slot.startTime),
      endTime: TimeOfDay.fromDateTime(slot.endTime),
    );
  }
}
