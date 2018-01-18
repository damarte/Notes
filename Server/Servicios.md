# Servicios

## Crear un servicio en el servidor

Crear por ejemplo el archivo `/etc/systemd/system/<service>.service` con el siguiente contenido:

```bash
[Unit]
Description=<service> Service
After=network.target

[Service]
Type=simple
User=root
Restart=always
ExecStart=/var/www/<nombre-host>/<service>.sh
ExecStop=/var/www/<nombre-host>/stop<service>.sh

[Install]
WantedBy=multi-user.target
```
Y crear los siguientes archivos:

`/var/www/<nombre-host>/<service>.sh`


```bash
#!/bin/bash
cd /var/www/<nombre-host>/httpdocs && sudo app/Console/cake Queue.Queue runworker >> /var/www/<nombre-host>/httpdocs/app/tmp/logs/runworker.log
```


`/var/www/<nombre-host>/stop<service>.sh`


```bash
#!/bin/bash

pid=$(cat /run/<service>.pid)
pid2=$(($pid+1))
pid3=$(($pid2+1))
echo "$pid"
echo "$pid2"
echo "$pid3"

kill -9 $pid
kill -9 $pid2
kill -9 $pid3
rm -f /run/<service>.pid
echo "Stop Demonio de <service>"
```

## Para arrancar/parar/comprobar el estado del servicio

```bash
sudo systemctl start <service>
sudo systemctl stop <service>
sudo systemctl status <service>
```

