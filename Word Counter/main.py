import operator


def word_counter():
    print('=====================================================================')
    filename = input('Enter name of file (example.txt): ')
    output_name = input('Enter name of output file (output_example.txt): ')
    print('Working...')

    counts = dict()
    bad_characters = '~`!@#$%^&*()_-+=1234567890{[}]|\\<,>.?/:;"\n'

    with open(filename, 'r') as f:
        lines = f.readlines()
        f.close()

    for line in lines:
        new_line = str()
        for character in line:
            if character not in bad_characters:
                new_line += character.lower()
        words = new_line.split(' ')
        for word in words:
            if word in counts:
                counts[word] += 1
            else:
                counts[word] = 1

    del counts['']
    counts['I'] = counts['i']
    counts["I'll"] = counts["i'll"]
    counts["I'm"] = counts["i'm"]
    counts["I've"] = counts["i've"]
    counts["I'd"] = counts["i'd"]
    del counts['i']
    del counts["i'll"]
    del counts["i'm"]
    del counts["i've"]
    del counts["i'd"]

    sort = sorted(counts.items(), key=operator.itemgetter(1))
    sort.reverse()

    with open(output_name, 'w') as o:
        for item in sort:
            o.write(item[0] + ' ' + str(item[1]) + '\n')
        o.close()

    print('Done! Created ' + output_name)
    print('=====================================================================')

word_counter()
