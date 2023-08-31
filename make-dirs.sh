# Crea los directorios para:
#   - Sonarr
#   - Radarr
#   - Transmission
#   - Jackett

# Cargamos las variables de entorno con los directorios de descargas
# y del docker-compose.yaml
source ./envfile

declare -a config_dir=(
 	"${DOWNLOADS_HOME}/config/jackett"
	"${DOWNLOADS_HOME}/config/sonarr"
	"${DOWNLOADS_HOME}/config/transmission"
)

declare -a data_dir=(
 	"${DOWNLOADS_HOME}/data/transmission/downloads"
	"${DOWNLOADS_HOME}/data/transmission/watch"
	"${DOWNLOADS_HOME}/data/tv"
)

# Crea los directorios de configuración
for i in "${config_dir[@]}"
  do
    echo -e "Creando directorio ${i}\n"
    mkdir -p $i
  done

# Crea los directorios de datos
for i in "${data_dir[@]}"
  do
    echo -e "Creando directorio ${i}\n"
    mkdir -p $i
  done

