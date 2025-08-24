import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

class AppointmentScheduler {
  private static final LocalDate OPENING_DATE = LocalDate.of(2012, Month.SEPTEMBER, 15);
  private static final DateTimeFormatter INPUT_FORMAT = DateTimeFormatter.ofPattern("M/d/u k:m:s", Locale.ENGLISH);
  private static final DateTimeFormatter OUTPUT_FORMAT = DateTimeFormatter.ofPattern("EEEE, LLLL d, u', at 'h:mm a",
      Locale.ENGLISH);

  public LocalDateTime schedule(String appointmentDateDescription) {
    return LocalDateTime.parse(appointmentDateDescription, INPUT_FORMAT);
  }

  public boolean hasPassed(LocalDateTime appointmentDate) {
    return appointmentDate.isBefore(LocalDateTime.now());
  }

  public boolean isAfternoonAppointment(LocalDateTime appointmentDate) {
    // >= 12:00 and < 18:00
    return (appointmentDate.getHour() >= 12 && appointmentDate.getHour() < 18);
  }

  public String getDescription(LocalDateTime appointmentDate) {
    return "You have an appointment on " + appointmentDate.format(OUTPUT_FORMAT) + ".";
  }

  public LocalDate getAnniversaryDate() {
    return LocalDate.of(LocalDate.now().getYear(), OPENING_DATE.getMonth(), OPENING_DATE.getDayOfMonth());
  }
}
