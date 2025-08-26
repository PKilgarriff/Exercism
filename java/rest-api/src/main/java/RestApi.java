import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

class RestApi {
  private static final String USERS_PATH = "/users";
  private static final String ADD_PATH = "/add";
  private static final String IOU_PATH = "/iou";

  private static final String USERS_KEY = "users";

  private ArrayList<User> users = new ArrayList<>();

  RestApi(User... users) {
    Arrays.asList(users).forEach(user -> this.users.add(user));
  }

  String get(String url) {
    return switch (url) {
      case USERS_PATH -> buildUsersResponse(getUsersPath());
      default -> null;
    };
  }

  String get(String url, JSONObject payload) {
    return switch (url) {
      case USERS_PATH -> buildUsersResponse(getUsers((JSONArray) payload.get(USERS_KEY)));
      default -> null;
    };
  }

  String post(String url, JSONObject payload) {
    return switch (url) {
      case IOU_PATH -> createIou(payload);
      case ADD_PATH -> createUser(payload);
      default -> null;
    };
  }

  String createIou(JSONObject payload) {
    double amount = (double) payload.get("amount");
    String borrowerName = (String) payload.get("borrower");
    String lenderName = (String) payload.get("lender");

    // update borrower
    User borrower = getUsers(List.of(borrowerName)).get(0);
    borrower.addIouAsBorrower(new Iou(lenderName, amount));
    // update lender
    User lender = getUsers(List.of(lenderName)).get(0);
    lender.addIouAsLender(new Iou(borrowerName, amount));

    return buildUsersResponse(getUsers(List.of(borrowerName, lenderName)));
  }

  String createUser(JSONObject payload) {
    String newUserName = (String) payload.get("user");
    User newUser = User.builder().setName(newUserName).build();

    this.users.add(newUser);

    return newUser.toJSONObject().toString();
  }

  private String buildUsersResponse(List<User> users) {
    JSONArray usersAsJSONArray = new JSONArray();
    users.forEach(user -> usersAsJSONArray.put(user.toJSONObject()));
    return new JSONObject().put(USERS_KEY, usersAsJSONArray).toString();
  }

  private List<User> getUsersPath() {
    return this.users;
  }

  private List<User> getUsers(JSONArray namesToReturn) {
    List<String> names = jsonArrayToList(namesToReturn);
    return getUsers(names);
  }

  private List<User> getUsers(List<String> names) {
    return this.users.stream()
        .filter(user -> names.contains(user.name()))
        .sorted(Comparator.comparing(User::name))
        .toList();
  }

  private List<String> jsonArrayToList(JSONArray jsonArray) {
    List<String> list = new ArrayList<>();
    jsonArray.forEach(item -> list.add(item.toString()));
    return list;
  }

}