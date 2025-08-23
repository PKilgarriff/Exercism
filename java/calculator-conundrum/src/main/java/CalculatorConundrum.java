class CalculatorConundrum {
  public String calculate(int operand1, int operand2, String operation) throws IllegalOperationException {
    if (operation == null) {
      throw new IllegalArgumentException("Operation cannot be null");
    } else if (operation.isEmpty()) {
      throw new IllegalArgumentException("Operation cannot be empty");
    }

    int result = switch (operation) {
      case "+" -> add(operand1, operand2);
      case "*" -> multiply(operand1, operand2);
      case "/" -> divide(operand1, operand2);
      default -> throw new IllegalOperationException(String.format("Operation '%s' does not exist", operation));
    };

    return formatSum(operand1, operand2, operation, result);
  }

  private int add(int operand1, int operand2) {
    return operand1 + operand2;
  }

  private int multiply(int operand1, int operand2) {
    return operand1 * operand2;
  }

  private int divide(int operand1, int operand2) throws IllegalOperationException {
    try {
      return operand1 / operand2;
    } catch (ArithmeticException exception) {
      throw new IllegalOperationException("Division by zero is not allowed", exception);
    }
  }

  private String formatSum(int operand1, int operand2, String operation, int result) {
    return String.format("%s %s %s = %s", operand1, operation, operand2, result);
  }
}
