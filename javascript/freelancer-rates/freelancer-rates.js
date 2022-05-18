// @ts-check

// The number of hours the freelancer works per day
const HOURS_PER_WORKING_DAY = 8;
// Billable days in a month
const BILLABLE_DAYS_PER_MONTH = 22;

/**
 * The day rate, given a rate per hour
 *
 * @param {number} ratePerHour
 * @returns {number} the rate per day
 */
export function dayRate(ratePerHour) {
  return HOURS_PER_WORKING_DAY * ratePerHour;
}

/**
 * Calculates the number of days in a budget, rounded down
 *
 * @param {number} budget: the total budget
 * @param {number} ratePerHour: the rate per hour
 * @returns {number} the number of days
 */
export function daysInBudget(budget, ratePerHour) {
  return Math.floor(budget / dayRate(ratePerHour));
}

/**
 * Calculates the discounted rate for large projects, rounded up
 *
 * @param {number} ratePerHour
 * @param {number} numDays: number of days the project spans
 * @param {number} discount: for example 20% written as 0.2
 * @returns {number} the rounded up discounted rate
 */
export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  let fullpriceDays = numDays % BILLABLE_DAYS_PER_MONTH;
  let discountDays = numDays - fullpriceDays;
  let discountChargedDays = (1 - discount) * discountDays;
  let totalCost = (discountChargedDays + fullpriceDays) * dayRate(ratePerHour);
  return Math.ceil(totalCost); 
}
