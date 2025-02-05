# Crea los directorios para:
#   - Sonarr
#   - Transmission
#   - Prowlarr

# Cargamos las variables de entorno con los directorios de descargas
# y del docker-compose.yaml
source ./.env

declare -a data_dir=(
 	"${BASE_DIR}/data/transmission/downloads"
 	"${BASE_DIR}/data/transmission/downloads/complete"
 	"${BASE_DIR}/data/transmission/downloads/incomplete"
 	"${BASE_DIR}/data/transmission/downloads/tv"
  "${BASE_DIR}/config/transmission"
  "${BASE_DIR}/data/transmission/watch"
  "${BASE_DIR}/config/prowlarr"
)

# Crea los directorios de datos
for i in "${data_dir[@]}"
  do
    echo -e "Creando directorio ${i}\n"
    mkdir -p $i
  done

# Cambiamos el propietario al usuario del contenedor
sudo chown -R 525287:525287 ${BASE_DIR}/data/transmission/downloads
sudo chmod -R 755 ${BASE_DIR}/data/transmission/downloads

