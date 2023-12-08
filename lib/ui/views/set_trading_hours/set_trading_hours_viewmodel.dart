import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/time_range/time_range.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/utils/day.dart';
import 'package:bnbit_app/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// TODO: Add back the visible for testing here. This is just for testing
// @visibleForTesting
enum TradingHoursMapType {
  combined,
  daily,
}

enum TimeRangePosition {
  start,
  end,
}

@visibleForTesting
final TimeRange DefaultTimeRange = TimeRange(
  startTime: TimeOfDay(hour: 8, minute: 0),
  endTime: TimeOfDay(hour: 17, minute: 0),
);

class SetScheduleViewModel extends BaseViewModel {
  final log = getLogger('SetScheduleViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _buisnessService = locator<BusinessService>();

  NewBusiness get newBusines => _buisnessService.newBusiness;

  void setExistingSchedule(Map<String, TimeRange?>? existingTradingHours) {
    dailyTradingHours = createDailyTradingHoursFromExistingTradingHours(
      existingTradingHours: existingTradingHours,
    );
    log.v('dailyTradingHours:$dailyTradingHours');
  }

  /// Map of trading hours where each key represents a combined range of week days
  Map<String, TimeRange?> combinedTradingHours = {
    // The trading hours for every day in a full week
    DayUtil.EVERYDAY: null,

    // Trading hours for all Week days
    DayUtil.WEEKDAYS: null,

    // Trading hour for all days on the weekend
    DayUtil.WEEKENDS: null,
  };

  bool get hasAnyCombinedValue => combinedTradingHours.values
      .where((element) => element != null)
      .toList()
      .isNotEmpty;

  /// Map of trading hours where each key represents a single day of the week
  Map<String, TimeRange?> dailyTradingHours = {
    DayUtil.MONDAY: null,
    DayUtil.TUESDAY: null,
    DayUtil.WEDNESDAY: null,
    DayUtil.THURSDAY: null,
    DayUtil.FRIDAY: null,
    DayUtil.SATURDAY: null,
    DayUtil.SUNDAY: null,
  };

  void resetDaily() {
    dailyTradingHours = {
      DayUtil.MONDAY: null,
      DayUtil.TUESDAY: null,
      DayUtil.WEDNESDAY: null,
      DayUtil.THURSDAY: null,
      DayUtil.FRIDAY: null,
      DayUtil.SATURDAY: null,
      DayUtil.SUNDAY: null,
    };
  }

  void toggleCombinedTradingHours(String key) =>
      toggleTradingHoursForMap(key, TradingHoursMapType.combined);

  void toggleDailyTradingHours(String key) =>
      toggleTradingHoursForMap(key, TradingHoursMapType.daily);

  void setTimeRangeForCombinedTradingHours(
    String key,
    TimeRange timeRange,
  ) =>
      setTimeRangeForMap(
        key: key,
        type: TradingHoursMapType.combined,
        timeRange: timeRange,
      );
  void setTimeRangeForDailyTradinghours(
    String key,
    TimeRange timeRange,
  ) =>
      setTimeRangeForMap(
        key: key,
        type: TradingHoursMapType.daily,
        timeRange: timeRange,
      );

  Future<void> selectStartTimeForCombinedHours({
    required String key,
    required TimeRange currentTimeRange,
  }) =>
      selectTimeFor(
        key: key,
        type: TradingHoursMapType.combined,
        position: TimeRangePosition.start,
        currentTimeRange: currentTimeRange,
      );

  Future<void> selectEndTimeForCombinedHours({
    required String key,
    required TimeRange currentTimeRange,
  }) =>
      selectTimeFor(
        key: key,
        type: TradingHoursMapType.combined,
        position: TimeRangePosition.end,
        currentTimeRange: currentTimeRange,
      );

  Future<void> selectStartTimeForDailyHours({
    required String key,
    required TimeRange currentTimeRange,
  }) =>
      selectTimeFor(
        key: key,
        type: TradingHoursMapType.daily,
        position: TimeRangePosition.start,
        currentTimeRange: currentTimeRange,
      );

  Future<void> selectEndTimeForDailyHours({
    required String key,
    required TimeRange currentTimeRange,
  }) =>
      selectTimeFor(
        key: key,
        type: TradingHoursMapType.daily,
        position: TimeRangePosition.end,
        currentTimeRange: currentTimeRange,
      );

  @visibleForTesting
  Future<void> selectTimeFor({
    required String key,
    required TradingHoursMapType type,
    required TimeRangePosition position,
    required TimeRange currentTimeRange,
  }) async {
    final timeResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.timeSelection,
      data: position == TimeRangePosition.end
          ? currentTimeRange.endTime
          : currentTimeRange.startTime,
    );

    log.v('selectedTime: ${timeResponse?.data}');

    if (timeResponse?.data == null) {
      return;
    }
    TimeOfDay? selectedTime = timeResponse?.data!;

    TimeRange updatedTimeRange;

    if (position == TimeRangePosition.start) {
      updatedTimeRange = TimeRange(
        startTime: selectedTime!,
        endTime: currentTimeRange.endTime,
      );
    } else {
      updatedTimeRange = TimeRange(
        startTime: currentTimeRange.startTime,
        endTime: selectedTime!,
      );
    }

    setTimeRangeForMap(
      key: key,
      type: type,
      timeRange: updatedTimeRange,
    );
  }

