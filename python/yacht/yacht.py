def sum_occurrences(dice, value):
    return sum(filter(lambda number: number == value, dice))


def ones(dice):
    return sum_occurrences(dice, 1)


def twos(dice):
    return sum_occurrences(dice, 2)


def threes(dice):
    return sum_occurrences(dice, 3)


def fours(dice):
    return sum_occurrences(dice, 4)


def fives(dice):
    return sum_occurrences(dice, 5)


def sixes(dice):
    return sum_occurrences(dice, 6)


def calculate_choice(dice):
    return sum(dice)


def is_yacht(dice):
    first = dice[0]
    if all(map(lambda number: number == first, dice)):
        return 50
    return 0


def little_straight(dice):
    expected = [1, 2, 3, 4, 5]
    dice.sort()
    if dice == expected:
        return 30
    return 0


def big_straight(dice):
    expected = [2, 3, 4, 5, 6]
    dice.sort()
    if dice == expected:
        return 30
    return 0


def count_occurrences(dice):
    counts = {}
    for value in dice:
        try:
            counts[value]
        except:
            counts[value] = 1
        else:
            counts[value] += 1
    return counts


def full_house(dice):
    card_counts = list(count_occurrences(dice).values())
    card_counts.sort()
    if card_counts == [2, 3]:
        return sum(dice)
    return 0


def four_of_a_kind(dice):
    counts = list(count_occurrences(dice).items())
    filtered_counts = [entry for entry in counts if entry[1] >= 4]
    try:
        filtered_counts[0]
    except:
        return 0
    else:
        dice_value = filtered_counts[0][0]
        return 4 * dice_value


YACHT = is_yacht
ONES = ones
TWOS = twos
THREES = threes
FOURS = fours
FIVES = fives
SIXES = sixes
FULL_HOUSE = full_house
FOUR_OF_A_KIND = four_of_a_kind
LITTLE_STRAIGHT = little_straight
BIG_STRAIGHT = big_straight
CHOICE = calculate_choice


def score(dice, category_function):
    return category_function(dice)
