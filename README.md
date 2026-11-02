# IPLANAY

Cuadernillos geoestadisticos municipales. Este repositorio es el visor:
la API Python, el SQL y los cambios del cliente de mapa.

La plataforma compartida (Postgres, nginx y el proxy) esta en
https://github.com/pedrolunaUAE/plataforma. Este compose no abre puertos.
Se une a la red `plataforma` y el proxy publica http://localhost/iplanay/.

## Arranque

Con la plataforma ya levantada, desde esta carpeta:

```cmd
powershell -File arrancar.ps1
```

Si el repo esta en `proyectos\iplanay`, el script usa el `.env` de la plataforma.
En otra carpeta, copia `.env.example` a `.env` y pon ahi `IPLANAY_DB_PASSWORD`.

La base `iplanay` y el usuario `iplanay_lectura` los crea la plataforma.

## Cliente de mapa

`geovisor/` es un clone de https://git.inegi.org.mx/mxsig/mxsig_client y no se versiona aqui.
`geovisor-overlay/` son los cambios de los cuadernillos.

```cmd
powershell -File scripts\clonar-cliente.ps1
```

El nginx de la plataforma sirve esa carpeta en `/iplanay/`. La API queda en `/iplanay/api/`.

## Lo que no entra a Git

Los PDF de `PDFs/` y `map/vector_iplanay.map`, porque el mapfile lleva la contraseña local.
La plantilla es `map/vector_iplanay.map.example`.
