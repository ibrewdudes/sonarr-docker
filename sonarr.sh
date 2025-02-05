#!/bin/bash
# Cargamos las variables de entorno con los directorios de descargas
# y del docker-compose.yaml
source ./envfile

#-----------------------------------------------------------------------------------
# Script para levantar y bajar sonarr
#
# Uso:  
#   - Levantar sonarr: sonarr.sh
#   - Bajar sonarr   : sonarr.sh down
#-----------------------------------------------------------------------------------
cadena_base="BASE_DIR=${DOWNLOADS_HOME} podman-compose -f ${COMPOSE_HOME}/docker-compose.yaml "

# Comprobamos los parámetros de entrada, esperamos 0 ó 1 (la palabra "down")
if [[ -z $1 ]];then
  # No se envió ningún parámetro -> levantamos sonarr
  comando="$cadena_base up -d"
  eval $comando
else
  if [[ $1 == "down" ]];then
    # Bajamos sonarr y transmission
    comando="$cadena_base down"
    eval $comando
  else 
    # Parámetro no esperado
    echo "Paŕametro incorrecto ("$1"): sonarr [down]"
  fi
fi
