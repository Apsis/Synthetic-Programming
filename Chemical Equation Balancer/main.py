from equation import Equation
from time import sleep


def run_balance():
    """
    Runs the chemical equation balance algorithm
    """
    print('=================================================')
    print('Insert chemical equation with elements in\nparentheses followed by the number of atoms:')
    print('Example: (H)2 + (O)2 = (H)2(O)1')
    user_input = input('>>> ')
    try:
        equation = Equation(user_input)
        print('Balanced equation: ' + equation.balance())
        sleep(3)
        run_balance()
    except IndexError:
        print('Invalid input...')
        sleep(3)
        run_balance()

run_balance()
