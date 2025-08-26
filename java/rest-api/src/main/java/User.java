import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

/** POJO representing a User in the database. */
public class User {
  private final String name;
  private final Map<String, Double> ious = new HashMap<>();

  private User(String name, List<Iou> owes, List<Iou> owedBy) {
    this.name = name;
    owes.forEach(iou -> this.ious.put(iou.name, -iou.amount));
    owedBy.forEach(iou -> this.ious.put(iou.name, iou.amount));
  }

  public String name() {
    return name;
  }

  /** IOUs this user owes to other users. */
  public List<Iou> owes() {
    return this.ious.entrySet().stream()
        .filter(entry -> entry.getValue() < 0)
        .map(entry -> new Iou(entry.getKey(), Math.abs(entry.getValue())))
        .toList();
  }

  /** IOUs this user is owed by other users. */
  public List<Iou> owedBy() {
    return this.ious.entrySet().stream()
        .filter(entry -> entry.getValue() > 0)
        .map(entry -> new Iou(entry.getKey(), entry.getValue()))
        .toList();
  }

  public void addIouAsBorrower(Iou iou) {
    String lender = iou.name;
    double currentStanding = this.ious.getOrDefault(lender, 0.0);

    currentStanding -= iou.amount;

    updateIous(lender, currentStanding);
  }

  public void addIouAsLender(Iou iou) {
    String borrower = iou.name;
    double currentStanding = this.ious.getOrDefault(borrower, 0.0);

    currentStanding += iou.amount;

    updateIous(borrower, currentStanding);
  }

  private void updateIous(String name, double newAmount) {
    if (newAmount == 0) {
      this.ious.remove(name);
    } else {
      this.ious.put(name, newAmount);
    }
  }

  public double getBalance() {
    return this.ious.values().stream()
        .reduce(Double::sum)
        .orElse(0.0);
  }

  public static Builder builder() {
    return new Builder();
  }

  public static class Builder {
    private String name;
    private final List<Iou> owes = new ArrayList<>();
    private final List<Iou> owedBy = new ArrayList<>();

    public Builder setName(String name) {
      this.name = name;
      return this;
    }

    public Builder owes(String name, double amount) {
      owes.add(new Iou(name, amount));
      return this;
    }

    public Builder owedBy(String name, double amount) {
      owedBy.add(new Iou(name, amount));
      return this;
    }

    public User build() {
      return new User(name, owes, owedBy);
    }
  }

  public JSONObject toJSONObject() {
    JSONObject owesJSON = new JSONObject();
    JSONObject owedByJSON = new JSONObject();

    this.owes().forEach(iou -> owesJSON.put(iou.name, iou.amount));
    this.owedBy().forEach(iou -> owedByJSON.put(iou.name, iou.amount));

    return new JSONObject()
        .put("name", this.name)
        .put("balance", this.getBalance())
        .put("owes", owesJSON)
        .put("owedBy", owedByJSON);
  }
}
