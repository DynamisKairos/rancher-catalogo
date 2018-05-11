#!/bin/bash

if [[ -z "${NOIP_USER}" ]]; then
	echo "Debe proveer NOIP_USER como variable de entorno."
	exit 1
fi

if [[ -z "${NOIP_PASSWORD}" ]]; then
	echo "Debe proveer NOIP_PASSWORD como variable de entorno."
	exit 1
fi

if [[ -z "${NOIP_HOSTNAME}" ]]; then
	echo "Debe proveer NOIP_HOSTNAME como variable de entorno."
	exit 1
fi

while true; do
	echo "Obteniendo su direccion de IP actual..."
	IP=$(wget -qO- "http://myexternalip.com/raw")
	echo "Su IP externa es: $IP"

	UPDATE_URL="http://$NOIP_USER:$NOIP_PASSWORD@dynupdate.no-ip.com/nic/update"

	echo "Actualizando $NOIP_HOSTNAME usando la cuenta $NOIP_USER..."
	RESULT=$(wget -qO- --user-agent="no-ip docker/1.0 cjmaio@innerdev.me" $UPDATE_URL)

	if [ -z "$RESULT" ] && [ $? -ne 0 ]; then
		echo "ERROR: Hubo un problema actualizando NO-IP."
		case $? in
		1)
		  RESULT="Error General."
		  ;;
		2)
		  RESULT="Error General."
		  ;;
		3)
		  RESULT="Error de Entrada/Salida en archivo"
		  ;;
		4)
		  RESULT="Falla de red"
		  ;;
		5)
		  RESULT="Error de verificacion SSL"
		  ;;
		6)
		  RESULT="Auntentificacion fallida"
		  ;;
		7)
		  RESULT="Error de protocolo"
		  ;;
		8)
		  RESULT="El servidor emitio una respuesta de error"
		  ;;
		esac
	fi

	echo "RESPUESTA: $RESULT"
	sleep 30m
done

exit 0