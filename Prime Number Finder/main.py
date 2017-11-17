from math import sqrt
from itertools import count, islice


def prime_test(n):
    """
    Tests if a number is prime
    """
    if n < 2:
        return False
    for number in islice(count(2), int(sqrt(n)-1)):
        if not n%number:
            return False
    return True


def find_primes():
    """
    Finds all primes between a and b and writes them to a file
    """
    print('==============================================')
    a = int(input('Enter start number: '))
    b = int(input('Enter end number: '))
    output = input('Enter output filename: ')
    print('Working...')
    primes_list = list()
    for i in range(a, b+1):
        if prime_test(i):
            primes_list.append(str(i) + '\n')
        else:
            continue
    with open(output, 'w') as o:
        for item in primes_list:
            o.write(item)
        o.close()
    print('Done! Created file ' + output)
    print('==============================================')

find_primes()
