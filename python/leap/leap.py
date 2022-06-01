"""A program to calculate if a given year is a leap-year"""


def leap_year(year):
    """Returns whether a given year is a leap-year

    :param year:int - a year to be checked
    :return:boolean - whether the year is a leap-year
    """
    divisible_by_four = year % 4 == 0
    divisible_by_one_hundred = year % 100 == 0
    divisible_by_four_hundred = year % 400 == 0
    return divisible_by_four and not (divisible_by_one_hundred and not divisible_by_four_hundred)
