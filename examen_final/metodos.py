""
"""
Examen final de Métodos Numéricos
Autores: CRISTIAN MARIN, JORGE SANCHEZ, ANTHONY UQUILLAS
Fecha: Febrero/2022

Implementación de cada uno de los algoritmos a utilizar de la librería deap
"""

from deap import base
from deap import creator
from deap import tools
from deap import algorithms

import random
import array

import numpy as np
import matplotlib.pyplot as plt

# Establecemos la semilla para generar resultados repetibles
RANDOM_SEED = 42
random.seed(RANDOM_SEED)

# Constantes de los algoritmos genéticos:
POPULATION_SIZE = 300 # Tamaño de la población
MAX_GENERATIONS = 200 # Número de generaciones máximas
HALL_OF_FAME_SIZE = 1 # Contenedor de mejores individuos
P_CROSSOVER = 0.9 # Probabilidad de aparear individuos
P_MUTATION = 0.1 # Probabilidad de que mute un individuo

# Estrategia de minimización:
creator.create("FitnessMin", base.Fitness, weights=(-1.0,))

# Creamos la clase Individual para la aptitud de minimización
creator.create("Individual", array.array, typecode='i', fitness=creator.FitnessMin)


def metodo_eaSimple(nombre_problema, grafica = False):
  """
  Implementación del algoritmo eaSimple
  :param nombre_problema: problema TSP a resolver
  :param grafica: si se desea generar una gráfica o no
  :return: hof0: el mejor recorrido encontrado
  """
  import tsp
  # Nombre del archivo .tsp de http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/
  TSP_NAME = nombre_problema
  tsp = tsp.TravelingSalesmanProblem(TSP_NAME)
  toolbox = base.Toolbox()

  # Operador que genera índices aleatorios:
  toolbox.register("randomOrder", random.sample, range(len(tsp)), len(tsp))

  # Creación individual para llenar el operador Individual con los índices aleatorios:
  toolbox.register("individualCreator", tools.initIterate, creator.Individual, toolbox.randomOrder)

  # Creación de la población para generar una lista de individuos:
  toolbox.register("populationCreator", tools.initRepeat, list, toolbox.individualCreator)

  # Cálculo del fitness - calcula la distancia de las ciudades representadas por los índices
  def tpsDistance(individual):
    return tsp.getTotalDistance(individual), # Retorna una tupla

  toolbox.register("evaluate", tpsDistance)

  # Operadores genéticos:
  toolbox.register("select", tools.selTournament, tournsize=3)
  toolbox.register("mate", tools.cxOrdered)
  toolbox.register("mutate", tools.mutShuffleIndexes, indpb=1.0 / len(tsp))

  # Creación de una población inicial
  population0 = toolbox.populationCreator(n=POPULATION_SIZE)
  # Objeto para las estadísticas:
  stats0 = tools.Statistics(lambda ind: ind.fitness.values)
  stats0.register("min", np.min)
  stats0.register("avg", np.mean)
  # Definimos el objeto hall-of-fame
  hof0 = tools.HallOfFame(HALL_OF_FAME_SIZE)
  # Se realiza la ejecución del algoritmo genético a usar:
  population0, logbook0 = algorithms.eaSimple(population0, toolbox, cxpb=P_CROSSOVER, mutpb=P_MUTATION, ngen=MAX_GENERATIONS, stats=stats0, halloffame=hof0, verbose=True)
  # Se presentan los resultados obtenidos:
  print("Algoritmo: eaSimple")
  print("-- Best Ever Individual = ", hof0.items[0])
  print("-- Best Ever Fitness = ", hof0.items[0].fitness.values[0])
  if grafica:
    fig0 = plt.figure(1)
    fig0.suptitle("eaSimple")
    plt.subplot(121)
    plt.title("Recorrido", size=8)
    plt.xlabel("X", size=6)
    plt.ylabel("Y", size=6)
    tsp.plotData(hof0.items[0])
    # Estadísticas del algoritmo eaSimple
    minFitnessValues0, meanFitnessValues0 = logbook0.select("min", "avg")
    plt.subplot(122)
    plt.plot(minFitnessValues0, color='red')
    plt.plot(meanFitnessValues0, color='green')
    plt.xlabel('Generation', size=6)
    plt.ylabel('Min / Average Fitness', size=6)
    plt.title('Min and Average fitness over Generations', size=8)
  return hof0


