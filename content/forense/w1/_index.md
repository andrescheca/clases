+++
title = "Introducción a Kali Linux y Comandos Básicos para Computación Forense"
outputs = ["Reveal"]
+++

## Semana 1

Introducción a Kali Linux y Comandos Básicos para Computación Forense

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Conocer Kali Linux y su importancia en seguridad informática {{% /fragment %}}
{{% fragment class="bullet-point" %}} Aprender la instalación y configuración básica {{% /fragment %}}
{{% fragment class="bullet-point" %}} Dominar comandos esenciales de Linux {{% /fragment %}}
{{% fragment class="bullet-point" %}} Entender sistemas de archivos en Linux {{% /fragment %}}
{{% fragment class="bullet-point" %}} Practicar con ejercicios básicos {{% /fragment %}}

---

{{% section %}}

### Introducción a Kali Linux

Kali Linux es una distribución avanzada de Linux diseñada para pruebas de penetración y seguridad informática. Incluye cientos de herramientas preinstaladas para:

{{% fragment class="bullet-point" %}} Análisis forense digital {{% /fragment %}}
{{% fragment class="bullet-point" %}} Evaluación de vulnerabilidades {{% /fragment %}}
{{% fragment class="bullet-point" %}} Pruebas de penetración {{% /fragment %}}
{{% fragment class="bullet-point" %}} Ingeniería inversa {{% /fragment %}}
{{% fragment class="bullet-point" %}} Análisis de malware {{% /fragment %}}

---

#### Historia y Desarrollo

{{% fragment class="bullet-point" %}} Desarrollado por Offensive Security, anteriormente conocido como BackTrack {{% /fragment %}}
{{% fragment class="bullet-point" %}} Primera versión lanzada en 2013 {{% /fragment %}}
{{% fragment class="bullet-point" %}} Basado en Debian {{% /fragment %}}
{{% fragment class="bullet-point" %}} Actualizaciones regulares (Rolling release) {{% /fragment %}}

---

#### Características Principales

{{% fragment class="bullet-point" %}} Más de 600 herramientas de seguridad preinstaladas {{% /fragment %}}
{{% fragment class="bullet-point" %}} Personalizable y de código abierto {{% /fragment %}}
{{% fragment class="bullet-point" %}} Amplia compatibilidad con hardware {{% /fragment %}}
{{% fragment class="bullet-point" %}} Documentación extensa {{% /fragment %}}
{{% fragment class="bullet-point" %}} Comunidad activa de seguridad {{% /fragment %}}

{{% /section %}}

---

{{% section %}}

### Instalación y Configuración de Kali Linux

Existen varias formas de instalar y utilizar Kali Linux:

---

#### Opciones de Instalación

