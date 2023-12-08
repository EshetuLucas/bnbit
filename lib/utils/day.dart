class DayUtil {
  static const MONDAY = 'Monday';

  static const TUESDAY = 'Tuesday';

  static const WEDNESDAY = 'Wednesday';

  static const THURSDAY = 'Thursday';

  static const FRIDAY = 'Friday';

  static const SATURDAY = 'Saturday';

  static const SUNDAY = 'Sunday';

  // Const used for setting trading hours
  static const EVERYDAY = 'Everyday';
  static const WEEKENDS = 'Weekends';
  static const WEEKDAYS = 'Weekdays';

  static int getDayNumber(String dayName) {
    switch (dayName) {
      case MONDAY:
        return DateTime.monday;

      case TUESDAY:
        return DateTime.tuesday;

      case WEDNESDAY:
        return DateTime.wednesday;

      case THURSDAY:
        return DateTime.thursday;

      case FRIDAY:
        return DateTime.friday;

      case SATURDAY:
        return DateTime.saturday;

      case SUNDAY:
        return DateTime.sunday;

      default:
        return -1;
    }
  }

  static String getDay(int weekDay) {
    switch (weekDay) {
      case 1:
        return MONDAY;

      case 2:
        return TUESDAY;

      case 3:
        return WEDNESDAY;

      case 4:
        return THURSDAY;

      case 5:
        return FRIDAY;

      case 6:
        return SATURDAY;

      case 0:
        return SUNDAY;

      default:
        return SUNDAY;
    }
  }
}
