# Conversion de Decimal a Binario con parte fraccionaria
#IEEE 754 32 bits
# Signo 1 bit --- Exponente Sesgado 8 bits --- Mantisa normalizada 23 bits

#convierte a binario la parte entera antes de la coma
def int_bin(num):
    ent = int(num)
    if ent == 0:
        return '0'
    binary = ''   
    while ent > 0:
        binary = str(ent % 2) + binary
        ent //= 2
    return binary
 
# convierte a binario la parte decimal despues de la coma
def decimales_bin(num):
    #Conversion a flotante
    dec = float('0.' + num)
    if dec == 0:
        return '0'
    binary = ''
    #Bucle para un max de 11 decimales despues de la coma
    for i in range(11):
        if dec > 1:
            dec -= 1
        dec *= 2
        vale, no_vale = str(dec).split(".")
        binary = binary + vale
        if int(no_vale) == 0:
            break
    return binary


# User input
print('\nIEEE 754 32 bits\n\nIngrese 5 numeros enteros:')
ints = []
n1 = input('1. ')
n2 = input('2. ')
n3 = input('3. ')
n4 = input('4. ')
n5 = input('5. ')
ints = [n1, n2, n3, n4, n5]

print('\nIngrese 5 numeros decimales:')
decs = []
n6 = input('1. ')
n7 = input('2. ')
n8 = input('3. ')
n9 = input('4. ')
n10 = input('5. ')
decs = [n6, n7, n8, n9, n10]

# n = input("Ingrese su numero de punto flotante: ")

# lista que almacena los numeros ya convertidos a binarios para su posterior
# presentacion de acuerdo al estandar IEEE 754 32 bits
converted = []

bin_ent = ''
bin_decimales = ''


print('\n\nNumeros enteros en binario:\n')
# Bucle que convierte los numeros enteros en binario
for i in range(5):
    bin_ent = int_bin(ints[i])
    converted.append(bin_ent)
    print(converted[i])
    bin_ent = ''

ent = ''
dec = ''
convertido = ''

# Bucle que convierte los numeros decimales float en binario
for i in range(5):
    # split() separa la parte entera de la parte decimal
    ent, dec = str(decs[i]).split(".")

    bin_ent = int_bin(ent)
    bin_decimales = decimales_bin(dec)

    # annadimos la parte entera y decimal convertidas
    convertido = bin_ent + '.' + bin_decimales
    # annadimos el valor actual al string principal de convertidos
    converted.append(convertido)

    ent = ''
    dec = ''
    bin_ent = ''
    bin_decimales = ''
    convertido = ''

# print(converted)

listoflists = []

# Empieza conversion a IEEE 754 32 bits
for i in range(5, 10):

    # sublista para formato IEEE 754 32 bits
    sublist = []

    # Separar la parte entera de la parte decimal (str)
    ent, dec = str(converted[i]).split(".")
    ParteEntera = list(ent)
    ParteDecimal = list(dec)

    # if i >= 5:
    #     ent, dec = str(converted[i]).split(".")
    #     ParteEntera = list(ent)
    #     ParteDecimal = list(dec)
    #     ent = ''
    #     dec = ''
    # else:
    #     ParteEntera = list(converted[i])
    #     ParteDecimal = list('0')

    signo = 0
    Recorrido = []
    TopePunto = 0
    sacador = 0
    saca = 0
    cont = 0

    if '1' in (ParteEntera):
        # Desplazamiento de la coma
        TopePunto = len(ParteEntera) - 1

        # se suma 127 a las posiciones desplazadas por la coma
        ExpoParcial = 127 + TopePunto

        # convertimos el exponencial entero a binario
        ExpoBinario = int_bin(ExpoParcial)

        # se agrega en un str la parte entera y parte decimal
        matisalncom = ParteEntera + ParteDecimal
        matisalncom.reverse()

        # se extrae el ultimo (1er) elemento
        pedacito = matisalncom.pop()
        matisalncom.reverse()

        # llenamos la mantisa normalizada con 0s
        while len(matisalncom)<23:
            matisalncom.extend('0')

        # guardamos el exp sesgado en una lista
        ExpobinList = []
        for j in ExpoBinario:
            ExpobinList.append(j)

        # ExpobinList = (ExpobinList[2:])
        # Condicional para verificar si es necesario completar el exponente
        if len(ExpobinList)<8:
            ExpobinList.reverse()
            # completamos el exponente sesgado con 0s
            while len(ExpobinList)<8:
                ExpobinList.extend('0')
            ExpobinList.reverse()
        # caso contrario, verificamos que el exponente sesgado empiece en 1
        else:
            if ExpobinList[0] == '0':
                ExpobinList[0] = '1'

    else:
        # se agrega en un str la parte entera y parte decimal
        matisalncom = ParteEntera + ParteDecimal

        # revierte la parte decimal y la mantisa guardada al momento
        ParteDecimal.reverse()
        matisalncom.reverse()

        while cont == 0:
            # se extrae el ultimo (1er) elemento
            pedacito = matisalncom.pop()

            # condicional para completar la mantisa normalizada
            if pedacito == '0' and cont == '0':
                cont = 0
            # si encuentra un '1' en la mantisa
            elif pedacito == '1' and cont == 0:
                cont = cont + 1
                matisalncom.reverse()
                # completar la mantisa con 0s
                while len(matisalncom) < 23:
                    matisalncom.extend('0')

        # exponente sesgado
        # bucle para determinar el recorrido de la parte decimal
        while len(ParteDecimal) > 0:
            # extraemos el ultimo elemento de la parte decimal
            Reco = ParteDecimal.pop()

            # condicional para saltar los 0s de la parte decimal
            if (Reco == '0' and sacador == 0):
                Recorrido.extend(Reco)
                # flag
                sacador = 0

            # caso contrario
            else:
                # flag
                sacador = sacador + 1

                # Desplazamiento de la coma
                TopePunto = len(Recorrido) + 1
                TopePunto = TopePunto*(-1)

                # se suma 127 a las posiciones desplazadas por la coma y se convierte a binario
                ExpoParcial = 127 + TopePunto
                ExpoBinario = int_bin(ExpoParcial)

                # guardamos el exp sesgado en una lista
                ExpobinList = []
                for k in ExpoBinario:
                    ExpobinList.append(k)
                # ExpobinList = (ExpobinList[2:])

                # Condicional para verificar si es necesario completar el exponente
                if len(ExpobinList)<8:
                    ExpobinList.reverse()
                    # completamos el exponente sesgado con 0s
                    while len(ExpobinList)<8:
                        ExpobinList.extend('0')
                    ExpobinList.reverse()
                # caso contrario, verificamos que el exponente sesgado empiece en 1
                else:
                    if ExpobinList[0] == '0':
                        ExpobinList[0] = '1'
    # x = ExpobinList.replace('0', '1', 1)
    sublist = [signo, ExpobinList, matisalncom]
    listoflists.append(sublist)

print("\n\nIEEE 754 32 bits para numeros decimales float\n\nSigno\t\t\tExponente\t\t\t\t\t\t\t\tMantisa\t\t\t\t")
# print("",signo,"",ExpobinList,matisalncom)
for i in range(5):
    print(listoflists[i])
