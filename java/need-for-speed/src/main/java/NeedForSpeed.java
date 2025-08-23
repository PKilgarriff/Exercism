class NeedForSpeed {
  private static final int NITRO_SPEED = 50;
  private static final int NITRO_BATTERY_DRAIN = 4;

  private final int speed;
  private final int batteryDrain;

  private int distanceDriven = 0;
  private int battery = 100;

  NeedForSpeed(int speed, int batteryDrain) {
    this.speed = speed;
    this.batteryDrain = batteryDrain;
  }

  public boolean batteryDrained() {
    return battery <= 0;
  }

  public int distanceDriven() {
    return distanceDriven;
  }

  public void drive() {
    if (!batteryDrained()) {
      distanceDriven += speed;
      battery -= batteryDrain;
    }
  }

  public static NeedForSpeed nitro() {
    return new NeedForSpeed(NITRO_SPEED, NITRO_BATTERY_DRAIN);
  }
}

class RaceTrack {
  private final int distance;

  RaceTrack(int distance) {
    this.distance = distance;
  }

  public boolean tryFinishTrack(NeedForSpeed car) {
    while (!car.batteryDrained()) car.drive();
    return distance <= car.distanceDriven();
  }
}
