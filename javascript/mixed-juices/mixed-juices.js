// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

const DEFAULT_PREP_TIME = 2.5;

const preparationTimes = {
  'Pure Strawberry Joy': 0.5,
  'Energizer': 1.5,
  'Green Garden': 1.5,
  'Tropical Island': 3,
  'All or Nothing': 5,
};

const wedgesFromLime = {
  'small': 6,
  'medium': 8,
  'large': 10
};

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  return preparationTimes[name] || DEFAULT_PREP_TIME;
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  if (wedgesNeeded === 0) { return 0 }
  let currentWedges = 0;
  for (let i = 0; i < limes.length; i++ ) {
    currentWedges += wedgesFromLime[limes[i]];
    if (currentWedges >= wedgesNeeded) {
      return i + 1;
    }
  };
  return limes.length;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  while (timeLeft > 0) {
    let currentOrder = orders.shift();
    timeLeft -= preparationTimes[currentOrder] || DEFAULT_PREP_TIME;
  }
  return orders;
}
