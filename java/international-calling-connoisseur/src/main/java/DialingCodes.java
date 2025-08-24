import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class DialingCodes {

  private Map<Integer, String> codes = new HashMap<>();

  public Map<Integer, String> getCodes() {
    return this.codes;
  }

  public void setDialingCode(Integer code, String country) {
    this.codes.put(code, country);
  }

  public String getCountry(Integer code) {
    return this.codes.get(code);
  }

  public void addNewDialingCode(Integer code, String country) {
    if (this.codes.containsKey(code) || this.codes.containsValue(country)) {
      // Do nothing if either code or country are already present in the map
    } else {
      this.codes.put(code, country);
    }
  }

  public Integer findDialingCode(String country) {
    return this.codes.entrySet().stream()
        .filter(entry -> entry.getValue().equals(country))
        .map(Entry::getKey)
        .findFirst()
        .orElse(null);
  }

  public void updateCountryDialingCode(Integer code, String country) {
    Integer currentDialingCode = findDialingCode(country);

    if (currentDialingCode != null) {
      this.codes.remove(currentDialingCode);
      this.codes.put(code, country);
    }
  }
}
