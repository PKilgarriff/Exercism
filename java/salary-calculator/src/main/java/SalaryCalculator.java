public class SalaryCalculator {
  private static final double BASE_SALARY = 1000.0;
  private static final double MAXIMUM_SALARY = 2000.0;

  public double salaryMultiplier(int daysSkipped) {
    return daysSkipped >= 5 ? 0.85 : 1.0;
  }

  public int bonusMultiplier(int productsSold) {
    return productsSold >= 20 ? 13 : 10;
  }

  public double bonusForProductsSold(int productsSold) {
    return (double) productsSold * bonusMultiplier(productsSold);
  }

  public double finalSalary(int daysSkipped, int productsSold) {
    double calculatedSalary = (BASE_SALARY * salaryMultiplier(daysSkipped)) + bonusForProductsSold(productsSold);
    return calculatedSalary > MAXIMUM_SALARY ? MAXIMUM_SALARY : calculatedSalary;
  }
}
