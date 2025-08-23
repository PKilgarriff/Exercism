public class ElonsToyCar {
  private int distanceDriven = 0;
  private int battery = 100;

  public static ElonsToyCar buy() {
    return new ElonsToyCar();
  }

  public String distanceDisplay() {
    return "Driven " + distanceDriven + " meters";
  }

  public String batteryDisplay() {
    return battery > 0 ? "Battery at " + battery + "%" : "Battery empty";
  }

  public void drive() {
    if (battery > 0) {
      distanceDriven = distanceDriven + 20;
      battery = battery - 1;
    }
  }
}