  /// Gets all the selected trading hours together and returns it to the
  /// function that called this view

  Future<void> onDoneTapped() async {
    setBusy(true);
    final tradingHours = mergeCombinedAndDailyTradingHours();
    log.v('tradingHours:$tradingHours');
    try {
      _buisnessService.setNewBusiness(newBusines.copyWith(
          opening_hours:
              TimeUtil.convertTimeRangesToOperatingHours(tradingHours)));

      _navigationService.back();
    } catch (e) {
      log.e('Unable to update artists schedule $e');
    } finally {
      setBusy(false);
    }

    //_navigationService.back(result: schedule);
  }

  /// Takes the combined trading hours and c

  @visibleForTesting
  Map<String, TimeRange> mergeCombinedAndDailyTradingHours({
    @visibleForTesting Map<String, TimeRange?>? testCombinedTradingHours,
    @visibleForTesting Map<String, TimeRange?>? testDailyTradingHours,
  }) {
    final dailyTradingHoursToUse = testDailyTradingHours ?? dailyTradingHours;

    final dailyTimesFromCombinedRanges = getDailyTradingHoursFromCombinedMap(
      testTradingHourMap: testCombinedTradingHours,
    );

    for (final key in dailyTradingHoursToUse.keys) {
      final dailyTradingHours = dailyTradingHoursToUse[key];
      final hasDailyTradingHoursSet = dailyTradingHours != null;
      if (hasDailyTradingHoursSet) {
        dailyTimesFromCombinedRanges[key] = dailyTradingHours;
      }
    }

    return dailyTimesFromCombinedRanges;
  }

  /// Extrapolates the entries in the combined map into a daily map
  @visibleForTesting
  Map<String, TimeRange> getDailyTradingHoursFromCombinedMap({
    @visibleForTesting Map<String, TimeRange?>? testTradingHourMap,
  }) {
    final mapToUse = testTradingHourMap ?? combinedTradingHours;

    final Map<String, TimeRange> extrapolatedDailyMap = {};

    for (final combinedKey in mapToUse.keys) {
      if (mapToUse[combinedKey] != null) {
        final keysToUpdates = getDayKeysFromCombinedKey(combinedKey);
        for (final key in keysToUpdates) {
          extrapolatedDailyMap[key] = mapToUse[combinedKey]!;
        }
      }
    }

    return extrapolatedDailyMap;
  }

