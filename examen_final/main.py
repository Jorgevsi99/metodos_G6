""
"""
Examen final de Métodos Numéricos
Autores: CRISTIAN MARIN, JORGE SANCHEZ, ANTHONY UQUILLAS
Fecha: Febrero/2022

Programa que resuelve el problema tradicional TSP (Traveling Salesman Problem)
donde se utilizan 3 algoritmos de la librería deap: eaSimple, eaMuPlusLambda
y eaMuCommaLambda, de los cuales serán compararados con la solución óptima y
además comparados entre sí.
"""

import metodos
import matplotlib.pyplot as plt

problema = "bayg29" # Nombre del problema TSP

# M´etodos a utilizar:
recorrido0 = metodos.metodo_eaSimple(problema, grafica=True)
recorrido1 = metodos.metodo_eaMuPlusLambda(problema, grafica=True)
recorrido2 = metodos.metodo_eaMuCommaLambda(problema, grafica=True)

# Mostramos resultados:
print("* " * 30 + "Respuestas para el problema TSP: " + problema + " *" * 30)
print("* eaSimple: Mejor recorrido > ", recorrido0.items[0])
print("* eaMuPlusLambda: Mejor recorrido > ", recorrido1.items[0])
print("* eaMuCommaLambda: Mejor recorrido > ", recorrido2.items[0])
print("* " * 80)

# Mostramos las gráficas generadas:
plt.show()
