import java.util.Arrays;

class BirdWatcher {
  private final int[] birdsPerDay;
  private static final int BUSY_THRESHOLD = 5;

  public BirdWatcher(int[] birdsPerDay) {
    this.birdsPerDay = birdsPerDay.clone();
  }

  public int[] getLastWeek() {
    return birdsPerDay;
  }

  public int getToday() {
    return getLastWeek()[getLastWeek().length - 1];
  }

  public void incrementTodaysCount() {
    getLastWeek()[getLastWeek().length - 1]++;
  }

  public boolean hasDayWithoutBirds() {
    return Arrays.stream(getLastWeek()).anyMatch(dayCount -> dayCount == 0);
  }

  public int getCountForFirstDays(int numberOfDays) {
    return Arrays.stream(Arrays.copyOfRange(getLastWeek(), 0, numberOfDays)).sum();
  }

  public int getBusyDays() {
    return Arrays.stream(getLastWeek()).filter(this::isBusyDay).toArray().length;
  }

  private boolean isBusyDay(int dayCount) {
    return dayCount >= BUSY_THRESHOLD;
  }
}
