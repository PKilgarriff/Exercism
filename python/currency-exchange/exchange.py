"""Functions for implementing a currency converter for my imaginary friend Chandler"""


def exchange_money(budget, exchange_rate):
    """Calculate value of exchanged currency

    :param budget: float - amount of money you are planning to exchange.
    :param exchange_rate: float - unit value of the foreign currency.
    :return: float - exchanged value of the foreign currency you can receive.
    """
    return budget / exchange_rate


def get_change(budget, exchanging_value):
    """Calculate amount of original currency left after exchanging a portion

    :param budget: float - amount of money you own.
    :param exchanging_value: int - amount of your money you want to exchange now.
    :return: float - amount left of your starting currency after exchanging.
    """

    return budget - exchanging_value


def get_value_of_bills(denomination, number_of_bills):
    """Calculate how much a stack of bills is worth

    :param denomination: int - the value of a bill.
    :param number_of_bills: int - amount of bills you received.
    :return: int - total value of bills you now have.
    """

    return number_of_bills * denomination


def get_number_of_bills(budget, denomination):
    """Calculate how many bills of a certain denomination you would receive when making an exchange

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: int - number of bills after exchanging all your money.
    """

    return int(budget // denomination)


def exchangeable_value(budget, exchange_rate, spread, denomination):
    """Calculate the actual value of the bills you receive from the exchange

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - maximum value you can get.
    """
    actual_rate = exchange_rate * (1 + (spread / 100))
    max_value = exchange_money(budget, actual_rate)
    max_bills = get_number_of_bills(max_value, denomination)
    actual_value = get_value_of_bills(denomination, max_bills)
    return actual_value


def non_exchangeable_value(budget, exchange_rate, spread, denomination):
    """Calculate how much you lose out on in exchange value b choice of denomination bill

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int non-exchangeable value.
    """
    actual_rate = exchange_rate * (1 + (spread / 100))
    max_value = exchange_money(budget, actual_rate)
    max_bills = get_number_of_bills(max_value, denomination)
    actual_value = get_value_of_bills(denomination, max_bills)
    return int(max_value - actual_value)
