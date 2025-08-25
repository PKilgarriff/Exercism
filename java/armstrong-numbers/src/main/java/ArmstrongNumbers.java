class ArmstrongNumbers {

  boolean isArmstrongNumber(int numberToCheck) {
    String numberAsString = String.valueOf(numberToCheck);
    int numberOfDigits = numberAsString.length();

    int accumulator = 0;

    for (String digit : numberAsString.split("")) {
      double result = Math.pow(Integer.parseInt(digit), numberOfDigits);
      accumulator += result;
    }

    return accumulator == numberToCheck;
  }

}
