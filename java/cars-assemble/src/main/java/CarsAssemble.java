public class CarsAssemble {
  private static final int BASE_PRODUCTION = 221;
  private static final int MINUTES_IN_AN_HOUR = 60;

  public double productionRatePerHour(int speed) {
    double successModifier;

    if (speed == 10) {
      // 10: 77% success rate.
      successModifier = 0.77;
    } else if (speed == 9) {
      // 9: 80% success rate.
      successModifier = 0.8;
    } else if (speed >= 5) {
      // 5 to 8: 90% success rate.
      successModifier = 0.9;
    } else {
      // 1 to 4: 100% success rate.
      successModifier = 1.0;
    }

    return BASE_PRODUCTION * speed * successModifier;
  }

  public int workingItemsPerMinute(int speed) {
    return (int) (productionRatePerHour(speed) / MINUTES_IN_AN_HOUR);
  }
}
