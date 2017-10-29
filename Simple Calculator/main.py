from functions import *
from time import sleep


def run_calculator():
    """
    A Simple Calculator
    """

    list_choices = ['Addition: 1',
                    'Subtraction: 2',
                    'Multiplication: 3',
                    'Division: 4',
                    'Exponent: 5',
                    'Logarithm: 6',
                    'Square Root: 7',
                    'Cube Root: 8',
                    'Sin: 9',
                    'Cos: 10',
                    'Tan: 11']

    print('============================')
    for item in list_choices:
        print(item)
    print('============================')

    user_choice = input('Enter number of selection: ')

    if user_choice == '1':
        addition()
    elif user_choice == '2':
        subtraction()
    elif user_choice == '3':
        multiplication()
    elif user_choice == '4':
        division()
    elif user_choice == '5':
        exponent()
    elif user_choice == '6':
        logarithm()
    elif user_choice == '7':
        square_root()
    elif user_choice == '8':
        cube_root()
    elif user_choice == '9':
        sin_a()
    elif user_choice == '10':
        cos_a()
    elif user_choice == '11':
        tan_a()
    else:
        print('Invalid Selection...')

    sleep(2)
    run_calculator()

run_calculator()
