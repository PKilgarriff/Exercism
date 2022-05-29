// @ts-check

import {
  purchaseInventoryIfAvailable,
  isServiceOnline,
  pickAndPurchaseFruit,
  pickFruit,
} from "./fruit-picker";
import {
  setStatus,
  resetStatus,
  setResponse,
  getLastQuery,
  resetQuery,
} from "./grocer";

describe("service status", () => {
  beforeEach(() => {
    resetStatus();
  });

  test("returns the initial status of the service", () => {
    expect(isServiceOnline()).toBe(false);
  });

  test("returns the status when service is online", () => {
    setStatus("ONLINE");
    expect(isServiceOnline()).toBe(true);
  });
});

describe("inventory service", () => {
  beforeEach(() => {
    resetQuery();
  });

  xtest("uses the query format", () => {
    pickFruit("strawberry", 5, () => "PURCHASE");
    expect(getLastQuery()).toEqual({
      variety: "strawberry",
      quantity: 5,
    });
  });

  xtest("takes parameters for the query", () => {
    pickFruit("blueberry", 20, () => "PURCHASE");
    expect(getLastQuery()).toEqual({
      variety: "blueberry",
      quantity: 20,
    });
  });

  xtest("returns synchronously", () => {
    expect(pickFruit("melon", 1, () => "PURCHASE")).toBe("PURCHASE");
  });

  xtest("returns the inventory status", () => {
    expect(pickFruit("melon", 1, () => "NOOP")).toBe("NOOP");
  });
});

describe("inventory result callback", () => {
  xtest("throws error if receives inventory error", () => {
    expect(() => {
      purchaseInventoryIfAvailable("inventory error", undefined);
    }).toThrow();
  });

  xtest('returns "PURCHASE" when inventory is available', () => {
    expect(purchaseInventoryIfAvailable(null, true)).toBe("PURCHASE");
  });

  xtest('returns "NOOP" when inventory is unavailable', () => {
    expect(purchaseInventoryIfAvailable(null, false)).toBe("NOOP");
  });
});

describe("putting it together", () => {
  beforeEach(() => {
    resetQuery();
  });

  xtest("uses the query format", () => {
    setResponse(null, true);
    pickAndPurchaseFruit("jackfruit", 15);
    expect(getLastQuery()).toEqual({
      variety: "jackfruit",
      quantity: 15,
    });
  });

  xtest("takes parameters for the query", () => {
    setResponse(null, true);
    pickAndPurchaseFruit("raspberry", 30);
    expect(getLastQuery()).toEqual({
      variety: "raspberry",
      quantity: 30,
    });
  });

  xtest("throws error if receives inventory error", () => {
    expect(() => {
      pickAndPurchaseFruit("honeydew", 3);
    }).toThrow();
  });

  xtest('returns "NOOP" if quantity not available', () => {
    setResponse(null, false);
    expect(pickAndPurchaseFruit("apples", 12)).toBe("NOOP");
  });

  xtest('returns "PURCHASE" if quantity available', () => {
    setResponse(null, true);
    expect(pickAndPurchaseFruit("oranges", 22)).toBe("PURCHASE");
  });
});
