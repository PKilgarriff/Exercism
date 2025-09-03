import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Graph {
  private List<Node> nodes = new ArrayList<>();
  private List<Edge> edges = new ArrayList<>();;
  private Map<String, String> attributes = new HashMap<>();

  public Graph() {
  }

  public Graph(Map<String, String> attributes) {
    this.attributes.putAll(attributes);
  }

  public Collection<Node> getNodes() {
    return this.nodes;
  }

  public Collection<Edge> getEdges() {
    return this.edges;
  }

  public Graph node(String name) {
    this.nodes.add(new Node(name));
    return this;
  }

  public Graph node(String name, Map<String, String> attributes) {
    this.nodes.add(new Node(name, attributes));
    return this;
  }

  public Graph edge(String start, String end) {
    this.edges.add(new Edge(start, end));
    return this;
  }

  public Graph edge(String start, String end, Map<String, String> attributes) {
    this.edges.add(new Edge(start, end, attributes));
    return this;
  }

  public Map<String, String> getAttributes() {
    return this.attributes;
  }
}
