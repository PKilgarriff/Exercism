"""Functions to prevent a nuclear meltdown."""


def is_criticality_balanced(temperature, neutrons_emitted):
    """Verify criticality is balanced.

    :param temperature: int or float - temperature value in kelvin.
    :param neutrons_emitted: int or float - number of neutrons emitted per second.
    :return: bool - is criticality balanced?

    A reactor is said to be critical if it satisfies the following conditions:
    - The temperature is less than 800 K.
    - The number of neutrons emitted per second is greater than 500.
    - The product of temperature and neutrons emitted per second is less than 500000.
    """
    temperature_less_than_800K = temperature < 800
    neutrons_per_second_greater_than_500 = neutrons_emitted < 500
    product_of_temperature_and_neutrons_less_than_500000 = temperature * \
        neutrons_emitted < 500000
    return temperature_less_than_800K and neutrons_per_second_greater_than_500 and product_of_temperature_and_neutrons_less_than_500000


def reactor_efficiency(voltage, current, theoretical_max_power):
    """Assess reactor efficiency zone.

    :param voltage: int or float - voltage value.
    :param current: int or float - current value.
    :param theoretical_max_power: int or float - power that corresponds to a 100% efficiency.
    :return: str - one of ('green', 'orange', 'red', or 'black').

    Efficiency can be grouped into 4 bands:

    1. green -> efficiency of 80% or more,
    2. orange -> efficiency of less than 80% but at least 60%,
    3. red -> efficiency below 60%, but still 30% or more,
    4. black ->  less than 30% efficient.

    The percentage value is calculated as
    (generated power/ theoretical max power)*100
    where generated power = voltage * current
    """
    generated_power = voltage * current
    percentage_value = (generated_power / theoretical_max_power) * 100
    if percentage_value >= 80:
        efficiency = 'green'
    elif percentage_value >= 60:
        efficiency = 'orange'
    elif percentage_value >= 30:
        efficiency = 'red'
    else:
        efficiency = 'black'
    return efficiency


def fail_safe(temperature, neutrons_produced_per_second, threshold):
    """Assess and return status code for the reactor.

    :param temperature: int or float - value of the temperature in kelvin.
    :param neutrons_produced_per_second: int or float - neutron flux.
    :param threshold: int or float - threshold for category.
    :return: str - one of ('LOW', 'NORMAL', 'DANGER').

    1. 'LOW' -> `temperature * neutrons per second` < 90% of `threshold`
    2. 'NORMAL' -> `temperature * neutrons per second` +/- 10% of `threshold`
    3. 'DANGER' -> `temperature * neutrons per second` is not in the above-stated ranges
    """
    temp_times_neutrons_per_sec = temperature * neutrons_produced_per_second
    min_limit = threshold * 0.9
    max_limit = threshold * 1.1

    if temp_times_neutrons_per_sec < min_limit:
        status_code = 'LOW'
    elif temp_times_neutrons_per_sec < max_limit:
        status_code = 'NORMAL'
    else:
        status_code = 'DANGER'

    return status_code
