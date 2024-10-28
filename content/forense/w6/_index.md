+++
title = "Fundamentos de Computación Forense - Adquisición y Preservación de Evidencia"
outputs = ["Reveal"]
+++

## Análisis de Evidencia Digital
### Fundamentos de Computación Forense

---

### Objetivos de la Clase
- Comprender los principios del análisis de evidencia digital
- Aprender técnicas de análisis de imágenes de disco y memoria
- Explorar el análisis del registro de Windows y archivos temporales del navegador
- Practicar el análisis con Sleuth Kit en Linux

{{% note %}}
En esta clase, nos sumergiremos en el proceso de análisis de evidencia digital. Comenzaremos con los fundamentos y luego pasaremos a técnicas más avanzadas. La clase será muy práctica, simulando un análisis real que iremos desarrollando paso a paso. Asegúrense de tener sus herramientas listas y de seguir cada paso con atención.
{{% /note %}}

---

### Instalar versión reciente de Autopsy

- Pasos en [GitHub](https://github.com/sleuthkit/autopsy/issues/7887#issuecomment-2160954937)

---

### Caso de Estudio: Sospecha de Exfiltración de Datos
- Empresa sospecha que un empleado ha estado filtrando información confidencial
- Tenemos acceso a una imagen del disco duro del empleado
- Objetivo: Encontrar evidencia de actividades sospechosas

{{% note %}}
Este será nuestro escenario para la clase de hoy. A medida que avancemos en el análisis, iremos descubriendo pistas y evidencias relacionadas con este caso. Es importante mantener una mente abierta y documentar todos nuestros hallazgos, incluso si inicialmente no parecen relevantes.
{{% /note %}}

---

### Teoría: Áreas Clave de Análisis en Windows

1. Sistema de archivos
2. Registro de Windows
3. Archivos de registro (logs)
4. Artefactos de Internet
5. Memoria RAM
6. Archivos de paginación y hibernación

{{% note %}}
Estas son las principales áreas que un investigador forense debe examinar en un sistema Windows:

1. El sistema de archivos contiene todos los archivos y directorios del sistema.
2. El registro es una base de datos jerárquica que almacena configuraciones y opciones del sistema.
3. Los archivos de registro proporcionan un historial detallado de eventos del sistema.
4. Los artefactos de Internet incluyen historiales de navegación, cookies y caché.
5. La memoria RAM contiene datos volátiles cruciales sobre el estado actual del sistema.
6. Los archivos de paginación y hibernación pueden contener datos valiosos que ya no están en la RAM.

Cada una de estas áreas puede proporcionar información vital en una investigación forense.
{{% /note %}}

---

### Sistema de Archivos Windows: Qué Buscar

- Archivos recién creados o modificados
- Archivos eliminados
- Archivos ocultos o con atributos sospechosos
- Extensiones de archivo inconsistentes
- Archivos en ubicaciones inusuales
- Archivos de gran tamaño o con nombres sospechosos

{{% note %}}
Al analizar el sistema de archivos, debemos prestar atención a:

- Archivos creados o modificados en fechas relevantes para la investigación.
- Archivos eliminados que puedan contener información crucial.
- Archivos ocultos o con atributos que puedan indicar un intento de ocultación.
- Archivos cuyo contenido no coincide con su extensión, lo que puede indicar un intento de disfrazar su verdadera naturaleza.
- Archivos ubicados en directorios donde normalmente no deberían estar.
- Archivos inusualmente grandes o con nombres que no siguen las convenciones normales del sistema o la organización.

Estas anomalías pueden ser indicadores de actividad sospechosa o maliciosa.
{{% /note %}}

---

### Registro de Windows: Áreas Clave

1. HKEY_LOCAL_MACHINE\SOFTWARE
2. HKEY_LOCAL_MACHINE\SYSTEM
3. HKEY_CURRENT_USER
4. HKEY_USERS

Buscar:
- System32 -> SAM, Security, **Software**, System
- Software instalado recientemente
- Claves de ejecución automática
- Historial de USB
- Configuraciones de red
- Leemos los archivos con [FRED](https://files.pinguin.lu/fred-0.1.0beta4-win32.exe)

{{% note %}}
El registro de Windows es una fuente rica de información forense:

1. HKEY_LOCAL_MACHINE\SOFTWARE contiene información sobre el software instalado en el sistema.
2. HKEY_LOCAL_MACHINE\SYSTEM almacena configuraciones del sistema y controladores.
3. HKEY_CURRENT_USER contiene configuraciones específicas del usuario actual.
4. HKEY_USERS almacena perfiles de todos los usuarios del sistema.

Al analizar el registro, buscamos:
- Software instalado en fechas relevantes para la investigación.
- Programas configurados para ejecutarse automáticamente al inicio del sistema.
- Dispositivos USB que se han conectado al sistema.
- Configuraciones de red que puedan indicar conexiones sospechosas.

Estas áreas pueden revelar mucho sobre las actividades del usuario y los cambios en el sistema.
{{% /note %}}

---

### Artefactos de Internet: Fuentes Clave

1. Historiales de navegación
2. Cookies
3. Caché del navegador
4. Archivos de descarga
5. Formularios y contraseñas guardadas

Ubicaciones comunes:
- Chrome: %USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\
- Firefox: %APPDATA%\Mozilla\Firefox\Profiles\
- Edge: %USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\

{{% note %}}
Los artefactos de Internet son cruciales en muchas investigaciones:

1. Los historiales de navegación muestran los sitios visitados y cuándo.
2. Las cookies pueden revelar inicios de sesión en diversos servicios web.
3. La caché del navegador puede contener copias de páginas web y archivos descargados.
4. Los archivos de descarga muestran qué se ha descargado y cuándo.
5. Los formularios y contraseñas guardados pueden proporcionar información sobre las cuentas utilizadas.

Conocer las ubicaciones específicas de estos artefactos para cada navegador es esencial para un análisis exhaustivo. Recuerden que estos paths pueden variar dependiendo de la versión del sistema operativo y del navegador.
{{% /note %}}

---

### Análisis de Memoria: Qué Buscar

1. Procesos en ejecución
2. Conexiones de red activas
3. Archivos abiertos
4. Claves y contraseñas en texto plano
5. Malware inyectado
6. Datos de aplicaciones

{{% note %}}
El análisis de memoria proporciona una visión única del estado del sistema en el momento de la adquisición:

1. La lista de procesos puede revelar malware o software sospechoso en ejecución.
2. Las conexiones de red activas pueden mostrar comunicaciones maliciosas o exfiltración de datos.
3. Los archivos abiertos indican qué información estaba siendo accedida.
4. A veces, se pueden encontrar claves de cifrado o contraseñas en texto plano en la memoria.
5. El malware inyectado en procesos legítimos puede ser detectado mediante análisis de memoria.
6. Se pueden recuperar datos de aplicaciones que no se guardaron en el disco.

El análisis de memoria es crucial para entender el estado dinámico del sistema y puede revelar información que no está disponible en el análisis de disco.
{{% /note %}}

---

### Análisis de Imagen de Disco E01
1. Verificación de integridad
2. Montaje de la imagen E01
3. Análisis de estructura de archivos
4. Búsqueda de archivos eliminados
5. Análisis de metadatos

{{% note %}}
El análisis de una imagen E01 requiere algunas consideraciones especiales:

1. La verificación de integridad es crucial para asegurar que la imagen no ha sido alterada.
2. El montaje de una imagen E01 requiere herramientas específicas compatibles con este formato.
3. El análisis de la estructura de archivos, búsqueda de archivos eliminados y análisis de metadatos siguen siendo pasos cruciales.

En Kali Linux, utilizaremos herramientas como ewf-tools y The Sleuth Kit para este análisis.
{{% /note %}}

---

### Preparación del Entorno en Kali Linux
1. Instalación de herramientas necesarias:
   ```
   sudo apt-get update
   sudo apt-get install ewf-tools sleuthkit ntfs-3g
   ```
2. Verificar la instalación:
   ```
   ewfinfo --version
   mmls --version
   ```

{{% note %}}
Antes de comenzar el análisis, asegurémonos de tener todas las herramientas necesarias:

1. ewf-tools nos permitirá trabajar con imágenes E01.
2. The Sleuth Kit (que incluye mmls, fls, etc.) es esencial para el análisis forense.
3. Autopsy es una interfaz gráfica para The Sleuth Kit que puede ser útil para visualizaciones.

Verifiquen que todas las herramientas se hayan instalado correctamente antes de proceder.
{{% /note %}}

---

### Verificación de Integridad de la Imagen E01
1. Obtener información de la imagen:
   ```
   ewfinfo evidencia.E01
   ```
2. Verificar el hash:
   ```
   ewfverify evidencia.E01
   ```

{{% note %}}
La verificación de integridad es crucial:

1. `ewfinfo` nos proporciona metadatos sobre la imagen, incluyendo hashes calculados durante la adquisición.
2. `ewfverify` recalcula el hash de la imagen y lo compara con el hash almacenado.

Si los hashes coinciden, podemos estar seguros de que la imagen no ha sido alterada desde su adquisición.
{{% /note %}}

---

### Montaje de la Imagen E01 (Paso 1: Preparación)

1. Instalar herramientas necesarias:
   ```
   sudo apt-get update
   sudo apt-get install ewf-tools sleuthkit ntfs-3g regripper
   ```
2. Crear puntos de montaje:
   ```
   sudo mkdir /mnt/forense
   sudo mkdir /mnt/evidencia
   ```

{{% note %}}
Antes de comenzar el montaje:
- Asegúrese de que los estudiantes tengan los permisos necesarios para ejecutar comandos sudo.
- Explique brevemente la función de cada herramienta instalada:
  - ewf-tools: para manejar imágenes E01
  - sleuthkit: conjunto de herramientas forenses
  - ntfs-3g: para montar sistemas de archivos NTFS
- Los dos puntos de montaje son necesarios: uno para la imagen E01 y otro para la partición específica que examinaremos.
{{% /note %}}

---

### Montaje de la Imagen E01 (Paso 2: Montar la Imagen)

1. Montar la imagen EWF:
   ```
   kali@kali:/media/kali/Jams_ 5TB/forensics$ sudo ewfmount /home/kali/forensics/windows.E01 /mnt/forense
   ewfmount 20140814
   ```

{{% note %}}
Explicación del comando:
- `ewfmount`: herramienta para montar imágenes EWF
- `/home/kali/forensics/windows.E01`: ruta a la imagen E01
- `/mnt/forense`: punto de montaje para la imagen

El número que aparece (20140814) es la versión de ewfmount. Puede variar dependiendo de la instalación.

Asegúrese de que los estudiantes ajusten la ruta de la imagen E01 según su configuración.
{{% /note %}}

---

### Montaje de la Imagen E01 (Paso 3: Analizar la Estructura)

1. Examinar la estructura de particiones:
```
   kali@kali:/media/kali/Jams_ 5TB/forensics$ sudo mmls /mnt/forense/ewf1
   GUID Partition Table (EFI)
   Offset Sector: 0
   Units are in 512-byte sectors
         Slot      Start        End          Length       Description
   000:  Meta      0000000000   0000000000   0000000001   Safety Table
   001:  -------   0000000000   0000002047   0000002048   Unallocated
   002:  Meta      0000000001   0000000001   0000000001   GPT Header
   003:  Meta      0000000002   0000000033   0000000032   Partition Table
   004:  000       0000002048   0000616447   0000614400   Basic data partition
   005:  001       0000616448   0000821247   0000204800   EFI system partition
   006:  002       0000821248   0001083391   0000262144   Microsoft reserved partition
   007:  003       0001083392   0262141951   0261058560   Basic data partition
   008:  -------   0262141952   0262143999   0000002048   Unallocated
```

{{% note %}}
Explicación de la salida de `mmls`:
- Muestra la tabla de particiones GUID (GPT), común en sistemas modernos.
- Identificamos la partición principal de datos: partición 007, que comienza en el sector 1083392. 
- Esta partición es probablemente la que contiene el sistema de archivos Windows y los datos del usuario.

Haga que los estudiantes noten la importancia de identificar correctamente la partición relevante para el análisis.
{{% /note %}}

---

### Montaje de la Imagen E01 (Paso 4: Montar la Partición)

1. Montar la partición principal de datos:
```
kali@kali:/media/kali/Jams_ 5TB/forensics$ sudo mount -o ro,loop,offset=$((512*1083392)),show_sys_files,stream_interface=windows /mnt/forense/ewf1 /mnt/evidencia
```

2. Verificar el montaje:
```
kali@kali:/media/kali/Jams_ 5TB/forensics$ ls /mnt/evidencia
 '$AttrDef'   '$Extend'    '$Recycle.Bin'   appverifUI.dll             PerfLogs                Recovery                      vfcompat.dll
 '$BadClus'   '$LogFile'   '$Secure'        'Documents and Settings'   'Program Files'         swapfile.sys                  Windows
 '$Bitmap'    '$MFT'       '$UpCase'        DumpStack.log.tmp          'Program Files (x86)'   'System Volume Information'
 '$Boot'      '$MFTMirr'   '$Volume'        pagefile.sys               ProgramData             Users
```

{{% note %}}
Explicación del comando de montaje:
- `-o ro`: monta en modo de solo lectura para preservar la evidencia
- `loop`: necesario para montar un archivo como dispositivo
- `offset=$((512*1083392))`: especifica dónde comienza la partición
- `show_sys_files,stream_interface=windows`: opciones para NTFS que permiten ver archivos del sistema y manejar flujos de datos alternativos

La salida de `ls` muestra una estructura típica de sistema de archivos Windows, confirmando un montaje exitoso.

Enfatice la importancia de montar en modo de solo lectura para mantener la integridad de la evidencia.
{{% /note %}}

---

### Desmontaje y Limpieza

1. Desmontar la evidencia:
   ```
   kali@kali:/media/kali/Jams_ 5TB/forensics$ sudo umount /mnt/evidencia
   ```

2. Desmontar la imagen EWF:
   ```
   kali@kali:/media/kali/Jams_ 5TB/forensics$ sudo umount /mnt/forense
   ```

{{% note %}}
Recuerde a los estudiantes la importancia de desmontar correctamente:
- Previene la corrupción de datos.
- Es una buena práctica en el manejo de evidencias digitales.
- Libera recursos del sistema.

Después del desmontaje, la evidencia ya no será accesible a través de los puntos de montaje, lo que ayuda a prevenir modificaciones accidentales.
{{% /note %}}

--- 

### Análisis de Archivos
1. Examinar el contenido del punto de montaje:
```
ls -la /mnt/evidencia
```
2. Buscar archivos sospechosos:
```
find /mnt/evidencia -type f \( -name "*.png" -o -name "*.bin" -o -name "*.eml" -o -name "*.docx" -o -name "*.xlsx" -o -name "*.exe" \)
```

{{% note %}}
Ahora que tenemos la imagen montada, comenzamos con un examen general:

1. `ls -la /mnt/evidencia` nos muestra la estructura general del sistema de archivos.
2. Usamos `find` para buscar específicamente algunos tipos de archivos sospechosos.

Instruya a los estudiantes a notar:
- El archivo grande "large_suspicious_file.bin"
- El archivo con extensión sospechosa: "normal_doc.txt.exe"
- Cualquier archivo .png que pueda ser sospechoso

Explique que no encontraremos los archivos .gif y .pdf en esta búsqueda inicial, ya que han sido borrados y requerirán técnicas de recuperación de datos.
{{% /note %}}

---

### Archivos interesantes (1)

- ¿Qué hay en el directorio del usuario?


---

### Archivos interesantes (2)

```
kali@kali:/mnt/evidencia$  /bin/cat "/mnt/evidencia/\$Recycle.Bin/S-1-5-21-3165663338-406354498-3243259749-1000/\$RWDU2ZK.eml"

From: hacker@example.com

To: insider@company.com

Subject: Access Granted



I've successfully breached the firewall. You should now have admin access to all systems. Delete this email after reading.

```

---

### Análisis del Registro de Windows
1. Localizar archivos de registro:

```
find /mnt/evidencia -name "NTUSER.DAT"
find /mnt/evidencia -name "SYSTEM" -o -name "SOFTWARE"
```
2. Analizar con RegRipper:

```
sudo apt install regripper
kali@kali:~$  regripper -r /mnt/evidencia/Windows/System32/config/SOFTWARE -p tasks                                                                     ─╯
```

{{% note %}}
El análisis del registro de Windows sigue siendo crucial:

1. Buscamos los archivos de registro principales: NTUSER.DAT para perfiles de usuario, SYSTEM y SOFTWARE para configuraciones del sistema.
2. RegRipper nos ayuda a extraer información relevante de estos archivos.

Busquen software instalado recientemente, conexiones de red persistentes y cualquier otra configuración sospechosa.

Explicar persistencia de malware via run, runonce y scheduled tasks
{{% /note %}}

---

### Análisis del Registro de Windows (2)

```
kali@kali:/mnt/evidencia/Users/User$  reged -e /mnt/evidencia/Users/User/NTUSER.DAT
reged version 0.1 140201, (c) Petter N Hagen
openHive(/mnt/evidencia/Users/User/NTUSER.DAT) failed: Read-only file system, trying read-only
Simple registry editor. ? for help.

> dir
Node has 10 subkeys and 0 values
  key name
  <AppEvents>
  <Console>
  <Control Panel>
  <Environment>
  <EUDC>
  <Keyboard Layout>
  <Network>
  <Printers>
  <Software>
  <System>

> cd Software

\Software> dir
...
```

{{% note %}}
En esta zona se deberia encontrar SuspiciousSoftware
{{% /note %}}

---

### Análisis de Artefactos de Internet
1. Localizar archivos de navegador:

```
kali@kali:/mnt/evidencia/Users/User$  find /mnt/evidencia/Users/User -name "History"
/mnt/evidencia/Users/User/AppData/Local/History
/mnt/evidencia/Users/User/AppData/Local/Microsoft/Edge/User Data/Default/History
/mnt/evidencia/Users/User/AppData/Local/Microsoft/Windows/History
/mnt/evidencia/Users/User/AppData/Local/Packages/MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy/LocalState/EBWebView/Default/History
/mnt/evidencia/Users/User/AppData/Roaming/Code/User/History
```

{{% note %}}
Los artefactos de Internet pueden revelar mucho sobre las actividades del usuario:

1. Buscamos archivos de historial de diferentes navegadores.
2. Utilizamos herramientas como sqlite3 para analizar las bases de datos de los navegadores.

Presten atención a visitas a sitios de almacenamiento en la nube, servicios de correo electrónico o cualquier otro sitio relevante para la investigación de exfiltración de datos.
{{% /note %}}

---

### Análisis de Artefactos de Internet (2)

```
kali@kali:/mnt/evidencia/Users/User$  file "/mnt/evidencia/Users/User/AppData/Local/Microsoft/Edge/User Data/Default/History"
/mnt/evidencia/Users/User/AppData/Local/Microsoft/Edge/User Data/Default/History: SQLite 3.x database, last written using SQLite version 3045002, file counter 4, database pages 46, cookie 0x26, schema 4, UTF-8, version-valid-for 4
kali@kali:/mnt/evidencia/Users/User$  sqlite3 "/mnt/evidencia/Users/User/AppData/Local/Microsoft/Edge/User Data/Default/History"
SQLite version 3.45.3 2024-04-15 13:34:05
Enter ".help" for usage hints.
sqlite> SELECT datetime(last_visit_time/1000000-11644473600, 'unixepoch', 'localtime') as last_visit_time, url, title FROM urls ORDER BY last_visit_time DESC;
2024-09-15 00:06:42|https://www.bing.com/search?q=how+to+use+crypto&cvid=45ba6e9f657145d8b879775285287695&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQABhAMgYIAhAAGEAyBggDEAAYQDIGCAQQABhAMgYIBRAAGEAyBggGEAAYQDIGCAcQABhAMgYICBAAGEDSAQg2ODY3ajBqMagCA7ACAQ&FORM=ANSPA1&PC=U531|how to use crypto - Search
2024-09-15 00:04:48|https://www.bing.com/search?q=market+sell+corporate+secrets&qs=n&form=QBRE&sp=-1&ghc=1&lq=0&pq=market+sell+corporate+secret&sc=0-28&sk=&cvid=D3C4DC0995714556B09D7D11112304D6&ghsh=0&ghacc=0&ghpl=|market sell corporate secrets - Search
2024-09-15 00:04:31|https://www.bing.com/search?q=corporate+espionage+opsec&qs=n&form=QBRE&sp=-1&ghc=1&lq=0&pq=corporate+espionage+opsec&sc=10-25&sk=&cvid=11F6A82E8DD54DC9A966040E582725D3&ghsh=0&ghacc=0&ghpl=|corporate espionage opsec - Search
2024-09-15 00:04:05|https://www.bing.com/search?q=how+do+i+encrypt+stolen+data&cvid=2d71c4b09cda497691738c805dc4ec5a&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQABhAMgYIAhAAGEAyBggDEAAYQDIGCAQQABhAMgYIBRAAGEAyBggGEAAYQDIGCAcQABhAMgYICBAAGEDSAQgzNDgzajBqNKgCALACAQ&FORM=ANAB01&PC=U531|how do i encrypt stolen data - Search
2024-09-15 00:01:49|https://www.hackerforums.com/data-exfiltration-techniques|
2024-09-15 00:01:49|https://www.hackerforums.com/lander|
...
sqlite>
```

---

### Recuperando archivos eliminados

```
photorec "/media/kali/Jams_ 5TB/forensics/raw/windows_evidence.raw.raw"
PhotoRec 7.1, Data Recovery Utility, July 2019
Christophe GRENIER <grenier@cgsecurity.org>
https://www.cgsecurity.org
```

---

### Ejercicio en Clase

- Encontrar archivos ocultos en [imagen](https://drive.google.com/file/d/1aQhDp7BZtxCb41AchFmjrZ9aplykzCh4/view?usp=drive_link).

---

### Ejercicio de File Carving (Canon2)

- Analicemos un [ejemplo](https://corp.digitalcorpora.org/corpora/drives/nps-2009-canon2).
- Herramientas: sleuthkit, Autopsy, scalpel

---

# Análisis Forense en Linux

---

## Preparación

1. Instalar herramientas necesarias:
   ```
   sudo apt-get update
   sudo apt-get install ewf-tools sleuthkit autopsy
   ```

2. Verificar la instalación:
   ```
   ewfinfo --version
   mmls --version
   ```

{{% note %}}
Estas herramientas son esenciales para nuestro análisis forense:

- ewf-tools: Permite trabajar con imágenes en formato E01.
- sleuthkit: Proporciona utilidades forenses fundamentales como mmls y fls.
- autopsy: Interfaz gráfica para sleuthkit, útil para visualizaciones.

{{% /note %}}

---

## Montaje de la Imagen E01

1. Crear puntos de montaje:
   ```
   sudo mkdir /mnt/imagen_linux
   sudo mkdir /mnt/evidencia_linux
   ```

2. Montar la imagen E01:
   ```
   sudo ewfmount linux_image.e01 /mnt/imagen_linux
   ```

3. Examinar la estructura de particiones:
   ```
   sudo mmls /mnt/imagen_linux/ewf1
   ```

{{% note %}}
El proceso de montaje es crucial:

1. Creamos dos puntos de montaje: uno para la imagen E01 y otro para la partición que analizaremos.
2. ewfmount monta la imagen E01 como un dispositivo virtual.
3. mmls muestra la estructura de particiones. Busquen la partición principal de Linux, generalmente la más grande.

Explique a los estudiantes cómo identificar la partición correcta basándose en el tamaño y el tipo de sistema de archivos.
{{% /note %}}

---

## Montaje de la Partición Linux

1. Montar la partición principal (ajustar el offset según sea necesario):
   ```
   sudo mount -o ro,loop,offset=$((512*SECTOR_INICIO)) /mnt/imagen_linux/ewf1 /mnt/evidencia_linux
   ```

2. Verificar el montaje:
   ```
   ls /mnt/evidencia_linux
   ```

{{% note %}}
Puntos clave sobre el montaje de la partición:

- Reemplace SECTOR_INICIO con el sector de inicio real de la partición principal de Linux que identificamos con mmls.
- La opción -o ro monta en modo de solo lectura, crucial para preservar la integridad de la evidencia.
- El comando ls debería mostrar la estructura de directorios típica de un sistema Linux (/etc, /home, /var, etc.).

Si no ve esta estructura, verifique que haya utilizado el offset correcto en el comando mount.
{{% /note %}}

---

## Visión General del Sistema

1. Examinar información del sistema:
   ```
   cat /mnt/evidencia_linux/etc/os-release
   ```

2. Revisar paquetes instalados:
   ```
   cat /mnt/evidencia_linux/var/log/dpkg.log | tail
   ```

3. Listar cuentas de usuario:
   ```
   cat /mnt/evidencia_linux/etc/passwd
   ```

{{% note %}}
Esta sección nos da una visión general del sistema:

- os-release proporciona información sobre la distribución y versión de Linux.
- dpkg.log muestra los paquetes instalados recientemente. Busque cualquier software sospechoso o inesperado.
- El archivo passwd contiene todas las cuentas de usuario. Preste especial atención a:
  - Usuarios con ID 0 (equivalentes a root)
  - Usuarios con shells interactivas (/bin/bash)
  - La cuenta 'jorge' que creamos en nuestro escenario


{{% /note %}}

---

## Análisis de Logs de Apache

1. Revisar logs de acceso de Apache:
   ```
   cat /mnt/evidencia_linux/var/log/apache2/access.log
   ```

2. Buscar entradas sospechosas en los logs de error:
   ```
   grep -i error /mnt/evidencia_linux/var/log/apache2/error.log
   ```

{{% note %}}
Los logs de Apache pueden revelar actividades sospechosas:

- En access.log, busque:
  - Patrones de acceso inusuales (muchas solicitudes en poco tiempo)
  - Intentos de acceso a archivos sensibles (/etc/passwd, archivos .php sospechosos)
  - IPs que realizan muchas solicitudes

- En error.log, preste atención a:
  - Errores 400 (Bad Request) o 500 (Internal Server Error) repetitivos
  - Mensajes que indiquen intentos de inyección SQL o XSS


{{% /note %}}

---

## Investigación de Configuración y Logs SSH

1. Examinar la configuración de SSH:
   ```
   cat /mnt/evidencia_linux/etc/ssh/sshd_config
   ```

2. Revisar intentos de login SSH:
   ```
   cat /mnt/evidencia_linux/var/log/auth.log | grep "Failed password"
   ```

{{% note %}}
Aspectos clave de la seguridad SSH:

- En sshd_config, busque configuraciones inseguras como:
  - "PermitRootLogin yes" (permite login directo como root)
  - "PasswordAuthentication yes" (permite autenticación por contraseña)

- En auth.log, analice los intentos fallidos de login:
  - Múltiples intentos desde la misma IP podrían indicar un ataque de fuerza bruta
  - Intentos de login para usuarios que no existen en el sistema


{{% /note %}}

---

## Análisis de Actividades de Usuario

1. Revisar el historial de bash de 'jorge':
   ```
   cat /mnt/evidencia_linux/home/jorge/.bash_history
   ```

2. Examinar .bashrc en busca de entradas sospechosas:
   ```
   cat /mnt/evidencia_linux/home/jorge/.bashrc
   ```

{{% note %}}
El análisis de las actividades del usuario puede revelar comportamientos sospechosos:

- Si .bash_history está vacío o redirigido a /dev/null, esto podría indicar un intento de ocultar actividades.
- En .bashrc, busque:
  - Alias inusuales que puedan ocultar actividades maliciosas
  - Exportaciones de variables de entorno sospechosas
  - Scripts que se ejecuten automáticamente al iniciar sesión


{{% /note %}}

---

## Identificación de Mecanismos de Persistencia

1. Buscar servicios systemd inusuales:
   ```
   ls -l /mnt/evidencia_linux/etc/systemd/system/
   ```

2. Examinar archivo de servicio sospechoso:
   ```
   cat /mnt/evidencia_linux/etc/systemd/system/fake_service.service
   ```

3. Revisar el script asociado:
   ```
   cat /mnt/evidencia_linux/usr/local/bin/fake_service.sh
   ```

{{% note %}}
Los mecanismos de persistencia permiten a los atacantes mantener acceso al sistema:

- Busque servicios con nombres sospechosos o que no correspondan a software legítimo conocido.
- En fake_service.service, preste atención a:
  - El comando ExecStart y su ubicación
  - Si el servicio está configurado para reiniciarse automáticamente

- En fake_service.sh, busque:
  - Comandos que abran puertos de red (como nc -l)
  - Cualquier intento de ejecutar shells o comandos con privilegios elevados


{{% /note %}}

---

## Análisis de Red

1. Buscar puertos en escucha:
   ```
   grep -r "LISTEN" /mnt/evidencia_linux/var/log/
   ```

2. Examinar configuraciones de red:
   ```
   cat /mnt/evidencia_linux/etc/network/interfaces
   ```

{{% note %}}
El análisis de la configuración y actividad de red puede revelar comportamientos sospechosos:

- En los logs, busque puertos en escucha inusuales, especialmente aquellos de alto número (como el 12345 de nuestro servicio falso).
- En la configuración de red, preste atención a:
  - Interfaces de red configuradas con IPs estáticas inusuales
  - Configuraciones que puedan permitir pivoting o tunneling

{{% /note %}}

---

## Análisis del Sistema de Archivos

1. Buscar archivos modificados recientemente:
   ```
   find /mnt/evidencia_linux -type f -mtime -7 -ls
   ```

2. Buscar archivos y directorios ocultos:
   ```
   find /mnt/evidencia_linux -name ".*" -ls
   ```

{{% note %}}
El análisis del sistema de archivos puede revelar actividades sospechosas:

- Archivos modificados recientemente podrían indicar actividades del atacante. Preste especial atención a:
  - Ejecutables en lugares inusuales
  - Scripts en directorios del sistema
  - Archivos grandes que podrían contener datos exfiltrados

- Los archivos y directorios ocultos (que comienzan con .) son comunes en Linux, pero también pueden ser usados para ocultar malware. Busque:
  - Nombres de archivo sospechosos o que imiten archivos de configuración legítimos
  - Directorios ocultos en ubicaciones inusuales (como /tmp o directorios home de otros usuarios)

{{% /note %}}

---

## Conclusión y Limpieza

1. Desmontar la evidencia:
   ```
   sudo umount /mnt/evidencia_linux
   sudo umount /mnt/imagen_linux
   ```

2. Eliminar puntos de montaje:
   ```
   sudo rmdir /mnt/evidencia_linux
   sudo rmdir /mnt/imagen_linux
   ```

{{% note %}}
La limpieza adecuada es crucial en el análisis forense:

- Desmontar correctamente evita la corrupción de datos y libera recursos del sistema.
- Eliminar los puntos de montaje ayuda a mantener el sistema organizado.

{{% /note %}}

---

## Conclusiones sobre análisis

Basándose en el análisis que hemos realizado:

1. ¿Qué signos de compromiso se encontraron?
2. ¿Cómo estaba el atacante manteniendo la persistencia?
3. ¿Qué pasos recomendarían para asegurar este sistema?

{{% note %}}

1. Signos de compromiso:
   - Intentos de fuerza bruta SSH
   - Configuraciones inseguras (PermitRootLogin)
   - Historial de bash oculto

2. Mecanismos de persistencia:
   - Servicio systemd malicioso (fake_service)
   - Posibles modificaciones en .bashrc

3. Pasos para asegurar:
   - Deshabilitar login de root vía SSH
   - Implementar autenticación de dos factores
   - Revisar y eliminar servicios sospechosos
   - Actualizar y parchear el sistema

{{% /note %}}

---

### Preguntas



