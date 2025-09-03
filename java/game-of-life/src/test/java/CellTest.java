import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class CellTest {
  @Test
  @DisplayName("Live cells with zero live neighbors die")
  public void testLiveCellsWithZeroLiveNeighborsDie() {
    assertFalse(new Cell(true, 0).shouldBeAliveNextTick());
  }

  @Test
  @DisplayName("Live cells with only one live neighbor die")
  public void testLiveCellsWithOnlyOneLiveNeighborsDie() {
    assertFalse(new Cell(true, 1).shouldBeAliveNextTick());
  }

  @Test
  @DisplayName("Live cells with two live neighbors stay alive")
  public void testLiveCellsWithTwoLiveNeighborsStayAlive() {
    assertTrue(new Cell(true, 2).shouldBeAliveNextTick());
  }

  @Test
  @DisplayName("Live cells with three live neighbors stay alive")
  public void testLiveCellsWithThreeLiveNeighborsStayAlive() {
    assertTrue(new Cell(true, 3).shouldBeAliveNextTick());
  }

  @Test
  @DisplayName("Live cells with four or more neighbors die")
  public void testLiveCellsWithFourOrMoreNeighborsDie() {
    assertFalse(new Cell(true, 4).shouldBeAliveNextTick());
  }

  @Test
  @DisplayName("Dead cells with three live neighbors become alive")
  public void testDeadCellsWithThreeLiveNeighborsBecomeAlive() {
    assertTrue(new Cell(false, 3).shouldBeAliveNextTick());
  }

}
