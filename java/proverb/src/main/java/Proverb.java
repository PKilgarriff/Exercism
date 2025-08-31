import java.util.ArrayList;
import java.util.List;

class Proverb {
  private final String[] words;

  Proverb(String[] words) {
    this.words = words;
  }

  String recite() {
    if (this.words.length == 0) {
      return "";
    }

    List<String> lines = new ArrayList<>();

    for (int i = 1; i < this.words.length; i++) {
      String thisWord = this.words[i - 1];
      String nextWord = this.words[i];
      lines.add("For want of a " + thisWord + " the " + nextWord + " was lost.");
    }

    lines.add("And all for the want of a " + this.words[0] + ".");

    return String.join("\n", lines);
  }

}