- **Instalación completa**: Desde [ISO oficial](https://www.kali.org/get-kali/)
- **Máquina Virtual**: OVA preconfigurado para VMware/VirtualBox
- **Live USB**: Arranque sin instalación 
- **WSL**: Windows Subsystem for Linux 
- **Kali en la nube**: AWS, Azure, Google Cloud 

---

#### Requisitos del Sistema

{{% fragment class="bullet-point" %}} Procesador: Intel i3 o equivalente (mínimo) {{% /fragment %}}
{{% fragment class="bullet-point" %}} RAM: 2GB (mínimo), 4GB+ (recomendado) {{% /fragment %}}
{{% fragment class="bullet-point" %}} Almacenamiento: 20GB (mínimo), 60GB+ (recomendado) {{% /fragment %}}
{{% fragment class="bullet-point" %}} Tarjeta gráfica compatible {{% /fragment %}}
{{% fragment class="bullet-point" %}} Conexión a Internet (para actualizaciones) {{% /fragment %}}

---

#### Instalación desde ISO

```bash
# Verificar la integridad del archivo ISO descargado
sha256sum kali-linux-2024.1-installer-amd64.iso

# Crear USB booteable (en Linux)
sudo dd if=kali-linux-2024.1-installer-amd64.iso of=/dev/sdX bs=4M status=progress
```

---

#### Primeros Pasos Post-Instalación

```bash
# Actualizar repositorios e instalar actualizaciones
sudo apt update && sudo apt upgrade -y

# Instalar herramientas adicionales
sudo apt install -y forensics-all

# Configurar shell personalizado
sudo apt install -y zsh
chsh -s $(which zsh)
```

---

#### Interfaz y Navegación en Kali Linux

{{< imgref src="/images/2024/08/kali_desktop.png" alt="Escritorio de Kali" class="img">}}

{{% /section %}}

---

{{% section %}}

### Filosofía y Fundamentos de Linux

---

#### "Todo es un Archivo"

En Linux, todos los elementos del sistema se representan como archivos:

{{% fragment class="bullet-point" %}} Archivos regulares: `/home/usuario/documento.txt` {{% /fragment %}}
{{% fragment class="bullet-point" %}} Directorios: `/etc/` (también son archivos) {{% /fragment %}}
{{% fragment class="bullet-point" %}} Dispositivos de bloques: `/dev/sda` {{% /fragment %}}
{{% fragment class="bullet-point" %}} Dispositivos de caracteres: `/dev/tty` {{% /fragment %}}
{{% fragment class="bullet-point" %}} Sockets: `/var/run/docker.sock` {{% /fragment %}}

Esta filosofía permite manipular todos los recursos del sistema de manera uniforme.

---

#### Estructura del Sistema de Archivos

```
/
├── bin/    - Binarios esenciales del sistema
├── boot/   - Archivos de arranque
├── dev/    - Dispositivos de hardware
├── etc/    - Archivos de configuración
├── home/   - Directorios de usuarios
├── lib/    - Bibliotecas compartidas
├── media/  - Puntos de montaje para dispositivos extraíbles
├── mnt/    - Puntos de montaje temporales
├── opt/    - Software opcional
├── proc/   - Sistema de archivos virtual (procesos)
├── root/   - Directorio del usuario root
├── sbin/   - Binarios del sistema
├── tmp/    - Archivos temporales
├── usr/    - Programas y datos de usuarios
└── var/    - Datos variables (logs, etc.)
```

---

#### Permisos y Propiedad

Los permisos en Linux son cruciales para entender cómo funciona el sistema:

```bash
# Formato de permisos
# tipo | usuario | grupo | otros
# -rwxrwxrwx    usuario grupo    tamaño fecha archivo

ls -la /etc/passwd
-rw-r--r-- 1 root root 2560 Mar 15 10:15 /etc/passwd

# r (4) - Lectura
# w (2) - Escritura
# x (1) - Ejecución
```

---

#### Usuarios y Grupos

```bash
# Información sobre usuarios
cat /etc/passwd
grep "^root:" /etc/passwd
# root:x:0:0:root:/root:/bin/bash

# Información sobre grupos
cat /etc/group
grep "sudo" /etc/group
# sudo:x:27:usuario1,usuario2

# Cambiar permisos de un archivo
chmod 644 archivo.txt  # rw-r--r--
chown usuario:grupo archivo.txt
```

{{% /section %}}

---

{{% section %}}

### Comandos Básicos de Linux

---

#### Navegación del Sistema

```bash
# Mostrar directorio actual
pwd
# /home/usuario/documentos

# Listar archivos (detallado)
ls -la
# Total 32
# drwxr-xr-x 4 user user 4096 Jun 15 10:30 .
# drwxr-xr-x 28 user user 4096 Jun 15 09:45 ..
# -rw-r--r-- 1 user user 8192 Jun 15 10:22 documento1.txt
# -rw-r--r-- 1 user user 2048 Jun 15 10:25 script.sh

# Cambiar de directorio
cd /etc
cd ..  # Directorio padre
cd ~   # Directorio home
cd -   # Directorio anterior
```

---

#### Manipulación de Archivos

```bash
# Copiar archivos
cp archivo.txt copia.txt
cp -r directorio/ copia_dir/  # Recursivo para directorios

# Mover o renombrar
mv archivo.old archivo.new
mv /tmp/archivo.txt ~/documentos/

# Crear directorios
mkdir nuevo_directorio
mkdir -p dir1/dir2/dir3  # Crea directorios anidados

# Eliminar
rm archivo.txt
rm -r directorio/  # Recursivo para directorios
rm -i archivo.txt  # Interactivo (pide confirmación)
```

---

#### Ver Contenido de Archivos

```bash
# Ver archivo completo
cat archivo.txt

# Ver archivo paginado
less archivo_grande.log  # Navegable con flechas, q para salir

# Ver primeras o últimas líneas
head -n 10 archivo.log   # Primeras 10 líneas
tail -n 20 archivo.log   # Últimas 20 líneas

# Seguimiento en tiempo real
tail -f /var/log/syslog  # Ctrl+C para salir
```

---

#### Búsqueda de Archivos

```bash
# Buscar archivos por nombre
find /home -name "*.txt"

# Buscar por tipo
find /etc -type f  # Archivos regulares
find /etc -type d  # Directorios

# Buscar por tamaño
find /var -size +10M  # Archivos mayores a 10MB
find /tmp -size -1M   # Archivos menores a 1MB

# Buscar por permisos
find /bin -perm -u+x  # Archivos ejecutables
```

---

#### Búsqueda de Texto

```bash
# Buscar texto en archivos
grep "palabra" archivo.txt
grep -i "texto" archivo.txt  # Ignora mayúsculas/minúsculas

# Búsqueda recursiva
grep -r "configuración" /etc/

# Mostrar número de línea
grep -n "error" logs.txt

# Contar coincidencias
grep -c "warning" archivo.log
```

{{% /section %}}

---

{{% section %}}

### Redirección y Tuberías (Pipes)

---

#### Redirección Básica

```bash
# Redirección de salida (sobrescribe)
ls -la > listado.txt

# Redirección de salida (añade)
echo "Nueva línea" >> notas.txt

# Redirección de error estándar
comando_inexistente 2> errores.log

# Redirección de salida y error a archivos diferentes
comando > salida.txt 2> errores.txt

# Redirección de salida y error al mismo archivo
comando > todo.log 2>&1
# Forma moderna:
comando &> todo.log
```

---

#### Tuberías (Pipes)

Las tuberías conectan la salida de un comando con la entrada de otro.

```bash
# Contar archivos en un directorio
ls -la | wc -l

# Filtrar por palabra clave y ordenar
grep "error" archivo.log | sort

# Combinar múltiples comandos
cat /etc/passwd | grep "bash" | sort | less

# Encontrar los 5 archivos más grandes
du -h /var | sort -hr | head -5
```

---

#### Operadores de Control

```bash
# Ejecutar comandos en secuencia
comando1 && comando2  # comando2 solo se ejecuta si comando1 es exitoso
comando1 || comando2  # comando2 solo se ejecuta si comando1 falla

# Combinar operadores
mkdir directorio && cd directorio || echo "Error al crear directorio"

# Ejecutar en segundo plano
comando &

# Ejecutar múltiples comandos
comando1 ; comando2 ; comando3  # Se ejecutan todos independientemente
```

{{% /section %}}

---

{{% section %}}

### Ejemplo: Análisis de Logs

Este es un ejemplo de un archivo de log típico:

```
Jun 15 14:23:15 servidor sshd[1234]: Accepted password for usuario from 192.168.1.10 port 56789
Jun 15 14:24:30 servidor sshd[1235]: Failed password for invalid user admin from 10.0.0.5 port 44567
Jun 15 14:25:12 servidor sshd[1236]: Failed password for root from 10.0.0.5 port 44570
Jun 15 14:26:02 servidor sudo[1237]: usuario : TTY=pts/0 ; PWD=/home/usuario ; USER=root ; COMMAND=/bin/ls /root
Jun 15 14:28:45 servidor sshd[1238]: Failed password for invalid user admin from 10.0.0.5 port 44580
Jun 15 14:30:22 servidor sshd[1239]: Accepted publickey for usuario from 192.168.1.15 port 52341
Jun 15 14:32:18 servidor sudo[1240]: usuario : command not allowed ; TTY=pts/1 ; PWD=/var/log ; USER=root ; COMMAND=/bin/rm auth.log
Jun 15 14:35:01 servidor CRON[1241]: (root) CMD (/usr/bin/apt update)
Jun 15 14:40:15 servidor sshd[1242]: Failed password for invalid user postgres from 10.0.0.5 port 44590
Jun 15 14:45:30 servidor sshd[1243]: Failed password for invalid user admin from 10.0.0.5 port 44595
```

---

#### Analizando Logs con Comandos Básicos

```bash
# Filtrar intentos fallidos de login
grep "Failed password" auth.log

# Contar intentos fallidos
grep -c "Failed password" auth.log

# Extraer direcciones IP de intentos fallidos
grep "Failed password" auth.log | awk '{print $11}'

# Contar intentos por IP
grep "Failed password" auth.log | awk '{print $11}' | sort | uniq -c | sort -nr
# Resultado:
# 3 10.0.0.5
# 1 192.168.1.5

# Filtrar por usuario específico
grep "usuario" auth.log | grep "sudo"
```

{{% /section %}}

---

{{% section %}}

### Sistemas de Archivos en Linux

---

#### Tipos de Sistemas de Archivos

{{% fragment class="bullet-point" %}} **ext4**: Sistema de archivos predeterminado en muchas distribuciones Linux {{% /fragment %}}
{{% fragment class="bullet-point" %}} **NTFS**: Usado por Windows, con soporte de lectura/escritura en Linux {{% /fragment %}}
{{% fragment class="bullet-point" %}} **FAT32/exFAT**: Comunes en dispositivos extraíbles {{% /fragment %}}
{{% fragment class="bullet-point" %}} **XFS**: Alto rendimiento para archivos grandes {{% /fragment %}}
{{% fragment class="bullet-point" %}} **Btrfs**: Sistema moderno con instantáneas y RAID {{% /fragment %}}

---

#### Comandos para Sistemas de Archivos

```bash
# Listar particiones y sistemas de archivos
fdisk -l
lsblk -f

# Verificar uso de espacio en disco
df -h
du -sh /var/log/  # Tamaño de un directorio

# Ver tabla de particiones
parted -l
```

---

#### Ejemplo - Una imagen de un filesystem (1/3)

Creemos una imagen de un filesystem:

```bash
┌──(usuario㉿kali)-[~]
└─$ dd if=/dev/zero of=filesystem.img bs=1M count=100
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.0327616 s, 3.2 GB/s
```

El comando `dd` a veces es llamado "disk destroyer", en este caso usamos el archivo con ceros `/dev/zero` para crear un archivo con 100 bloques de 1MiB.

---

#### Ejemplo - Una imagen de un filesystem (2/3)

En este punto tenemos un archivo vacío, creemos un filesystem ext4:

```bash
┌──(usuario㉿kali)-[~]
└─$ mkfs.ext4 filesystem.img 
mke2fs 1.47.1 (20-May-2024)
Discarding device blocks: done                            
Creating filesystem with 102400 1k blocks and 25584 inodes
Filesystem UUID: 46d0d04e-8586-498f-bc52-dea3f0370f10
Superblock backups stored on blocks: 
        8193, 24577, 40961, 57345, 73729
```

El comando `mkfs.ext4` nos permite crear un filesystem.

---

#### Ejemplo - Una imagen de un filesystem (3/3)

Montemos y usemos el filesystem:

```bash
┌──(usuario㉿kali)-[~]
└─$ sudo mkdir -p /mnt/mi_filesystem

┌──(usuario㉿kali)-[~]
└─$ sudo mount filesystem.img /mnt/mi_filesystem
mount: (hint) your fstab has been modified, but systemd still uses
       the old version; use 'systemctl daemon-reload' to reload.

┌──(usuario㉿kali)-[~]
└─$ sudo nano /mnt/mi_filesystem/archivo.txt   
```

Primero creamos un directorio donde vamos a montar el filesystem, y luego procedemos a montarlo.

{{% /section %}}

---

{{% section %}}

### Procesos y Servicios

---

#### Gestión de Procesos

```bash
# Ver procesos en ejecución
ps aux
ps aux | grep firefox

# Monitoreo en tiempo real
top
htop  # Versión mejorada (puede requerir instalación)

# Terminar un proceso
kill 1234        # Terminar proceso con PID 1234
killall firefox  # Terminar todos los procesos firefox
```

---

#### Servicios del Sistema

```bash
# Verificar estado de un servicio
sudo systemctl status ssh

# Iniciar, detener o reiniciar un servicio
sudo systemctl start ssh
sudo systemctl stop apache2
sudo systemctl restart nginx

# Habilitar o deshabilitar inicio automático
sudo systemctl enable ssh
sudo systemctl disable cups
```

---

#### Monitoreo de Recursos

```bash
# Información del sistema
uname -a
cat /etc/os-release

# Información de hardware
lscpu    # CPU
free -h  # Memoria
df -h    # Discos
lsusb    # Dispositivos USB
lspci    # Dispositivos PCI
```

{{% /section %}}

---

{{% section %}}

### Ejercicios Prácticos

---

#### Ejercicio 1: Navegación y Manipulación de Archivos

1. Crear un directorio llamado `ejercicio1`
2. Crear 5 archivos de texto dentro del directorio
3. Crear un subdirectorio y mover 2 archivos allí
4. Listar todos los archivos mostrando permisos, tamaño y fechas
5. Cambiar los permisos de un archivo para hacerlo ejecutable

---

#### Ejercicio 2: Búsqueda y Filtrado

1. Buscar todos los archivos `.conf` en el directorio `/etc`
2. Buscar todas las ocurrencias de la palabra "error" en `/var/log`
3. Contar cuántas líneas contiene cada archivo de texto en un directorio
4. Encontrar todos los archivos modificados en las últimas 24 horas

---

#### Ejercicio 3: Redirección y Pipes

1. Crear un archivo con el listado del directorio `/bin`
2. Encontrar los 10 archivos más grandes del sistema
3. Combinar varios comandos para encontrar todos los usuarios que tienen `/bin/bash` como shell
4. Crear un script que utilice la redirección para guardar el resultado de comandos básicos del sistema

{{% /section %}}

---

{{% section %}}

### Recursos para Práctica

Para practicar los comandos de Linux de forma interactiva:

- [OverTheWire Bandit](https://overthewire.org/wargames/bandit/bandit0.html) - Juego de guerra para practicar comandos Linux
- [CMD Challenge](https://cmdchallenge.com) - Desafíos de línea de comandos de dificultad progresiva

---

#### Consejos para Aprender Linux

{{% fragment class="bullet-point" %}} Consultar las páginas de manual (`man comando`) {{% /fragment %}}
{{% fragment class="bullet-point" %}} Crear un entorno seguro para experimentar {{% /fragment %}}
{{% fragment class="bullet-point" %}} Automatizar tareas con scripts sencillos {{% /fragment %}}
{{% fragment class="bullet-point" %}} Explorar diferentes herramientas para el mismo propósito {{% /fragment %}}

{{% /section %}}

---

{{% section %}}

### Conclusiones

{{% fragment class="bullet-point" %}} La filosofía "todo es un archivo" facilita la administración del sistema {{% /fragment %}}
{{% fragment class="bullet-point" %}} Los comandos de terminal proporcionan gran poder y flexibilidad {{% /fragment %}}
{{% fragment class="bullet-point" %}} El sistema de permisos asegura la integridad del sistema {{% /fragment %}}
{{% fragment class="bullet-point" %}} La redirección y pipes permiten combinar comandos de forma potente {{% /fragment %}}
{{% fragment class="bullet-point" %}} Kali Linux proporciona un conjunto robusto de herramientas para seguridad {{% /fragment %}}

{{% /section %}}

---

### ¿Preguntas?