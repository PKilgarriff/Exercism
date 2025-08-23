class ProductionRemoteControlCar implements RemoteControlCar, Comparable<ProductionRemoteControlCar> {
  private static final int SPEED = 10;

  private int distanceTravelled = 0;
  private int numberOfVictories = 0;

  public void drive() {
    distanceTravelled += SPEED;
  }

  public int getDistanceTravelled() {
    return this.distanceTravelled;
  }

  public int getNumberOfVictories() {
    return this.numberOfVictories;
  }

  public void setNumberOfVictories(int numberOfVictories) {
    this.numberOfVictories = numberOfVictories;
  }

  public int compareTo(ProductionRemoteControlCar carToCompareTo) {
    return carToCompareTo.getNumberOfVictories() - this.getNumberOfVictories();
  }
}
