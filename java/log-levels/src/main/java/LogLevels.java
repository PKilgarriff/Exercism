public class LogLevels {
  private static final String COLON_CHARACTER = ":";

  public static String message(String logLine) {
    return logLine.substring(logLine.indexOf(COLON_CHARACTER) + 1).trim();
  }

  public static String logLevel(String logLine) {
    return logLine.substring(1, logLine.indexOf(COLON_CHARACTER) - 1).toLowerCase();
  }

  public static String reformat(String logLine) {
    return message(logLine) + " (" + logLevel(logLine) + ")";
  }
}
