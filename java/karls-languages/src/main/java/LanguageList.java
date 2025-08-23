import java.util.ArrayList;
import java.util.List;

public class LanguageList {
  private static final List<String> EXCITING_LANGUAGES = List.of("Java", "Kotlin");

  private final List<String> languages = new ArrayList<>();

  public boolean isEmpty() {
    return languages.isEmpty();
  }

  public void addLanguage(String language) {
    languages.add(language);
  }

  public void removeLanguage(String language) {
    languages.removeIf(languageInList -> languageInList.equals(language));
  }

  public String firstLanguage() {
    return languages.get(0);
  }

  public int count() {
    return languages.size();
  }

  public boolean containsLanguage(String language) {
    return languages.contains(language);
  }

  public boolean isExciting() {
    return EXCITING_LANGUAGES.stream().anyMatch(this::containsLanguage);
  }
}
