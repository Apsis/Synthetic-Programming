from PIL import Image
from random import random


def filter_image(path, shifts=list()):
    if len(shifts) == 0:
        shifts = [random() for _ in range(9)]
    im = Image.open(path)
    photo = list(im.getdata())
    filtered = list()
    for pixel in photo:
        r, g, b = pixel
        new_r = ((r * shifts[0]) + (g * shifts[1]) + (b * shifts[2]))
        new_g = ((r * shifts[3]) + (g * shifts[4]) + (b * shifts[5]))
        new_b = ((r * shifts[6]) + (g * shifts[7]) + (b * shifts[8]))
        filtered.append((int(new_r), int(new_g), int(new_b)))
    im.putdata(filtered)
    im.save('out.jpg')
    print(shifts)


# FILTERS photo.jpg with the filter in the YouTube video. Change photo.jpg to photo2.jpg
# to filter the other photo. Remove the shifts list below to make random filters.
filter_image('photo.jpg', [0.4326218451730057, 0.5030069461916604, 0.060251308573529894,
                           0.16957230426719494, 0.30730402583748595, 0.3401588777740414,
                           0.707616569530353, 0.07909720665536601, 0.276371896353369])
