"""Functions to determine the type of a triangle"""


def triangle_inequality_violation(sides):
    """Determine if a triangle violates the triangle inequality rule

    :param sides:array - numbers representing the length of the sides of a triangle
    :return:boolean - does the triangle violate the rule??
    """
    side_a, side_b, side_c = sides
    return side_a + side_b >= side_c and side_b + side_c >= side_a and side_a + side_c >= side_b


def equilateral(sides):
    """Determine if a triangle is equilateral

    :param sides:array - numbers representing the length of the sides of a triangle
    :return:boolean - is the triangle equilateral?
    """
    side_a, side_b, side_c = sides
    if side_a == 0 and side_b == 0 and side_c == 0:
        return False
    return side_a == side_b == side_c


def isosceles(sides):
    """Determine if a triangle is isosceles

    :param sides:array - numbers representing the length of the sides of a triangle
    :return:boolean - is the triangle isosceles?
    """
    if triangle_inequality_violation(sides):
        side_a, side_b, side_c = sides
        return side_a == side_b or side_b == side_c or side_a == side_c
    return False


def scalene(sides):
    """Determine if a triangle is scalene

    :param sides:array - numbers representing the length of the sides of a triangle
    :return:boolean - is the triangle scalene?
    """
    if triangle_inequality_violation(sides):
        side_a, side_b, side_c = sides
        return side_a != side_b != side_c
    return False
