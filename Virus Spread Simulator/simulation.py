from random import randint, random
from matplotlib import pyplot as plt


class Person:
    def __init__(self, status):
        self.status = status
        self.time_sick = 0
        self.building = list()


class Building:
    def __init__(self, building_id):
        self.building_id = id
        self.num_sick = 0


def simulate(buildings, n_healthy, n_sick, iterations):
    town = [Building(i) for i in range(buildings)]
    people = [Person('healthy') for i in range(n_healthy)] + \
             [Person('sick') for i in range(n_sick)]

    healthy_history = [n_healthy]
    sick_history = [n_sick]
    recovered_history = [0]
    dead_history = [0]
    days = [day for day in range(iterations)]

    for day in days:
        healthy = 0
        sick = 0
        recovered = 0
        dead = 0

        for person in people:
            person.building = town[randint(0, len(town)-1)]

        for person in people:
            if person.status == 'healthy':
                healthy += 1
            elif person.status == 'sick':
                sick += 1
                person.building.num_sick += 1
            elif person.status == 'recovered':
                recovered += 1
            else:
                dead += 1

        for person in people:
            if person.status == 'sick' and person.time_sick < 15:
                person.time_sick += 1
            elif person.status == 'sick' and person.time_sick == 15:
                if randint(0, 9) == 4:
                    person.status = 'dead'
                else:
                    person.status = 'recovered'
            if person.status == 'healthy':
                chance_of_infection = 0.0008*person.building.num_sick
                if random() < chance_of_infection:
                    person.status = 'sick'

        for building in town:
            building.num_sick = 0

        healthy_history.append(healthy)
        sick_history.append(sick)
        recovered_history.append(recovered)
        dead_history.append(dead)

    fig, axs = plt.subplots(4, sharex=True, sharey=False)
    fig.suptitle('VIRUS SIMULATION')
    axs[0].plot(days, healthy_history[:-1])
    axs[0].set_title('HEALTHY')
    axs[1].plot(days, sick_history[:-1], 'tab:orange')
    axs[1].set_title('SICK')
    axs[2].plot(days, recovered_history[:-1], 'tab:green')
    axs[2].set_title('RECOVERED')
    axs[3].plot(days, dead_history[:-1], 'tab:red')
    axs[3].set_title('DEAD')

    plt.show()


simulate(75, 25000, 25, 100)