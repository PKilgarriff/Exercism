public class LogLine {
  private String logLine;

  public LogLine(String logLine) {
    this.logLine = logLine;
  }

  public LogLevel getLogLevel() {
    String logShortCode = this.logLine.substring(1, 4);
    return LogLevel.getLogLevel(logShortCode);
  }

  public String getOutputForShortLog() {
    int logCode = getLogLevel().getLogCode();
    String logMessage = this.logLine.substring(7);
    return logCode + ":" + logMessage;
  }
}
