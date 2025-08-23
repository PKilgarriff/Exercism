class Fighter {
  boolean isVulnerable() {
    return true;
  }

  int getDamagePoints(Fighter fighter) {
    return 1;
  }
}

class Warrior extends Fighter {
  @Override
  boolean isVulnerable() {
    return false;
  }

  @Override
  public String toString() {
    return "Fighter is a Warrior";
  }

  @Override
  int getDamagePoints(Fighter fighter) {
    return fighter.isVulnerable() ? 10 : 6;
  }
}

class Wizard extends Fighter {
  private boolean spellPrepared = false;

  @Override
  boolean isVulnerable() {
    return !spellPrepared;
  }

  @Override
  public String toString() {
    return "Fighter is a Wizard";
  }

  public void prepareSpell() {
    spellPrepared = true;
  }

  @Override
  int getDamagePoints(Fighter fighter) {
    return spellPrepared ? 12 : 3;
  }
}
