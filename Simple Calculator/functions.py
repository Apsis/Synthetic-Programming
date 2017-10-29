from math import log, sin, cos, tan


def addition():
    """
    Adds two numbers
    """
    a = input("Enter first number: ")
    b = input("Enter second number: ")
    equation = a + ' + ' + b + ' ='
    print(equation)
    answer = float(a) + float(b)
    print(answer)


def subtraction():
    """
    Subtracts two numbers
    """
    a = input("Enter first number: ")
    b = input("Enter second number: ")
    equation = a + ' - ' + b + ' ='
    print(equation)
    answer = float(a) - float(b)
    print(answer)


def multiplication():
    """
    Multiplies two numbers
    """
    a = input("Enter first number: ")
    b = input("Enter second number: ")
    equation = a + ' x ' + b + ' ='
    print(equation)
    answer = float(a) * float(b)
    print(answer)


def division():
    """
    Divides two numbers
    """
    a = input("Enter first number: ")
    b = input("Enter second number: ")
    equation = a + ' / ' + b + ' ='
    print(equation)
    answer = float(a) / float(b)
    print(answer)


def exponent():
    """
    Raises a to the power b
    """
    a = input("Enter first number: ")
    b = input("Enter second number: ")
    equation = a + ' ^ ' + b + ' ='
    print(equation)
    answer = float(a) ** float(b)
    print(answer)


def logarithm():
    """
    Log base a of b
    """
    a = input("Enter base of logarithm: ")
    b = input("Enter number you'd like to take the log of: ")
    equation = 'Log base ' + a + ' of ' + b + ' ='
    print(equation)
    answer = log(float(b), float(a))
    print(answer)


def square_root():
    """
    Square root of a
    """
    a = input("Enter number: ")
    equation = a + ' ^ (1/2) ='
    print(equation)
    answer = float(a) ** 0.5
    print(answer)


def cube_root():
    """
    Cube root of a
    """
    a = input("Enter number: ")
    equation = a + ' ^ (1/3) ='
    print(equation)
    answer = float(a) ** (1/3)
    print(answer)


def sin_a():
    """
    Sin of a
    """
    a = input("Enter number: ")
    equation = 'Sin(' + a + ') ='
    print(equation)
    answer = sin(float(a))
    print(answer)


def cos_a():
    """
    Cos of a
    """
    a = input("Enter number: ")
    equation = 'Cos(' + a + ') ='
    print(equation)
    answer = cos(float(a))
    print(answer)


def tan_a():
    """
    Tan of a
    """
    a = input("Enter number: ")
    equation = 'Tan(' + a + ') ='
    print(equation)
    answer = tan(float(a))
    print(answer)
