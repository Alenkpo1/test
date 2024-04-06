#!/bin/bash

# Función para mostrar el uso del script
mostrar_uso() {
    echo "Uso: $0 [-o salida] <archivo> [archivo [archivo [...]]]"
}

# Comprobamos si se proporcionó el flag -o
if [ "$1" == "-o" ]; then
    # Verificamos si se proporcionó el nombre de salida
    if [ -z "$2" ]; then
        echo "Debe proporcionar un nombre de archivo de salida después del flag -o."
        mostrar_uso
        exit 1
    fi
    # Asignamos el nombre de salida y eliminamos los primeros dos argumentos
    salida="$2"
    shift 2
else
    salida=""
fi

# Verificamos si hay al menos un archivo para unir
if [ "$#" -lt 1 ]; then
    echo "Debe proporcionar al menos un archivo para unir."
    mostrar_uso
    exit 1
fi

# Concatenamos los archivos
if [ -n "$salida" ]; then
    # Si se proporcionó un archivo de salida, redirigimos la salida al archivo
    cat "$@" > "$salida"
else
    # Si no se proporcionó un archivo de salida, mostramos la salida en la terminal
    cat "$@"
fi

