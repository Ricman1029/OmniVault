def ordernar(lista):
    for i in range(len(lista)):
        for j in range(len(lista) - 1):
            if lista[i][1] < lista[j][1]:
                lista[i], lista[j] = lista[j], lista[i]


def main():
    """La idea es hacer una funcion que, dado un conjunto de eventos representados como tuplas (inicio, fin), determine la maxima cantidad de eventos no solapados que pueden llevarse a cabo."""
    eventos = [(1, 3), (2, 5), (4, 6), (5, 7), (7, 8)]
    
    """Lo que se me ocurre que puedo hacer es primero ordenar la lista con todas las tuplas segun su hora de finalizacion, una vez que las tengo ordenadas voy agarrando la primer tupla, y agarro la siguiente que no se solape con la primera."""
    ordernar(eventos)

    lista = list()
    lista.append(eventos[0])
    for elemento in lista:
        for evento in eventos:
            if evento[0] > elemento[1]:
                lista.append(evento)
                break

    print(lista)

if __name__ == "__main__":
    main()