def metodo_eaMuPlusLambda(nombre_problema, grafica = False):
  """
  Implementación del algoritmo eaMuPlusLambda
  :param nombre_problema: problema TSP a resolver
  :param grafica: si se desea generar una gráfica o no
  :return: hof1: el mejor recorrido encontrado
  """
  import tsp
  TSP_NAME = nombre_problema # Nombre del archivo .tsp de http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/
  tsp = tsp.TravelingSalesmanProblem(TSP_NAME)
  toolbox = base.Toolbox()

  # Operador que genera índices aleatorio:
  toolbox.register("randomOrder", random.sample, range(len(tsp)), len(tsp))

  # Creación individual para llenar el operador Individual con los índices aleatorios:
  toolbox.register("individualCreator", tools.initIterate, creator.Individual, toolbox.randomOrder)

  # Creación de la población para generar una lista de individuos:
  toolbox.register("populationCreator", tools.initRepeat, list, toolbox.individualCreator)

  # Cálculo del fitness - calcula la distancia de las ciudades representadas por los índices
  def tpsDistance(individual):
    return tsp.getTotalDistance(individual), # Retorna una tupla

  toolbox.register("evaluate", tpsDistance)

  # Operadores genéticos:
  toolbox.register("select", tools.selTournament, tournsize=3)
  toolbox.register("mate", tools.cxOrdered)
  toolbox.register("mutate", tools.mutShuffleIndexes, indpb=1.0 / len(tsp))

  population1 = toolbox.populationCreator(n=POPULATION_SIZE)
  stats1 = tools.Statistics(lambda ind: ind.fitness.values)
  stats1.register("min", np.min)
  stats1.register("avg", np.mean)
  hof1 = tools.HallOfFame(HALL_OF_FAME_SIZE)
  population1, logbook1 = algorithms.eaMuPlusLambda(population1, toolbox, mu=300, lambda_=300, cxpb=P_CROSSOVER, mutpb=P_MUTATION, ngen=MAX_GENERATIONS, stats=stats1, halloffame=hof1, verbose=True)
  print("Algoritmo: eaMuPlusLambda")
  print("-- Best Ever Individual = ", hof1.items[0])
  print("-- Best Ever Fitness = ", hof1.items[0].fitness.values[0])
  if grafica:
    fig1 = plt.figure(2)
    fig1.suptitle("eaMuPlusLambda")
    plt.subplot(121)
    plt.title("Recorrido", size=8)
    plt.xlabel("X", size=6)
    plt.ylabel("Y", size=6)
    tsp.plotData(hof1.items[0])
    # Estadísticas del algoritmo: eaMuPlusLambda
    minFitnessValues1, meanFitnessValues1 = logbook1.select("min", "avg")
    plt.subplot(122)
    plt.plot(minFitnessValues1, color='red')
    plt.plot(meanFitnessValues1, color='green')
    plt.xlabel('Generation', size=6)
    plt.ylabel('Min / Average Fitness', size=6)
    plt.title('Min and Average fitness over Generations', size=8)
  return hof1


def metodo_eaMuCommaLambda(nombre_problema, grafica = False):
  """
  Implementación del algoritmo eaMuCommaLambda
  :param nombre_problema: problema TSP a resolver
  :param grafica: si se desea generar una gráfica o no
  :return: hof2: el mejor recorrido encontrado
  """
  import tsp
  TSP_NAME = nombre_problema # Nombre del archivo .tsp de http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/
  tsp = tsp.TravelingSalesmanProblem(TSP_NAME)
  toolbox = base.Toolbox()

  # Operador que genera índices aleatorio:
  toolbox.register("randomOrder", random.sample, range(len(tsp)), len(tsp))

  # Creación individual para llenar el operador Individual con los índices aleatorios:
  toolbox.register("individualCreator", tools.initIterate, creator.Individual, toolbox.randomOrder)

  # Creación de la población para generar una lista de individuos:
  toolbox.register("populationCreator", tools.initRepeat, list, toolbox.individualCreator)

  # Cálculo del fitness - calcula la distancia de las ciudades representadas por los índices
  def tpsDistance(individual):
    return tsp.getTotalDistance(individual), # Retorna una tupla

  toolbox.register("evaluate", tpsDistance)

  # Operadores genéticos:
  toolbox.register("select", tools.selTournament, tournsize=3)
  toolbox.register("mate", tools.cxOrdered)
  toolbox.register("mutate", tools.mutShuffleIndexes, indpb=1.0 / len(tsp))

  population2 = toolbox.populationCreator(n=POPULATION_SIZE)
  stats2 = tools.Statistics(lambda ind: ind.fitness.values)
  stats2.register("min", np.min)
  stats2.register("avg", np.mean)
  hof2 = tools.HallOfFame(HALL_OF_FAME_SIZE)
  population2, logbook2 = algorithms.eaMuCommaLambda(population2, toolbox, mu=300, lambda_=300, cxpb=P_CROSSOVER, mutpb=P_MUTATION, ngen=MAX_GENERATIONS, stats=stats2, halloffame=hof2, verbose=True)
  print("Algoritmo: eaMuCommaLambda")
  print("-- Best Ever Individual = ", hof2.items[0])
  print("-- Best Ever Fitness = ", hof2.items[0].fitness.values[0])

  if grafica:
    fig2 = plt.figure(3)
    fig2.suptitle("eaMuCommaLambda")
    plt.subplot(121)
    plt.title("Recorrido", size=8)
    plt.xlabel("X", size=6)
    plt.ylabel("Y", size=6)
    tsp.plotData(hof2.items[0])
    # Estadísticas del algoritmo: eaMuCommaLambda
    minFitnessValues2, meanFitnessValues2 = logbook2.select("min", "avg")
    plt.subplot(122)
    plt.plot(minFitnessValues2, color='red')
    plt.plot(meanFitnessValues2, color='green')
    plt.xlabel('Generation', size=6)
    plt.ylabel('Min / Average Fitness', size=6)
    plt.title('Min and Average fitness over Generations', size=8)
  return hof2
