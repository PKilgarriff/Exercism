import java.util.Map;
import java.util.Objects;
import java.util.stream.IntStream;

class SqueakyClean {
  private static final String DASH = "-";
  private static final String UNDERSCORE = "_";
  private static final String SPACE = " ";
  private static final String EMPTY_STRING = "";

  private static final Map<String, String> LEETSPEAK_LOOKUP = Map.of(
      "4", "a",
      "3", "e",
      "0", "o",
      "1", "l",
      "7", "t");

  protected static String spacesToUnderscores(String input) {
    return input.replace(SPACE, UNDERSCORE);
  }

  protected static String setCharacterToUpperCase(String input, int index) {
    return input.substring(0, index - 1) + input.substring(index, index + 1).toUpperCase() + input.substring(index + 1);
  }

  protected static String kebabToCamelCase(String input) {
    String output = input;

    if (input.contains(DASH)) {
      int[] dashIndexes = IntStream.range(0, input.length())
          .filter(index -> Objects.equals(DASH, input.substring(index, index + 1)))
          .toArray();
      for (int index : dashIndexes) {
        output = setCharacterToUpperCase(output, index + 1);
      }
      output = output.replace(DASH, EMPTY_STRING);
    }

    return output;
  }

  protected static String removeNonUnderscoreSpecialCharacters(String input) {
    return input.replaceAll("[^a-zA-Z_]", EMPTY_STRING);
  }

  protected static String decodeLeetspeak(String input) {
    String output = input;

    for (Map.Entry<String, String> entry : LEETSPEAK_LOOKUP.entrySet()) {
      output = output.replace(entry.getKey(), entry.getValue());
    }

    return output;
  }

  static String clean(String identifier) {
    String output = identifier;

    output = spacesToUnderscores(output);
    output = decodeLeetspeak(output);
    output = kebabToCamelCase(output);
    output = removeNonUnderscoreSpecialCharacters(output);

    return output;
  }
}
