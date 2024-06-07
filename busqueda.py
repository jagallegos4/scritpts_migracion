archivo_entrada='vsol.txt'
archivo_saida='series_encontradas.txt'
def buscar_palabras(archivo_entrada, archivo_salida):
    palabras_encontradas = []

    # Abrir el archivo de entrada en modo lectura
    with open(archivo_entrada) as archivo:
        # Leer cada línea del archivo
        for linea in archivo:
            # Dividir la línea en palabras
            palabras = linea.split()
            # Iterar sobre cada palabra en la línea
            for palabra in palabras:
                # Verificar si la palabra empieza con 'pa'
                if palabra.startswith('user') or palabra.startswith('pwd'):
                    palabras_encontradas.append(palabra)


    # Escribir las palabras encontradas en el archivo de salida
    with open(archivo_salida, 'w') as archivo:
        for palabra in palabras_encontradas:
            archivo.write(palabra + '\n')

# Llamar a la función con los nombres de los archivos
buscar_palabras(archivo_entrada, archivo_saida)
