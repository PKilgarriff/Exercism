public enum LogLevel {
  UNKNOWN(0),
  TRACE(1),
  DEBUG(2),
  INFO(4),
  WARNING(5),
  ERROR(6),
  FATAL(42);

  private final int logCode;

  LogLevel(int logCode) {
    this.logCode = logCode;
  }

  public int getLogCode() {
    return this.logCode;
  }

  public static LogLevel getLogLevel(String logShortCode) {
    return switch (logShortCode) {
      case "TRC" -> LogLevel.TRACE;
      case "DBG" -> LogLevel.DEBUG;
      case "INF" -> LogLevel.INFO;
      case "WRN" -> LogLevel.WARNING;
      case "ERR" -> LogLevel.ERROR;
      case "FTL" -> LogLevel.FATAL;
      default -> LogLevel.UNKNOWN;
    };
  }

}
