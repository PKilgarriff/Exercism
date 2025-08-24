import java.util.HashSet;
import java.util.List;
import java.util.Set;

class GottaSnatchEmAll {

  static Set<String> newCollection(List<String> cards) {
    return new HashSet<>(cards);
  }

  static boolean addCard(String card, Set<String> collection) {
    return collection.add(card);
  }

  static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
    // there are cards in the first set that are not in the second set
    Set<String> myCardsToTrade = new HashSet<>(myCollection);
    myCardsToTrade.removeAll(theirCollection);

    // AND there are cards in the second set that are not in the first set
    Set<String> theirCardsToTrade = new HashSet<>(theirCollection);
    theirCardsToTrade.removeAll(myCollection);

    return !myCardsToTrade.isEmpty() && !theirCardsToTrade.isEmpty();
  }

  static Set<String> commonCards(List<Set<String>> collections) {
    Set<String> commonCards = new HashSet<>(collections.get(0));
    collections.forEach(commonCards::retainAll);
    return commonCards;
  }

  static Set<String> allCards(List<Set<String>> collections) {
    Set<String> combinedCollections = new HashSet<>();
    collections.forEach(combinedCollections::addAll);
    return combinedCollections;
  }
}
