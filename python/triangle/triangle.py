"""Functions to determine the type of a triangle"""


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
    pass


def scalene(sides):
    """Determine if a triangle is scalene

    :param sides:array - numbers representing the length of the sides of a triangle
    :return:boolean - is the triangle scalene?
    """

    pass
