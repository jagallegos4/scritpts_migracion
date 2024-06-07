archivo_entrada='migracion.rsc'
archivo_salida='series_encontradas_sin_inicio.txt'


def buscar_reemplazar(archivo_entrada, archivo_salida):
    palabras_sin_inicio = []

    # Abrir el archivo de entrada en modo lectura
    with open(archivo_entrada, 'r') as archivo:
        # Leer cada línea del archivo
        for linea in archivo:
            # Dividir la línea en palabras
            palabras = linea.split()
            # Iterar sobre cada palabra en la línea
            for palabra in palabras:
                # Verificar si la palabra empieza con 'pa'
                if palabra.startswith('name=1'):
                    # Eliminar 'pa' de la palabra y añadirla a la lista
                    palabra_sin_inicio = palabra.replace('name=', '')
                    palabras_sin_inicio.append(palabra_sin_inicio)

    # Escribir las palabras sin 'pa' en el archivo de salida
    with open(archivo_salida, 'w') as archivo:
        for palabra in palabras_sin_inicio:
            archivo.write(palabra + '\n')

# Llamar a la función con los nombres de los archivos
buscar_reemplazar(archivo_entrada, archivo_salida)
