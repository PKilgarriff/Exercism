def is_armstrong_number(number):
    digits = [int(x) for x in str(number)]
    length = len(digits)
    powers = [x ** length for x in digits]

    return sum(powers) == number