  /// Sets the [TimeRange] for the key passed in using using the [type] value
  /// to select the correct map
  @visibleForTesting
  void setTimeRangeForMap({
    required String key,
    required TradingHoursMapType type,
    required TimeRange timeRange,
  }) {
    if (type == TradingHoursMapType.combined) {
      combinedTradingHours[key] = timeRange;
    } else {
      dailyTradingHours[key] = timeRange;
    }

    notifyListeners();
  }

  /// Adds a [TimeRange] when toggling on. And sets to null when toggling off for
  /// the key provided
  @visibleForTesting
  void toggleTradingHoursForMap(String key, TradingHoursMapType type) {
    final Map<String, TimeRange?> mapToUse =
        type == TradingHoursMapType.combined
            ? combinedTradingHours
            : dailyTradingHours;
    final currentValueForKey = mapToUse[key];
    if (currentValueForKey == null) {
      if (type == TradingHoursMapType.combined) {
        resetDaily();
        combinedTradingHours[key] = DefaultTimeRange;
      } else {
        dailyTradingHours[key] = DefaultTimeRange;
      }
    } else {
      if (type == TradingHoursMapType.combined) {
        resetDaily();
        combinedTradingHours[key] = null;
      } else {
        dailyTradingHours[key] = null;
      }
    }

    notifyListeners();
  }

  Map<String, TimeRange?>
      createCombinedTradingHoursMapFromDailyTradingHoursMap({
    Map<String, TimeRange?>? tradingHours,
  }) {
    final combinedHoursCopy =
        Map<String, TimeRange?>.from(combinedTradingHours);

    if (tradingHours != null && tradingHours.isNotEmpty) {
      final matchingCombinedKeys =
          getCombinedKeysFromDailyTradingHoursMap(tradingHours: tradingHours);

      if (matchingCombinedKeys.contains(DayUtil.EVERYDAY)) {
        combinedHoursCopy[DayUtil.EVERYDAY] = tradingHours.entries.first.value;
      } else {
        if (matchingCombinedKeys.contains(DayUtil.WEEKDAYS)) {
          combinedHoursCopy[DayUtil.WEEKDAYS] = tradingHours[DayUtil.MONDAY];
        }
        if (matchingCombinedKeys.contains(DayUtil.WEEKENDS)) {
          combinedHoursCopy[DayUtil.WEEKENDS] = tradingHours[DayUtil.SUNDAY];
        }
      }
    }

    return combinedHoursCopy;
  }

  /// Returns a list of strings that tell you which combined key the map matches
  @visibleForTesting
  List<String> getCombinedKeysFromDailyTradingHoursMap(
      {Map<String, TimeRange?>? tradingHours}) {
    if (tradingHours != null) {
      // This check will return true if there's any item in the list that's different
      // from any other one
      final allDaysMatch = tradingHours[DayUtil.MONDAY] ==
              tradingHours[DayUtil.TUESDAY] &&
          tradingHours[DayUtil.TUESDAY] == tradingHours[DayUtil.WEDNESDAY] &&
          tradingHours[DayUtil.WEDNESDAY] == tradingHours[DayUtil.THURSDAY] &&
          tradingHours[DayUtil.THURSDAY] == tradingHours[DayUtil.FRIDAY] &&
          tradingHours[DayUtil.FRIDAY] == tradingHours[DayUtil.SATURDAY] &&
          tradingHours[DayUtil.SATURDAY] == tradingHours[DayUtil.SUNDAY] &&
          tradingHours[DayUtil.SUNDAY] == tradingHours[DayUtil.MONDAY];

      if (allDaysMatch) {
        return [DayUtil.EVERYDAY];
      }

      final List<String> combinedKeyMatches = [];
      for (final combinedKey in combinedTradingHours.keys) {
        final hasMatch = _checkIfMapMatchesCombinedKeyPattern(
          key: combinedKey,
          tradingHours: tradingHours,
        );

        if (hasMatch) {
          combinedKeyMatches.add(combinedKey);
        }
      }
      return combinedKeyMatches;
    }

    return [];
  }

