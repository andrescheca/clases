+++
title = "Herramientas Forenses Comunes"
outputs = ["Reveal"]
+++

## Herramientas Forenses Comunes
### Fundamentos y Aplicaciones Prácticas

---

### Objetivos de la Clase
1. Comprender los tipos de herramientas forenses
2. Explorar herramientas populares y sus usos
3. Practicar con comandos y ejemplos reales
4. Analizar casos de estudio

{{% note %}}
La clase se enfocará en herramientas prácticas usadas en investigaciones forenses digitales reales.
{{% /note %}}

---

### Herramientas en Windows

- FTK Imager
- EnCase
- Autopsy
- Recuva
- Volatility (while it can run on Linux, it's often used to analyze Windows memory dumps)
- Wireshark (cross-platform, but often used in Windows environments)
- IDA Pro

---

### Herramientas en Linux 

- DD (Data Duplicator)
- The Sleuth Kit (TSK)
- PhotoRec
- TestDisk
- tcpdump
- Nmap
- SANS SIFT Workstation (Linux distribution with pre-installed forensic tools)

---  

### Tipos de Herramientas Forenses
1. Adquisición de datos
2. Análisis de sistemas de archivos
3. Recuperación de datos
4. Análisis de red
5. Análisis de malware

{{% note %}}
- Explicar brevemente cada categoría:
  1. Adquisición: herramientas para crear copias forenses de dispositivos.
  2. Análisis de sistemas de archivos: para examinar la estructura y contenido de los sistemas de archivos.
  3. Recuperación: para recuperar datos borrados o dañados.
  4. Análisis de red: para examinar el tráfico de red y detectar actividades sospechosas.
  5. Análisis de malware: para identificar y analizar software malicioso.
- Enfatizar que estas categorías a menudo se superponen y que muchas herramientas sirven para múltiples propósitos.
- Mencionar que la elección de la herramienta depende del caso específico y los requisitos legales.
{{% /note %}}

---

### 1. Herramientas de Adquisición de Datos
- **DD (Data Duplicator)**
- FTK Imager
- EnCase

{{% note %}}
- DD: Herramienta de línea de comandos, versátil y ampliamente utilizada.
- FTK Imager: Herramienta gráfica popular, buena para principiantes.
- EnCase: Suite forense completa, estándar en muchas agencias de ley.
- Explicar que nos enfocaremos en DD por su versatilidad y porque entender sus principios ayuda a comprender otras herramientas.
- Mencionar la importancia de utilizar herramientas forenses validadas para asegurar la admisibilidad en corte.
{{% /note %}}

---

### DD (Data Duplicator)
- Comando básico de Unix para copiar y convertir datos
- Uso forense: crear imágenes bit a bit de discos

```bash
dd if=/dev/sda of=/media/evidence.dd bs=4M
```

{{% note %}}
- Explicar cada parte del comando:
  - if: input file (dispositivo de origen)
  - of: output file (archivo de destino)
  - bs: block size (tamaño de bloque para la copia)
- Mencionar que 4M es un tamaño de bloque común para un buen rendimiento, pero puede ajustarse.
- Enfatizar la importancia de usar un bloqueador de escritura hardware para prevenir modificaciones accidentales.
- Advertir sobre el peligro potencial de DD si se usan incorrectamente los parámetros if y of.
- Mencionar variantes como dcfldd que ofrecen características adicionales útiles en forensia.
{{% /note %}}

---

### Ejercicio Práctico: Uso de DD
1. Crea una imagen de una unidad USB
2. Verifica la integridad con un hash MD5

```bash
# Crear imagen
dd if=/dev/sdb of=usb_image.dd bs=4M

# Calcular hash MD5
md5sum /dev/sdb
md5sum usb_image.dd
```

{{% note %}}
- Guiar a los estudiantes paso a paso:
  1. Identificar la unidad USB correcta (advertir sobre el peligro de equivocarse).
  2. Ejecutar el comando dd, explicando que puede tomar tiempo dependiendo del tamaño.
  3. Usar md5sum para calcular el hash del dispositivo original y la imagen.
  4. Comparar los hashes para asegurar una copia exacta.
- Enfatizar la importancia de documentar cada paso, incluyendo los hashes.
- Discutir por qué usamos MD5 a pesar de sus debilidades criptográficas (rapidez, amplia aceptación en forensia).
- Mencionar alternativas como SHA-256 para mayor seguridad.
{{% /note %}}

---

### 2. Análisis de Sistemas de Archivos
- **The Sleuth Kit (TSK)**
- Autopsy (interfaz gráfica para TSK)
- SANS SIFT Workstation

{{% note %}}
- The Sleuth Kit: Conjunto de herramientas de línea de comandos, muy potente y flexible.
- Autopsy: Interfaz gráfica para TSK, buena para análisis visual y reportes.
- SANS SIFT: Distribución Linux con múltiples herramientas forenses preinstaladas.
- Explicar que nos enfocaremos en TSK por su versatilidad y porque entender sus comandos ayuda a comprender los procesos subyacentes en herramientas gráficas.
- Mencionar que TSK puede trabajar con múltiples sistemas de archivos (FAT, NTFS, ext, etc.).
{{% /note %}}

---

### The Sleuth Kit (TSK)
Conjunto de herramientas de línea de comandos para analizar discos e imágenes de disco

Comandos comunes:
```bash
# Listar particiones
mmls imagen.dd

# Examinar sistema de archivos
fsstat -o 2048 imagen.dd

# Listar archivos y directorios
fls -o 2048 imagen.dd
```

{{% note %}}
dd if=/dev/zero of=/home/jorge/disk_image.dd bs=1M count=154
Create the partition
sudo fdisk /home/jorge/disk_image.dd 
sudo losetup -fP /home/jorge/disk_image.dd
loopdev=$(losetup -a | grep disk_image.dd | cut -d: -f1)
sudo mkfs.ext4 ${loopdev}p1
sudo losetup -d $loopdev
Sets up a loop device for your file
Identifies which loop device was used
Creates an ext4 filesystem on the first partition of that loop device
Detaches the loop device
If needed, to check who has it open
sudo lsof /dev/loop0p1
then we can proceed to
sudo umount /dev/loop0p1
- mmls: Muestra la estructura de particiones. Útil para identificar offsets.
- fsstat: Proporciona información detallada sobre el sistema de archivos.
- fls: Lista archivos y directorios, incluyendo archivos borrados.
- Explicar el significado de `-o 2048`:
  - o: offset
  - 2048: número de sectores antes del inicio de la partición (varía según la imagen)
- Demostrar cómo obtener el valor correcto del offset usando la salida de mmls.
- Mencionar que estos comandos son la base para un análisis más profundo con otras herramientas de TSK.
{{% /note %}}

---

### Ejercicio: Análisis con TSK
Usando la imagen creada anteriormente:

1. Identifica las particiones
2. Examina el sistema de archivos
3. Lista los archivos en el directorio raíz

{{% note %}}
Guiar a los estudiantes paso a paso:
1. Usar `mmls usb_image.dd` para identificar particiones y sus offsets.
2. Usar `fsstat -o [offset] usb_image.dd` para examinar el sistema de archivos.
   - Explicar la información mostrada (tipo de sistema de archivos, tamaño de cluster, etc.).
3. Usar `fls -o [offset] usb_image.dd` para listar archivos y directorios.
   - Explicar la notación de TSK para archivos borrados (nombres con asterisco).
- Discutir cómo interpretar la salida de cada comando y su relevancia en una investigación forense.
- Mencionar cómo estos comandos se pueden combinar en scripts para análisis automatizados.
{{% /note %}}

---

### Práctica
[Descargar](https://drive.google.com/file/d/1YW_XdZnyMcOsEA-zlBGqWtargGxv-dRJ/view?usp=drive_link) una imagen

1. Identifica las particiones
2. Examina el sistema de archivos
3. Lista los archivos en el directorio raíz


---

### 3. Recuperación de Datos
- **PhotoRec**
- Recuva
- TestDisk

{{% note %}}
- PhotoRec: Herramienta de código abierto, muy efectiva para recuperar archivos basándose en firmas.
- Recuva: Popular en Windows, interfaz gráfica amigable.
- TestDisk: Potente para recuperar particiones perdidas y hacer discos bootables.
- Explicar que nos enfocaremos en PhotoRec por su eficacia y porque funciona bien con las imágenes creadas con dd.
- Mencionar que la recuperación de datos puede ser crucial en casos donde se han borrado evidencias.
{{% /note %}}

---

### PhotoRec
- Herramienta de código abierto para recuperar archivos borrados
- Funciona con múltiples sistemas de archivos

Uso básico:
```bash
sudo photorec imagen.img
```

{{% note %}}
- Explicar cómo PhotoRec ignora el sistema de archivos y busca directamente los datos:
  - Ventaja: Puede recuperar archivos incluso de sistemas de archivos dañados.
  - Desventaja: No preserva nombres de archivos o estructura de directorios.
- Desglosar el comando:
  - /d: directorio donde se guardarán los archivos recuperados
  - /dev/sdb1: dispositivo o imagen a analizar
- Mencionar que PhotoRec puede reconocer más de 480 extensiones de archivo.
- Advertir que puede recuperar una gran cantidad de archivos, incluyendo fragmentos, lo que puede requerir un análisis posterior cuidadoso.
{{% /note %}}

---

### Ejercicio con PhotoRec 

[Descargar](https://drive.google.com/file/d/1aQhDp7BZtxCb41AchFmjrZ9aplykzCh4/view?usp=sharing) una imagen y analizarla con PhotoRec

- ¿Hay archivos visibles en la imagen?
- ¿Hay archivos borrados?
- ¿Qué archivos hay?

---

### Caso de Estudio: Recuperación de Evidencia Borrada
Escenario: Un sospechoso borró fotos incriminatorias de su tarjeta SD.

1. Crear imagen de la tarjeta SD con `dd`
2. Usar `PhotoRec` para recuperar archivos borrados
3. Analizar los metadatos de las imágenes recuperadas

{{% note %}}
Guiar a través del proceso:
1. Crear la imagen: `dd if=/dev/sdc of=sd_card.img bs=4M`
2. Ejecutar PhotoRec: `photorec /d /path/to/recovery sd_card.img`
3. Analizar metadatos:
   - Usar ExifTool: `exiftool recovered_image.jpg`
   - Buscar información como fecha de creación, modelo de cámara, GPS, etc.
- Discutir la importancia de trabajar con copias y no con la evidencia original.
- Explicar cómo los metadatos pueden proporcionar información crucial (tiempo, ubicación, dispositivo).
- Mencionar los desafíos legales de la recuperación de datos borrados (expectativa de privacidad, alcance de la orden judicial).
{{% /note %}}

---

### 4. Análisis de Red
- **Wireshark**
- tcpdump
- Nmap

{{% note %}}
- Wireshark: Analizador de protocolos con interfaz gráfica, muy potente y ampliamente usado.
- tcpdump: Herramienta de línea de comandos para captura y análisis de paquetes.
- Nmap: Escáner de red, útil para mapear redes y detectar servicios.
- Explicar que nos enfocaremos en Wireshark por su interfaz visual y capacidades de análisis profundo.
- Mencionar la importancia del análisis de red en casos de intrusiones, exfiltración de datos, etc.
{{% /note %}}

---

### Wireshark
- Analizador de protocolos de red
- Captura y analiza tráfico en tiempo real

Ejemplo de filtro:
```
http.request.method == "POST"
```

{{% note %}}
- Demostrar la interfaz de Wireshark:
  1. Cómo iniciar una captura
  2. Cómo aplicar filtros
  3. Cómo seguir streams de TCP/UDP
- Explicar el filtro de ejemplo:
  - Muestra solo solicitudes HTTP POST, útil para detectar envíos de formularios o uploads.
- Otros filtros útiles:
  - `ip.addr == 192.168.1.100`: Tráfico de/hacia una IP específica
  - `tcp.port == 443`: Tráfico HTTPS
- Mencionar la importancia de entender los protocolos de red para un análisis efectivo.
- Advertir sobre las consideraciones legales de capturar tráfico de red (consentimiento, alcance de la autorización).
{{% /note %}}

---

### Ejercicio: Análisis de Tráfico con Wireshark
1. Capturar tráfico durante 5 minutos
2. Identificar protocolos utilizados
3. Buscar posibles transferencias de archivos

{{% note %}}
Guiar a los estudiantes a través del ejercicio:
1. Iniciar captura en la interfaz de red principal.
2. Mientras se captura, hacer que los estudiantes naveguen por algunos sitios web.
3. Detener la captura después de 5 minutos.
4. Analizar la captura:
   - Usar la pestaña de estadísticas para ver un resumen de protocolos.
   - Aplicar filtros como `http.request.method == "GET"` o `ftp`.
   - Demostrar cómo seguir streams TCP para ver conversaciones completas.
- Discutir los hallazgos: ¿Qué tipos de tráfico son más comunes? ¿Se observa algún patrón inusual?
- Explicar cómo este tipo de análisis puede ser crucial en investigaciones de fuga de datos o actividades maliciosas.
{{% /note %}}

---

### 5. Análisis de Malware
- **Volatility**
- IDA Pro
- Ghidra

{{% note %}}
- Volatility: Framework de código abierto para análisis de memoria volátil.
- IDA Pro: Desensamblador y debugger, estándar en la industria para análisis de malware.
- Ghidra: Herramienta de ingeniería inversa desarrollada por la NSA, alternativa gratuita a IDA Pro.
- Explicar que nos enfocaremos en Volatility por su especialización en análisis de memoria, crucial para detectar malware avanzado.
- Mencionar que el análisis de malware es una disciplina compleja que requiere habilidades avanzadas en programación y sistemas operativos.
{{% /note %}}

---

### Volatility
- Framework para análisis de memoria volátil
- Útil para detectar malware y actividad maliciosa

Comandos básicos:
```bash
# Listar procesos
volatility -f memory.dump --profile=Win10x64 pslist

# Escanear conexiones de red
volatility -f memory.dump --profile=Win10x64 netscan
```

{{% note %}}
- Explicar cada comando:
  - pslist: Lista procesos en ejecución al momento del volcado de memoria.
  - netscan: Muestra conexiones de red activas y puertos abiertos.
- Importancia del perfil correcto (Win10x64 en este ejemplo):
  - Determina cómo Volatility interpreta la estructura de la memoria.
  - Se puede identificar con el comando `imageinfo`.
- Mencionar otros plugins útiles:
  - malfind: Detecta código potencialmente malicioso inyectado.
  - filescan: Encuentra archivos abiertos en memoria.
  - hivelist y printkey: Analizan el registro de Windows.
- Enfatizar que Volatility puede extraer archivos y claves de registro directamente de la memoria.
- Discutir la importancia del análisis de memoria en la detección de malware avanzado que puede no dejar rastros en el disco.
{{% /note %}}

---

### Caso de Estudio: Análisis de Malware en Memoria
Escenario: Se sospecha que un sistema está infectado con un keylogger.

1. Adquirir un volcado de memoria con `winpmem`
2. Usar Volatility para analizar procesos y conexiones
3. Buscar indicadores de compromiso (IoCs)

{{% note %}}
Guiar a través del proceso de investigación:
1. Adquisición de memoria:
   - Demostrar el uso de winpmem: `winpmem_x64.exe memoria.raw`
   - Explicar la importancia de minimizar el impacto en el sistema en vivo.
2. Análisis con Volatility:
   - Identificar procesos sospechosos: `volatility -f memoria.raw --profile=Win10x64 pstree`
   - Buscar conexiones inusuales: `volatility -f memoria.raw --profile=Win10x64 netscan`
   - Detectar código inyectado: `volatility -f memoria.raw --profile=Win10x64 malfind`
3. Búsqueda de IoCs:
   - Explicar qué son los IoCs (nombres de archivos, hashes, IPs, etc.)
   - Demostrar cómo extraer strings: `volatility -f memoria.raw --profile=Win10x64 strings`
   - Buscar patrones conocidos de keyloggers (nombres de archivos, strings específicos)
- Discutir la importancia de correlacionar hallazgos de memoria con otros artefactos del sistema.
- Mencionar la necesidad de mantener una base de conocimientos actualizada sobre técnicas de malware.
{{% /note %}}

---

### Consideraciones Éticas y Legales
- Obtención de permisos adecuados
- Mantener la integridad de la evidencia
- Documentación meticulosa
- Limitaciones jurisdiccionales

{{% note %}}
- Permisos adecuados:
  - Explicar la necesidad de consentimiento o orden judicial.
  - Discutir las diferencias entre investigaciones corporativas y criminales.
- Integridad de la evidencia:
  - Enfatizar el uso de bloqueadores de escritura y hashes.
  - Explicar el concepto de "cadena de custodia" y su importancia legal.
- Documentación:
  - Destacar la necesidad de registrar cada acción realizada sobre la evidencia.
  - Mencionar el uso de herramientas de registro como log2timeline.
- Limitaciones jurisdiccionales:
  - Discutir los desafíos de las investigaciones transfronterizas.
  - Mencionar tratados internacionales relevantes (ej. Convenio de Budapest).
- Enfatizar que el incumplimiento de estas consideraciones puede resultar en evidencia inadmisible en corte.
- Recomendar consultar siempre con asesoría legal antes de proceder con una investigación.
{{% /note %}}

---

### Ejercicio Final: Escenario Integrado
Escenario: Investigación de una brecha de datos corporativa

1. Adquirir imagen del disco del sospechoso
2. Analizar el sistema de archivos en busca de evidencia
3. Recuperar archivos borrados
4. Examinar tráfico de red capturado
5. Analizar memoria en busca de malware

{{% note %}}
Dividir la clase en grupos y guiarlos a través del ejercicio:
1. Adquisición:
   - Discutir qué herramienta usar (ej. DD, FTK Imager) y por qué.
   - Enfatizar la importancia de la documentación y hashing.
2. Análisis de sistema de archivos:
   - Sugerir el uso de TSK para examinar la estructura y timeline.
   - Buscar archivos sospechosos, logs, etc.
3. Recuperación de datos:
   - Usar PhotoRec para recuperar archivos borrados.
   - Discutir la relevancia de los archivos recuperados.
4. Análisis de red:
   - Examinar capturas de Wireshark en busca de exfiltración de datos.
   - Identificar conexiones sospechosas o patrones inusuales.
5. Análisis de memoria:
   - Usar Volatility para buscar procesos maliciosos o conexiones ocultas.
   - Correlacionar hallazgos con evidencia del disco y red.
- Pedir a cada grupo que presente su plan de investigación y hallazgos.
- Discutir las diferentes aproximaciones y sus méritos.
- Enfatizar la importancia de un enfoque holístico en investigaciones complejas.
{{% /note %}}

---

### Recursos Adicionales
- SANS Digital Forensics and Incident Response Blog
- Digital Forensics Magazine
- Forensic Focus Forums

{{% note %}}
- SANS DFIR Blog:
  - Destacar la calidad y actualidad de sus artículos técnicos.
  - Mencionar los whitepapers y herramientas gratuitas disponibles.
- Digital Forensics Magazine:
  - Explicar su enfoque en casos prácticos y nuevas técnicas.
  - Mencionar que es una buena fuente para mantenerse al día con las tendencias del campo.
- Forensic Focus Forums:
  - Destacar como una comunidad activa para resolver dudas y compartir conocimientos.
  - Mencionar los webinars y podcasts disponibles.
- Otros recursos:
  - Recomendar libros clave en el campo (ej. "File System Forensic Analysis" de Brian Carrier).
  - Mencionar conferencias importantes como DFRWS o SANS DFIR Summit.
- Enfatizar la importancia de la formación continua en un campo que evoluciona rápidamente.
- Animar a los estudiantes a participar en CTFs (Capture The Flag) de forensia digital.
{{% /note %}}

---

### ¿Preguntas?

{{% note %}}
- Fomentar preguntas y discusión abierta.
- Posibles temas para discutir si no hay preguntas inmediatas:
  - Desafíos futuros en forensia digital (ej. IoT, cloud forensics).
  - Cómo iniciarse en la carrera de investigador forense digital.
  - Certificaciones relevantes en el campo (ej. GCFE, EnCE, CFCE).
- Relacionar los temas vistos con posibles escenarios reales que los estudiantes puedan enfrentar en su carrera.
- Destacar la naturaleza interdisciplinaria de la forensia digital (informática, derecho, investigación).
- Concluir reiterando la importancia de la ética y el profesionalismo en todas las investigaciones forenses.
{{% /note %}}

