/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export const cookingStatus = (timeRemaining) => {
  if (timeRemaining === undefined) {
    return 'You forgot to set the timer.';
  } else if (timeRemaining > 0) {
    return 'Not done, please wait.';
  } else {
    return 'Lasagna is done.';
  }
}

export const preparationTime = (layers, averagePreparationTime = 2) => {
  return layers.length * averagePreparationTime;
}

const countLayers = (layers, type) => {
  return layers.filter((layer) => { return layer === type }).length;
}

const GRAMS_OF_NOODLES_PER_LAYER = 50;
const LITRES_OF_SAUCE_PER_LAYER = 0.2;

export const quantities = (layers) => {
  return {
    noodles: countLayers(layers, 'noodles') * GRAMS_OF_NOODLES_PER_LAYER,
    sauce: countLayers(layers, 'sauce') * LITRES_OF_SAUCE_PER_LAYER,
  }
}