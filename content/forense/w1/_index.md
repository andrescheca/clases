+++
title = "Introducción a Kali Linux y Comandos Básicos para Computación Forense"
outputs = ["Reveal"]
+++

### Semana 1
Hoy exploraremos Kali Linux, una herramienta esencial para la seguridad y la computación forense. Nos enfocaremos en la instalación, comandos básicos.

---

### Introducción a Kali Linux
Kali Linux es una distribución avanzada de Linux diseñada para pruebas de penetración y seguridad informática. Viene equipada con numerosas herramientas que facilitan el análisis forense, la evaluación de vulnerabilidades entre otras cosas.

---

### Instalación y Configuración de [Kali Linux](https://www.kali.org/get-kali/)
{{% fragment class="bullet-point" %}} Opción 1: con el archivo ISO{{% /fragment %}}
{{% fragment class="bullet-point" %}} Opción 2: Descargando una VM lista para usar{{% /fragment %}}

---

### Interfaz y Navegación en Kali Linux

{{< imgref src="/images/2024/08/kali_desktop.png" alt="Escritorio de Kali" class="img">}}

---

### Filosofía de Linux: "Todo es un Archivo"
{{% fragment class="bullet-point" %}}En Linux, todo desde dispositivos hasta conexiones de red se trata como archivos, lo que facilita su manipulación a través de comandos estándar, clave para la forense digital.{{% /fragment %}}

---

### Ejemplo - Una imagen de un filesystem (1/3)

Creemos una imagen de un filesystem

```
┌──(jorge㉿kali)-[~]
└─$ dd if=/dev/zero of=filesystem.img bs=1M count=100
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.0327616 s, 3.2 GB/s
```

El comando `dd` a veces es llamado "disk destroyer", en este caso usamos el archivo con ceros `/dev/zero` para crear un archivo con 100 bloques de 1MiB

---

### Ejemplo - Una imagen de un filesystem (2/3)

En este punto tenemos un archivo vacío, creemos un filesystem ext4.

```
┌──(jorge㉿kali)-[~]
└─$ mkfs.ext4 filesystem.img 
mke2fs 1.47.1 (20-May-2024)
Discarding device blocks: done                            
Creating filesystem with 102400 1k blocks and 25584 inodes
Filesystem UUID: 46d0d04e-8586-498f-bc52-dea3f0370f10
Superblock backups stored on blocks: 
        8193, 24577, 40961, 57345, 73729
```

El comando `mkfs.ext4` nos permite crear un filesystem

---

### Ejemplo - Una imagen de un filesystem (3/3)

Montemos y usemos el filesystem

```
┌──(jorge㉿kali)-[~]
└─$ sudo mkdir -p /mnt/nuestro_filesystem

┌──(jorge㉿kali)-[~]
└─$ sudo mount filesystem.img /mnt/nuestro_filesystem
mount: (hint) your fstab has been modified, but systemd still uses
       the old version; use 'systemctl daemon-reload' to reload.

┌──(jorge㉿kali)-[~]
└─$ sudo nano /mnt/nuestro_filesystem/archivo.txt   

```

Primero creamos un directorio donde vamos a montar el filesystem, y luego procedemos a montarlo.

---

### Comandos Básicos de Terminal para Forenses
#### Navegación y Gestión de Archivos
{{% fragment class="bullet-point" %}}Uso de `pwd` para mostrar el directorio actual, `ls` para listar contenidos de directorios, y `cd` para cambiar de directorio, fundamentales para la navegación eficiente en la terminal.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`cp` para copiar archivos, `mv` para mover o renombrar, y `rm` para eliminar, mostrando ejemplos prácticos en tiempo real.{{% /fragment %}}

#### Manipulación de Texto para Análisis Forense
{{% fragment class="bullet-point" %}}Demostración de `grep` buscando patrones específicos en archivos de log, `cut` para seleccionar campos de datos, y `sed` para editar datos in-place sin abrir un editor de texto.{{% /fragment %}}

---

### Herramientas de Red y Seguridad
{{% fragment class="bullet-point" %}}`nmap` para identificar dispositivos en la red, detectar servicios abiertos y configuraciones de firewall, utilizando ejemplos como `nmap -sV -p 1-65535 localhost` para un escaneo completo de puertos.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Uso de `wireshark` para capturar y analizar paquetes de red en tiempo real, explicando cómo aplicar filtros para centrarse en tipos específicos de tráfico.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Configuración de `ssh` para conectarse de manera segura a un servidor remoto, incluyendo la generación de claves SSH y la demostración de una sesión SSH para administrar un servidor de pruebas.{{% /fragment %}}

---

### Sistemas de Archivos en Linux
{{% fragment class="bullet-point" %}}Exploración de los comandos `dd` para crear una imagen de un sistema de archivos y `mount` para montar esa imagen en el sistema, simulando cómo se podría acceder a datos en un contexto forense sin alterar el medio original.{{% /fragment %}}

---

### Ejercicios con [Bandit](https://overthewire.org/wargames/bandit/bandit0.html)
{{% fragment class="bullet-point" %}}Podemos practicar en OverTheWire{{% /fragment %}}

---

### ¿Preguntas?



