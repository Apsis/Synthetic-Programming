import numpy


def generate_julia():
    """
    Generates a Julia set image
    """
    print('=========================================================')

    w = int(input('Enter width of image: '))
    h = int(input('Enter height of image: '))
    f = float(input('Enter a value between 0 and 1 (like 0.75): '))
    name_input = input('Enter name of file (a good name is "output"): ')

    re_min = -2.0
    re_max = 2.0
    im_min = -2.0
    im_max = 2.0
    name = (str(name_input) + '.pgm')
    c = complex(0.0, f)
    real_range = numpy.arange(re_min, re_max, (re_max - re_min) / w)
    image_range = numpy.arange(im_max, im_min, (im_min - im_max) / h)
    output = open(name, 'w')
    output.write('P2\n# Julia Set image\n' + str(w) + ' ' + str(h) + '\n255\n')
    for im in image_range:
        for re in real_range:
            z = complex(re, im)
            n = 255
            while abs(z) < 10 and n >= 5:
                z = z * z + c
                n -= 5
            output.write(str(n) + ' ')
        output.write('\n')
    output.close()

    print('Created photo ' + name)
    print('=========================================================')

generate_julia()
