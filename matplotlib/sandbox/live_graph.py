import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from threading import Thread
from collections import Counter
import keyboard

x = []
y = []
c = Counter()
def aa():
    def getKeyPresses(i):
        x.append(i)
        y.append(c.get('a', 0))
        plt.cla()
        plt.plot(x, y)
        c.clear()

    ani = FuncAnimation(plt.gcf(), getKeyPresses, interval=1000)
    plt.tight_layout()
    plt.show()

def getKeys():
    while True:
        if keyboard.is_pressed('a'):
            c.update(['a'])

if __name__ == '__main__':
    t1 = Thread(target = aa)
    t2 = Thread(target = getKeys)
    t1.start()
    t2.start()
    t1.join()
    t1.join()
