def imprimir_serie():
    letras = ['f', 'g', 'h', 'i', 'j', 'k']

    for numero in range(3, 48):
        for letra in letras:
            print("=",f"{letra}{numero}")
        #print()  # Agrega un salto de línea después de cada fila


# Llama a la función para imprimir la serie
imprimir_serie()
