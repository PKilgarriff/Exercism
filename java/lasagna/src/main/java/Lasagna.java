public class Lasagna {
  private static final int PREP_TIME_PER_LAYER = 2;
  private static final int LASAGNA_BAKE_TIME = 40;

  public int expectedMinutesInOven() {
    return LASAGNA_BAKE_TIME;
  }

  public int remainingMinutesInOven(int actualMinutesInOven) {
    return this.expectedMinutesInOven() - actualMinutesInOven;
  }

  public int preparationTimeInMinutes(int layerCount) {
    return PREP_TIME_PER_LAYER * layerCount;
  }

  public int totalTimeInMinutes(int layerCount, int actualMinutesInOven) {
    return this.preparationTimeInMinutes(layerCount) + actualMinutesInOven;
  }
}
