def ones(dice):
    return sum(filter(lambda number: number == 1, dice,))


def twos(dice):
    return sum(filter(lambda number: number == 2, dice,))


def threes(dice):
    return sum(filter(lambda number: number == 3, dice,))


def fours(dice):
    return sum(filter(lambda number: number == 4, dice,))


def fives(dice):
    return sum(filter(lambda number: number == 5, dice,))


def sixes(dice):
    return sum(filter(lambda number: number == 6, dice,))


def calculate_total(dice):
    return sum(dice)


YACHT = None
ONES = ones
TWOS = twos
THREES = threes
FOURS = fours
FIVES = fives
SIXES = sixes
FULL_HOUSE = None
FOUR_OF_A_KIND = None
LITTLE_STRAIGHT = None
BIG_STRAIGHT = None
CHOICE = calculate_total


def score(dice, category_function):
    return category_function(dice)
