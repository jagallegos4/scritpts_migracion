archivo_entrada='script_migracion.txt'
archivo_salida='salto_de_linea.txt'



def buscar_palabras_con_ont(archivo_entrada, archivo_salida):
    palabras_encontradas = []

    # Abrir el archivo de entrada en modo lectura
    with open(archivo_entrada, 'r') as archivo:
        # Leer cada línea del archivo
        for linea in archivo:
            # Dividir la línea en palabras
            palabras = linea.split()
            # Iterar sobre cada palabra en la línea
            for palabra in palabras:
                # Verificar si la palabra empieza con 'ont ' (ont seguido de un espacio)
                if palabra.startswith('ont'):
                    palabras_encontradas.append(palabra)

    # Escribir las palabras encontradas en el archivo de salida con un salto de línea después de cada una
    with open(archivo_salida, 'w') as archivo:
        for palabra in palabras_encontradas:
            archivo.write(palabra + '\n')

# Llamar a la función con los nombres de los archivos
buscar_palabras_con_ont(archivo_entrada, archivo_salida)
