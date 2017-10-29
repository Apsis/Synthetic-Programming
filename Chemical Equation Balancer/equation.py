from random import randint
from math import gcd
from functools import reduce


class Equation:
    """
    A chemical equation

    === Attributes ===
    @type left: list[dict]
    @type right: list[dict]
    """
    def __init__(self, equation):
        """
        Initializes an Equation object

        @type self: Equation
        @type equation: str
        @rtype: None
        """
        self.left = list()
        self.right = list()
        self.balanced = True

        integers = '0123456789'
        split = equation.split(' = ')
        left = split[0]
        right = split[1]
        left_components = left.split(' + ')
        right_components = right.split(' + ')
        total_left = dict()
        total_right = dict()

        for component in left_components:
            left_counts = dict()
            for ind in range(0, len(component)):
                if component[ind] == ')':
                    if component[ind - 2] == '(':
                        element = component[ind - 1]
                    elif component[ind - 3] == '(':
                        element = component[ind - 2:ind]
                    try:
                        if component[ind + 3] in integers:
                            number = int(component[ind + 1:ind + 4])
                        elif component[ind + 2] in integers:
                            number = int(component[ind + 1:ind + 3])
                        else:
                            number = int(component[ind + 1])
                    except IndexError:
                        try:
                            if component[ind + 2] in integers:
                                number = int(component[ind + 1:ind + 3])
                            else:
                                number = int(component[ind + 1])
                        except IndexError:
                            number = int(component[ind + 1])
                    if element in left_counts:
                        left_counts[element] += number
                    else:
                        left_counts[element] = number
                    if element in total_left:
                        total_left[element] += number
                    else:
                        total_left[element] = number
            self.left.append(left_counts)

        for component in right_components:
            right_counts = dict()
            for ind in range(0, len(component)):
                if component[ind] == ')':
                    if component[ind - 2] == '(':
                        element = component[ind - 1]
                    elif component[ind - 3] == '(':
                        element = component[ind - 2:ind]
                    try:
                        if component[ind + 3] in integers:
                            number = int(component[ind + 1:ind + 4])
                        elif component[ind + 2] in integers:
                            number = int(component[ind + 1:ind + 3])
                        else:
                            number = int(component[ind + 1])
                    except IndexError:
                        try:
                            if component[ind + 2] in integers:
                                number = int(component[ind + 1:ind + 3])
                            else:
                                number = int(component[ind + 1])
                        except IndexError:
                            number = int(component[ind + 1])
                    if element in right_counts:
                        right_counts[element] += number
                    else:
                        right_counts[element] = number
                    if element in total_right:
                        total_right[element] += number
                    else:
                        total_right[element] = number
            self.right.append(right_counts)

        for key in total_left:
            if total_left[key] != total_right[key]:
                self.balanced = False
            else:
                continue

    def balance(self):
        """
        Actually balances the Equation object

        @type self: Equation
        @rtype: str
        """
        if self.balanced:
            string = str()
            for dictionary in self.left:
                compound = str()
                for key in dictionary:
                    compound += key
                    compound += str(dictionary[key])
                string += compound
                string += ' + '
            string = string[:len(string) - 3] + ' = '
            for dictionary in self.right:
                compound = str()
                for key in dictionary:
                    compound += key
                    compound += str(dictionary[key])
                string += compound
                string += ' + '
            string = string[:len(string) - 2]
            return string
        else:
            while not self.balanced:
                temp_left = list()
                temp_right = list()
                total_left = dict()
                total_right = dict()

                for item in self.left:
                    new_dict = dict()
                    for key in item:
                        new_dict[key] = item[key]
                    temp_left.append(new_dict)

                for item in self.right:
                    new_dict = dict()
                    for key in item:
                        new_dict[key] = item[key]
                    temp_right.append(new_dict)

                left_coefficients = [randint(1, 10) for _ in range(len(temp_left))]
                right_coefficients = [randint(1, 10) for _ in range(len(temp_right))]

                for index in range(0, len(left_coefficients)):
                    for key in temp_left[index]:
                        temp_left[index][key] *= left_coefficients[index]
                        if key not in total_left:
                            total_left[key] = temp_left[index][key]
                        else:
                            total_left[key] += temp_left[index][key]

                for index in range(0, len(right_coefficients)):
                    for key in temp_right[index]:
                        temp_right[index][key] *= right_coefficients[index]
                        if key not in total_right:
                            total_right[key] = temp_right[index][key]
                        else:
                            total_right[key] += temp_right[index][key]

                self.balanced = True
                for key in total_left:
                    if total_left[key] != total_right[key]:
                        self.balanced = False
                    else:
                        continue

            big_tup = tuple(left_coefficients + right_coefficients)
            left_coefficients = list(map(lambda x: int(x / reduce(gcd, big_tup)), left_coefficients))
            right_coefficients = list(map(lambda x: int(x / reduce(gcd, big_tup)), right_coefficients))

            string = str()
            for index in range(0, len(self.left)):
                if left_coefficients[index] != 1:
                    compound = str(left_coefficients[index])
                else:
                    compound = str()
                for key in self.left[index]:
                    compound += key
                    if self.left[index][key] != 1:
                        compound += str(self.left[index][key])
                    else:
                        continue
                string += compound
                string += ' + '
            string = string[:len(string) - 3] + ' = '
            for index in range(0, len(self.right)):
                if right_coefficients[index] != 1:
                    compound = str(right_coefficients[index])
                else:
                    compound = str()
                for key in self.right[index]:
                    compound += key
                    if self.right[index][key] != 1:
                        compound += str(self.right[index][key])
                    else:
                        continue
                string += compound
                string += ' + '
            string = string[:len(string) - 2]
            return string