  @visibleForTesting
  Map<String, TimeRange?> createDailyTradingHoursFromExistingTradingHours({
    required Map<String, TimeRange?>? existingTradingHours,
  }) {
    if (existingTradingHours != null) {
      // final existingCombinedTradingHoursMap =
      //     createCombinedTradingHoursMapFromDailyTradingHoursMap(
      //   tradingHours: existingTradingHours,
      // );
      final dailyKeysToTransfer = getDailyKeysNotCoveredInCombinedRange(
        combinedTradingHoursMap: existingTradingHours,
      );

      for (final dayKey in dailyKeysToTransfer) {
        dailyTradingHours[dayKey] = existingTradingHours[dayKey];
      }
    }

    return dailyTradingHours;
  }

  /// Returns a list of daily keys that is not covered by the combined
  /// trading hours map.
  @visibleForTesting
  List<String> getDailyKeysNotCoveredInCombinedRange({
    required Map<String, TimeRange?> combinedTradingHoursMap,
  }) {
    // If every day is covered then there are no keys that are not covered by the combined
    // trading hour range
    if (combinedTradingHoursMap[DayUtil.EVERYDAY] != null) {
      return [];
    }

    if (combinedTradingHoursMap[DayUtil.WEEKENDS] != null &&
        combinedTradingHoursMap[DayUtil.WEEKDAYS] != null) {
      return [];
    }

    if (combinedTradingHoursMap[DayUtil.WEEKENDS] != null) {
      return getDayKeysFromCombinedKey(DayUtil.WEEKDAYS);
    }

    if (combinedTradingHoursMap[DayUtil.WEEKDAYS] != null) {
      return getDayKeysFromCombinedKey(DayUtil.WEEKENDS);
    }

    return getDayKeysFromCombinedKey(DayUtil.EVERYDAY);
  }

  bool _checkIfMapMatchesCombinedKeyPattern({
    required String key,
    required Map<String, TimeRange?> tradingHours,
  }) {
    final daysToCheck = getDayKeysFromCombinedKey(key);
    TimeRange? timeToCompareTo;
    for (final dayKey in daysToCheck) {
      if (timeToCompareTo == null) {
        timeToCompareTo = tradingHours[dayKey];
      } else {
        if (timeToCompareTo != tradingHours[dayKey]) {
          return false;
        }
      }
    }

    return true;
  }

  List<String> getDayKeysFromCombinedKey(String combinedKey) {
    switch (combinedKey) {
      case DayUtil.WEEKENDS:
        return [
          DayUtil.SATURDAY,
          DayUtil.SUNDAY,
        ];
      case DayUtil.WEEKDAYS:
        return [
          DayUtil.MONDAY,
          DayUtil.TUESDAY,
          DayUtil.WEDNESDAY,
          DayUtil.THURSDAY,
          DayUtil.FRIDAY,
        ];

      case DayUtil.EVERYDAY:
      default:
        return [
          DayUtil.MONDAY,
          DayUtil.TUESDAY,
          DayUtil.WEDNESDAY,
          DayUtil.THURSDAY,
          DayUtil.FRIDAY,
          DayUtil.SATURDAY,
          DayUtil.SUNDAY,
        ];
    }
  }
}

extension WeekDayUtils on WeekDay {
  static List<String> list() {
    return WeekDay.values.map((day) => day.getString()).toList();
  }

  String getString() {
    return this.toString().split('.').last;
  }

  int get getDayNumber {
    switch (this) {
      case WeekDay.Monday:
        return DateTime.monday;

      case WeekDay.Tuesday:
        return DateTime.tuesday;

      case WeekDay.Wednesday:
        return DateTime.wednesday;

      case WeekDay.Thursday:
        return DateTime.thursday;

      case WeekDay.Friday:
        return DateTime.friday;

      case WeekDay.Saturday:
        return DateTime.saturday;

      case WeekDay.Sunday:
        return DateTime.sunday;
    }
  }
}

enum WeekDay {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}
