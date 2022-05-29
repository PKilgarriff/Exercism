/// <reference path="./global.d.ts" />
// @ts-check

export const cookingStatus = (timeRemaining) => {
  if (timeRemaining === undefined) {
    return "You forgot to set the timer.";
  } else if (timeRemaining > 0) {
    return "Not done, please wait.";
  } else {
    return "Lasagna is done.";
  }
};

export const preparationTime = (layers, averagePreparationTime = 2) => {
  return layers.length * averagePreparationTime;
};

const countLayers = (layers, type) => {
  return layers.filter((layer) => {
    return layer === type;
  }).length;
};

const GRAMS_OF_NOODLES_PER_LAYER = 50;
const LITRES_OF_SAUCE_PER_LAYER = 0.2;

export const quantities = (layers) => {
  return {
    noodles: countLayers(layers, "noodles") * GRAMS_OF_NOODLES_PER_LAYER,
    sauce: countLayers(layers, "sauce") * LITRES_OF_SAUCE_PER_LAYER,
  };
};

export const addSecretIngredient = (friendsList, myList) => {
  myList.push(friendsList[friendsList.length - 1]);
};

export const scaleRecipe = (recipe, portions) => {
  let scaleFactor = portions / 2;
  const scaledRecipe = {};
  Object.keys(recipe).forEach((key) => {
    scaledRecipe[key] = recipe[key] * scaleFactor;
  });
  return scaledRecipe;
};
