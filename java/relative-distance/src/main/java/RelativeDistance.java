import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;

public class RelativeDistance {
  private Map<String, Set<String>> familyGraph;

  public RelativeDistance(Map<String, List<String>> familyTree) {
    this.familyGraph = createGraph(familyTree);
  }

  private Map<String, Set<String>> createGraph(Map<String, List<String>> familyTree) {
    Map<String, Set<String>> graph = new HashMap<>();

    for (Entry<String, List<String>> entry : familyTree.entrySet()) {
      String parent = entry.getKey();
      List<String> children = entry.getValue();
      children.forEach(child -> {
        graph.computeIfAbsent(parent, key -> new HashSet<>()).add(child); // Add parent with link to child
        graph.computeIfAbsent(child, key -> new HashSet<>()).add(parent); // Add child with link to parent

        // Add siblings to each child (duplicates prevented by set)
        children.forEach(sibling -> {
          if (!sibling.equals(child))
            graph.get(child).add(sibling);
        });
      });
    }

    return graph;
  }

  public int degreeOfSeparation(String personA, String personB) {
    Queue<String> queue = new ArrayDeque<>();
    Map<String, Integer> distanceMap = new HashMap<>();

    queue.add(personA);
    distanceMap.put(personA, 0);

    while (!queue.isEmpty()) {
      String currentRelative = queue.poll();
      int currentDistance = distanceMap.get(currentRelative);

      for (String relative : familyGraph.getOrDefault(currentRelative, Set.of())) {
        if (distanceMap.computeIfAbsent(relative, key -> currentDistance + 1) == currentDistance + 1) {
          queue.add(relative);
        }
      }
    }

    return distanceMap.getOrDefault(personB, -1);
  }
}
