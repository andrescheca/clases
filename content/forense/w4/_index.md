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
La clase se enfocará en herramientas prácticas usadas en investigaciones forenses digitales reales. Los estudiantes deben entender que:

- La forensia digital es una disciplina científica que requiere metodología rigurosa
- Cada herramienta tiene un propósito específico y limitaciones
- La documentación y preservación de evidencia son cruciales
- El análisis forense requiere un enfoque sistemático y metódico
- Las herramientas son solo tan buenas como el analista que las utiliza

Objetivos de aprendizaje detallados:
1. Identificar cuándo usar cada tipo de herramienta
2. Comprender los principios básicos de la adquisición y análisis forense
3. Desarrollar habilidades prácticas en el uso de herramientas comunes
4. Aprender a documentar hallazgos de manera profesional
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

{{% note %}}
Detalles importantes sobre cada herramienta:

FTK Imager:
- Herramienta gratuita de AccessData
- Permite crear imágenes forenses de discos
- Puede montar imágenes en modo solo lectura
- Soporta múltiples formatos (dd, E01, AFF)
- Excelente para análisis preliminar

EnCase:
- Considerado el estándar de oro en forensia digital
- Usado por agencias gubernamentales y empresas
- Ofrece análisis completo de evidencia
- Incluye generación de reportes detallados
- Costoso pero muy completo

Autopsy:
- Interfaz gráfica gratuita para The Sleuth Kit
- Ideal para análisis de sistemas de archivos
- Soporta múltiples tipos de análisis
- Buena opción para principiantes
- Activamente mantenido por la comunidad

Recuva:
- Especializado en recuperación de archivos
- Interfaz simple y fácil de usar
- Bueno para recuperaciones básicas
- Gratuito pero con limitaciones

Volatility:
- Estándar para análisis de memoria RAM
- Potente framework con múltiples plugins
- Requiere conocimiento técnico avanzado
- Excelente para análisis de malware

Wireshark:
- Líder en análisis de tráfico de red
- Soporta cientos de protocolos
- Potentes capacidades de filtrado
- Esencial para investigaciones de red

IDA Pro:
- Desensamblador y debugger profesional
- Usado para ingeniería inversa
- Crucial en análisis de malware
- Tiene una curva de aprendizaje pronunciada
{{% /note %}}

---

### Herramientas en Linux 

- DD (Data Duplicator)
- The Sleuth Kit (TSK)
- PhotoRec
- TestDisk
- tcpdump
- Nmap
- SANS SIFT Workstation (Linux distribution with pre-installed forensic tools)

{{% note %}}
Información detallada de cada herramienta Linux:

DD (Data Duplicator):
- Herramienta fundamental de Unix/Linux
- Permite copias bit a bit de dispositivos
- Opciones avanzadas para manejo de errores
- Versiones forenses mejoradas como dc3dd
- Crucial entender sus parámetros básicos

The Sleuth Kit (TSK):
- Suite completa de herramientas forenses
- Análisis profundo de sistemas de archivos
- Base de muchas herramientas gráficas
- Soporta múltiples sistemas de archivos
- Permite automatización via scripts

PhotoRec:
- Recuperación basada en firmas de archivo
- Funciona incluso con sistemas dañados
- Ideal para recuperar fotos y documentos
- No requiere sistema de archivos intacto
- Companion de TestDisk

TestDisk:
- Especializado en recuperación de particiones
- Puede reparar tablas de particiones
- Recupera sistemas de archivos dañados
- Herramienta de diagnóstico potente
- Complementa a PhotoRec

tcpdump:
- Analizador de paquetes en línea de comandos
- Ligero y eficiente
- Ideal para servidores sin GUI
- Potentes capacidades de filtrado
- Se integra bien con scripts

Nmap:
- Escáner de redes profesional
- Detecta servicios y vulnerabilidades
- Esencial para auditorías de seguridad
- Múltiples scripts NSE disponibles
- Versión gráfica: Zenmap

SANS SIFT Workstation:
- Distribución forense completa
- Incluye cientos de herramientas
- Actualizada regularmente
- Ideal para respuesta a incidentes
- Basada en Ubuntu
{{% /note %}}

---  

### Tipos de Herramientas Forenses
1. Adquisición de datos
2. Análisis de sistemas de archivos
3. Recuperación de datos
4. Análisis de red
5. Análisis de malware

{{% note %}}
Profundización en cada categoría:

1. Adquisición de datos:
   - Objetivo: Crear copias forenses exactas
   - Principios:
     * Integridad de datos
     * No modificación de originales
     * Documentación completa
   - Herramientas principales:
     * DD y variantes
     * FTK Imager
     * EnCase
   - Consideraciones:
     * Uso de bloqueadores de escritura
     * Verificación con hashes
     * Cadena de custodia

2. Análisis de sistemas de archivos:
   - Objetivos:
     * Examinar estructura de archivos
     * Identificar archivos relevantes
     * Analizar metadatos
   - Herramientas clave:
     * TSK
     * Autopsy
     * X-Ways Forensics
   - Aspectos importantes:
     * Líneas temporales
     * Permisos y propietarios
     * Archivos borrados

3. Recuperación de datos:
   - Métodos:
     * Recuperación de archivos borrados
     * Carving de archivos
     * Reconstrucción de fragmentos
   - Herramientas:
     * PhotoRec
     * TestDisk
     * Recuva
   - Consideraciones:
     * Estado del sistema de archivos
     * Fragmentación
     * Sobrescritura

4. Análisis de red:
   - Objetivos:
     * Captura de tráfico
     * Análisis de protocolos
     * Detección de anomalías
   - Herramientas:
     * Wireshark
     * tcpdump
     * NetworkMiner
   - Aspectos clave:
     * Filtrado de tráfico
     * Reconstrucción de sesiones
     * Análisis de malware en red

5. Análisis de malware:
   - Enfoques:
     * Análisis estático
     * Análisis dinámico
     * Análisis de memoria
   - Herramientas:
     * Volatility
     * IDA Pro
     * REMnux
   - Consideraciones:
     * Entorno seguro
     * Técnicas anti-análisis
     * Documentación de comportamiento

Cada categoría requiere conocimientos específicos y metodologías apropiadas. Es importante entender que las categorías no son mutuamente excluyivas y muchas investigaciones requieren el uso de múltiples tipos de herramientas.
{{% /note %}}

---

### 1. Herramientas de Adquisición de Datos
- **DD (Data Duplicator)**
- FTK Imager
- EnCase

{{% note %}}
Profundización en herramientas de adquisición:

DD (Data Duplicator):
- Fundamentos técnicos:
  * Copia bit a bit (sector por sector)
  * No omite sectores dañados por defecto
  * Puede trabajar con dispositivos raw
  * Soporta compresión y cifrado
  * Capacidad de manejo de errores

- Ventajas:
  * Gratuito y de código abierto
  * Muy flexible y potente
  * Estándar en la industria
  * Funciona en casi cualquier sistema Unix
  * Puede ser automatizado

- Limitaciones:
  * Interfaz de línea de comandos
  * No tiene verificación integrada
  * Puede ser peligroso si se usa incorrectamente
  * No tiene soporte para formatos forenses avanzados

FTK Imager:
- Características principales:
  * Interfaz gráfica intuitiva
  * Soporte para múltiples formatos
  * Verificación integrada
  * Previsualización de contenido
  * Exportación selectiva

EnCase:
- Capacidades avanzadas:
  * Adquisición remota
  * Verificación automatizada
  * Compresión en tiempo real
  * Soporte para hardware especializado
  * Generación de reportes detallados

Consideraciones importantes:
1. Siempre usar bloqueadores de escritura
2. Documentar el proceso completo
3. Calcular y verificar hashes
4. Mantener la cadena de custodia
5. Considerar el tamaño y tiempo de adquisición
{{% /note %}}

---

### DD (Data Duplicator)
- Comando básico de Unix para copiar y convertir datos
- Uso forense: crear imágenes bit a bit de discos

```bash
dd if=/dev/sda of=/media/evidence.dd bs=4M
```

{{% note %}}
Guía detallada de DD:

1. Parámetros fundamentales:
   - if (input file):
     * Dispositivo o archivo de origen
     * Puede ser dispositivo físico (/dev/sda)
     * Puede ser archivo normal
     * Debe tener permisos de lectura

   - of (output file):
     * Archivo o dispositivo de destino
     * Requiere espacio suficiente
     * Necesita permisos de escritura
     * Cuidado: se sobrescribirá si existe

   - bs (block size):
     * Tamaño del bloque de lectura/escritura
     * Afecta el rendimiento
     * Valores comunes: 512, 4K, 4M
     * Debe ajustarse según el sistema

2. Opciones avanzadas:
   - conv=noerror: Continúa en caso de errores
   - conv=sync: Rellena bloques con errores
   - status=progress: Muestra progreso
   - count=X: Limita número de bloques
   - skip=X: Salta bloques al inicio
   - seek=X: Salta bloques en destino

3. Mejores prácticas:
   - Siempre verificar dispositivo origen
   - Usar bloqueador de escritura
   - Documentar comando exacto usado
   - Calcular hash antes y después
   - Considerar usar dcfldd o dc3dd

4. Consejos de rendimiento:
   - Ajustar bs según el hardware
   - Evitar sistemas de archivos montados
   - Considerar la velocidad del medio
   - Monitorear uso de recursos

5. Manejo de errores:
   - Documentar cualquier error
   - Usar opciones noerror y sync
   - Considerar múltiples pasadas
   - Verificar integridad final

6. Documentación necesaria:
   - Comando exacto utilizado
   - Tiempo inicio/fin
   - Errores encontrados
   - Hashes generados
   - Tamaño total copiado
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
Guía paso a paso del ejercicio:

1. Preparación:
   a) Identificación del dispositivo:
      - Usar 'lsblk' o 'fdisk -l'
      - Verificar dos veces el dispositivo
      - Asegurar que no está montado
      - Documentar características

   b) Preparación del entorno:
      - Verificar espacio disponible
      - Preparar bloqueador de escritura
      - Tener herramientas necesarias
      - Documentar sistema usado

2. Proceso de imagen:
   a) Comando DD:
      - Explicación de parámetros
      - Consideraciones de rendimiento
      - Monitoreo del proceso
      - Manejo de errores

   b) Verificación:
      - Importancia del hash MD5
      - Proceso de verificación
      - Documentación de resultados
      - Alternativas (SHA-1, SHA-256)

3. Documentación:
   - Registro de comandos usados
   - Tiempo inicio/fin
   - Hashes generados
   - Errores encontrados
   - Tamaño final
   - Notas adicionales

4. Consideraciones adicionales:
   - Uso de dcfldd/dc3dd
   - Compresión en tiempo real
   - Splits de archivos grandes
   - Backups de seguridad
   - Verificación periódica

5. Problemas comunes:
   - Errores de lectura
   - Espacio insuficiente
   - Permisos incorrectos
   - Dispositivo ocupado
   - Fallos de verificación

6. Buenas prácticas:
   - Siempre usar write-blocker
   - Verificar antes de desmontar
   - Mantener logs detallados
   - Hacer copias de seguridad
   - Documentar todo el proceso
{{% /note %}}

---

### Un fork de dd: dc3dd

1. Crea una imagen de una unidad USB
2. Viene con las pilas incluidas

```bash
# Crear imagen
sudo dc3dd if=/dev/sda hofs=./ImagenPenDrive.000 ofsz=800MB hash=md5 hash=sha256 verb=on log=./imagependrive.log
```

{{% note %}}
DC3DD - Herramienta Avanzada de Adquisición:

1. Características específicas de dc3dd:
   - Cálculo de hash incorporado:
     * Soporta múltiples algoritmos simultáneos
     * Verificación en tiempo real
     * Mayor confiabilidad que dd básico
   
   - Logging mejorado:
     * Registro detallado de operaciones
     * Tracking de errores
     * Estadísticas de transferencia
     * Documentación automática

   - Manejo de errores:
     * Mejor gestión de sectores defectuosos
     * Opciones de recuperación
     * Reportes detallados de problemas

2. Ventajas sobre dd estándar:
   - Verificación integrada
   - Mejor documentación
   - Más opciones forenses
   - Interface más amigable
   - Mejor manejo de errores

3. Parámetros importantes:
   - hofs: Hash output filesize
   - ofsz: Output filesize
   - verb: Modo verboso
   - log: Archivo de registro
   - hash: Algoritmos de hash

4. Consideraciones prácticas:
   - Velocidad vs precisión
   - Recursos del sistema
   - Espacio en disco
   - Tiempo de procesamiento
   - Verificación de resultados

5. Uso en casos reales:
   - Documentación necesaria
   - Cadena de custodia
   - Verificación de integridad
   - Preparación de informes
   - Presentación de evidencia
{{% /note %}}

---

### 2. Análisis de Sistemas de Archivos
- **The Sleuth Kit (TSK)**
- Autopsy (interfaz gráfica para TSK)

{{% note %}}
Análisis Profundo de Sistemas de Archivos:

1. The Sleuth Kit (TSK):
   a) Componentes principales:
      - File System Layer:
        * fsstat: Análisis de sistema de archivos
        * fls: Listado de archivos y directorios
        * icat: Extracción de contenido
        * istat: Análisis de metadatos
      
      - Volume System Layer:
        * mmls: Análisis de particiones
        * mmstat: Información de volumen
        * mmcat: Extracción de volumen
      
      - Data Analysis Layer:
        * sorter: Clasificación de archivos
        * mactime: Análisis temporal
        * tsk_recover: Recuperación de datos

   b) Capacidades clave:
      - Análisis de múltiples sistemas de archivos:
        * FAT/exFAT
        * NTFS
        * ext2/3/4
        * HFS+
        * APFS
      - Recuperación de archivos borrados
      - Análisis de metadatos
      - Timeline forense
      - Extracción selectiva

2. Autopsy:
   a) Características principales:
      - Interface gráfica intuitiva
      - Análisis multi-usuario
      - Línea temporal visual
      - Búsqueda avanzada
      - Plugins extensibles

   b) Módulos importantes:
      - Recent Activity
      - Hash Analysis
      - File Type Analysis
      - Keyword Search
      - Web Artifacts

3. Metodología de análisis:
   - Identificación de sistema de archivos
   - Análisis de estructura
   - Búsqueda de evidencia
   - Recuperación de datos
   - Documentación de hallazgos

4. Mejores prácticas:
   - Trabajo con copias forenses
   - Documentación detallada
   - Validación de resultados
   - Preservación de metadatos
   - Manejo de evidencia digital
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
Guía Detallada de TSK:

1. Comando mmls:
   - Propósito:
     * Analizar estructura de particiones
     * Identificar sistemas de archivos
     * Determinar offsets
   - Interpretación de salida:
     * Tipos de particiones
     * Tamaños y ubicaciones
     * Sistemas de archivos
   - Uso práctico:
     * Identificación de evidencia
     * Planificación de análisis
     * Documentación de estructura

2. Comando fsstat:
   - Análisis de sistema de archivos:
     * Tipo y versión
     * Tamaño de cluster
     * Metadatos del sistema
     * Estado del sistema
   - Información importante:
     * Últimos montajes
     * Errores del sistema
     * Configuración
     * Estado de journaling

3. Comando fls:
   - Funcionalidades:
     * Listar contenido
     * Mostrar archivos borrados
     * Analizar metadatos
     * Examinar permisos
   - Opciones útiles:
     * -r: Recursivo
     * -l: Formato largo
     * -d: Solo directorios
     * -p: Mostrar paths completos

4. Consideraciones generales:
   - Offset de particiones:
     * Cálculo correcto
     * Verificación
     * Documentación
   - Manejo de evidencia:
     * Integridad
     * Documentación
     * Cadena de custodia
   - Análisis sistemático:
     * Metodología
     * Documentación
     * Verificación

5. Mejores prácticas:
   - Verificación de resultados
   - Documentación detallada
   - Manejo de errores
   - Backup de datos importantes
   - Validación cruzada
{{% /note %}}

---

### Ejercicio: Análisis con TSK
Usando la imagen creada anteriormente:

1. Identifica las particiones
2. Examina el sistema de archivos
3. Lista los archivos en el directorio raíz

{{% note %}}
Guía Paso a Paso del Ejercicio:

1. Identificación de Particiones:
   a) Uso de mmls:
      ```bash
      mmls imagen.dd
      ```
      - Interpretar tabla de particiones
      - Identificar sistemas de archivos
      - Documentar offsets
      - Notar particiones ocultas
   
   b) Análisis de resultados:
      - Tipos de particiones
      - Tamaños
      - Alineamiento
      - Espacios no asignados

2. Examen del Sistema de Archivos:
   a) Uso de fsstat:
      ```bash
      fsstat -o [offset] imagen.dd
      ```
      - Analizar metadata
      - Verificar estado
      - Examinar configuración
      - Documentar hallazgos

   b) Información relevante:
      - Tipo de sistema de archivos
      - Estado de journaling
      - Últimos montajes
      - Errores o corrupciones

3. Listado de Archivos:
   a) Uso de fls:
      ```bash
      fls -o [offset] imagen.dd
      ```
      - Examinar estructura
      - Identificar archivos clave
      - Notar archivos borrados
      - Analizar timestamps

   b) Análisis detallado:
      - Permisos
      - Propietarios
      - Tamaños
      - Fechas de modificación

4. Documentación:
   - Comandos utilizados
   - Resultados obtenidos
   - Hallazgos importantes
   - Anomalías detectadas
   - Próximos pasos

5. Consideraciones Adicionales:
   - Integridad de datos
   - Validación de resultados
   - Documentación forense
   - Cadena de custodia
   - Reporte de hallazgos
{{% /note %}}

---

### Práctica
[Descargar](https://drive.google.com/file/d/1YW_XdZnyMcOsEA-zlBGqWtargGxv-dRJ/view?usp=drive_link) una imagen

1. Identifica las particiones
2. Examina el sistema de archivos
3. Lista los archivos en el directorio raíz

{{% note %}}
Guía Detallada para la Práctica:

1. Preparación del Entorno:
   a) Verificación de herramientas:
      - TSK instalado correctamente
      - Permisos adecuados
      - Espacio disponible
      - Terminal con acceso root

   b) Manejo de la imagen:
      - Verificación de integridad
      - Cálculo de hash
      - Documentación inicial
      - Respaldo de seguridad

2. Análisis de Particiones:
   a) Uso de mmls:
      ```bash
      mmls imagen_descargada.dd
      ```
      - Documentar estructura
      - Identificar sistemas
      - Calcular offsets
      - Notar anomalías

   b) Análisis detallado:
      - Tipos de particiones
      - Esquema de particionado
      - Espacios no asignados
      - Particiones ocultas

3. Análisis del Sistema de Archivos:
   a) Comandos principales:
      ```bash
      fsstat -o [offset] imagen_descargada.dd
      ```
      - Tipo de sistema
      - Estado general
      - Configuración
      - Metadata importante

   b) Puntos de interés:
      - Journaling
      - Errores
      - Fechas importantes
      - Características especiales

4. Exploración de Contenido:
   a) Listado de archivos:
      ```bash
      fls -o [offset] imagen_descargada.dd
      ```
      - Estructura de directorios
      - Archivos clave
      - Archivos borrados
      - Permisos y propietarios

   b) Análisis profundo:
      - Timeline
      - Metadatos
      - Contenido sospechoso
      - Patrones anormales

{{% /note %}}

---

### 3. Recuperación de Datos
- **PhotoRec**
- Recuva
- TestDisk

{{% note %}}
Fundamentos de Recuperación de Datos:

1. PhotoRec:
   a) Características principales:
      - Recuperación basada en firmas
      - Independiente del sistema de archivos
      - Soporte multiplataforma
      - Recuperación profunda
      - Interface de texto

   b) Capacidades:
      - Más de 480 formatos de archivo
      - Recuperación después de formateo
      - Manejo de sistemas dañados
      - Búsqueda sector por sector
      - Análisis de espacios no asignados

2. Recuva:
   a) Ventajas:
      - Interface gráfica intuitiva
      - Vista previa de archivos
      - Escaneo profundo
      - Múltiples sistemas de archivos
      - Fácil de usar

   b) Limitaciones:
      - Solo para Windows
      - Menos potente que PhotoRec
      - No tan eficaz en sistemas dañados
      - Limitaciones en sistemas ext

3. TestDisk:
   a) Funcionalidades:
      - Recuperación de particiones
      - Reparación de boot sectors
      - Fix MBR/GPT
      - Recuperación de archivos
      - Análisis de superficie

   b) Casos de uso:
      - Particiones borradas
      - Tabla de particiones corrupta
      - Sectores de arranque dañados
      - Recuperación de RAID
      - Sistemas no bootables
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
Guía Detallada de PhotoRec:

1. Fundamentos Técnicos:
   a) Funcionamiento:
      - Búsqueda de firmas de archivo
      - Análisis sector por sector
      - Recuperación carving
      - Reconstrucción de archivos
      - Validación de contenido

   b) Sistemas soportados:
      - FAT/NTFS
      - ext2/3/4
      - HFS+
      - ReiserFS
      - Muchos más

2. Proceso de Recuperación:
   a) Preparación:
      - Identificar dispositivo/imagen
      - Verificar espacio disponible
      - Seleccionar destino
      - Configurar opciones

   b) Ejecución:
      - Selección de partición
      - Elección de sistema de archivos
      - Configuración de búsqueda
      - Monitoreo de progreso

{{% /note %}}

---

### Ejercicio con PhotoRec 

[Descargar](https://drive.google.com/file/d/1aQhDp7BZtxCb41AchFmjrZ9aplykzCh4/view?usp=sharing) una imagen y analizarla con PhotoRec

- ¿Hay archivos visibles en la imagen?
- ¿Hay archivos borrados?
- ¿Qué archivos hay?

{{% note %}}
Guía Práctica de Análisis con PhotoRec:

1. Preparación del Análisis:
   a) Verificación inicial:
      - Descarga completa de la imagen
      - Cálculo de hash para verificar integridad
      - Preparación del espacio de trabajo
      - Documentación inicial

   b) Herramientas necesarias:
      - PhotoRec instalado
      - Espacio suficiente para recuperación
      - Permisos adecuados
      - Terminal o consola

2. Proceso de Análisis:
   a) Análisis preliminar:
      ```bash
      # Examinar estructura de la imagen
      mmls imagen_descargada.dd
      # Verificar sistema de archivos
      fsstat -o [offset] imagen_descargada.dd
      ```

   b) Ejecución de PhotoRec:
      ```bash
      # Iniciar recuperación
      sudo photorec /d /ruta/recuperacion imagen_descargada.dd
      ```

{{% /note %}}

---

### Caso de Estudio: Recuperación de Evidencia Borrada
Escenario: Un sospechoso borró fotos incriminatorias de su tarjeta SD.

1. Crear imagen de la tarjeta SD con `dd`
2. Usar `PhotoRec` para recuperar archivos borrados
3. Analizar los metadatos de las imágenes recuperadas

{{% note %}}
Análisis Detallado del Caso de Estudio:

1. Fase de Adquisición:
   a) Creación de imagen:
      ```bash
      dd if=/dev/sdc of=sd_card.img bs=4M conv=noerror,sync
      ```
      - Uso de bloqueador de escritura
      - Documentación del proceso
      - Verificación de integridad
      - Cálculo de hashes

   b) Preparación del entorno:
      - Espacio de trabajo limpio
      - Herramientas necesarias
      - Documentación inicial
      - Cadena de custodia

2. Proceso de Recuperación:
   a) Análisis con PhotoRec:
      ```bash
      photorec /d /ruta/recuperacion sd_card.img
      ```
      - Configuración de búsqueda
      - Selección de tipos de archivo
      - Monitoreo del proceso
      - Documentación de resultados

   b) Verificación de resultados:
      - Integridad de archivos
      - Clasificación por tipo
      - Identificación de fragmentos
      - Análisis de corrupción

3. Análisis de Metadatos:
   a) Uso de ExifTool:
      ```bash
      exiftool -r directorio_recuperacion
      ```
      - Datos EXIF
      - Información GPS
      - Timestamps
      - Datos de cámara

   b) Análisis temporal:
      - Creación de timeline
      - Patrones de actividad
      - Correlación de eventos
      - Anomalías temporales

4. Documentación Forense:
   - Proceso completo
   - Herramientas utilizadas
   - Hallazgos significativos
   - Cadena de custodia
   - Integridad de evidencia

5. Consideraciones Legales:
   - Autorización legal
   - Alcance permitido
   - Privacidad
   - Admisibilidad
   - Documentación legal

6. Mejores Prácticas:
   - Metodología sistemática
   - Documentación detallada
   - Verificación cruzada
   - Preservación de evidencia
   - Reportes técnicos
{{% /note %}}

---

### 4. Análisis de Red
- **Wireshark**
- tcpdump
- Nmap

{{% note %}}
Fundamentos del Análisis de Red:

1. Wireshark:
   a) Características principales:
      - Análisis de protocolos
      - Captura en tiempo real
      - Disección de paquetes
      - Filtros avanzados
      - Análisis estadístico

   b) Capacidades forenses:
      - Reconstrucción de sesiones
      - Análisis de malware
      - Detección de anomalías
      - Extracción de archivos
      - Timeline de red

2. tcpdump:
   a) Funcionalidades:
      - Captura desde CLI
      - Filtros BPF
      - Análisis en tiempo real
      - Formato pcap
      - Bajo consumo de recursos

   b) Casos de uso:
      - Monitoreo remoto
      - Análisis de tráfico
      - Debugging de red
      - Forensia de red
      - Detección de intrusiones

3. Nmap:
   a) Capacidades:
      - Descubrimiento de hosts
      - Escaneo de puertos
      - Detección de servicios
      - Scripts NSE
      - Evasión de firewalls

   b) Uso forense:
      - Mapeo de red
      - Identificación de servicios
      - Detección de vulnerabilidades
      - Auditoría de seguridad
      - Documentación de red

4. Metodología de Análisis:
   - Captura de tráfico
   - Filtrado de datos
   - Análisis de protocolos
   - Identificación de patrones
   - Documentación de hallazgos

5. Consideraciones Legales:
   - Autorización
   - Privacidad
   - Alcance permitido
   - Jurisdicción
   - Evidencia admisible

6. Mejores Prácticas:
   - Planificación
   - Documentación
   - Calibración de herramientas
   - Validación de resultados
   - Reportes técnicos
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
Guía Detallada de Wireshark:

1. Interfaz y Componentes:
   a) Paneles principales:
      - Panel de paquetes
      - Panel de detalles
      - Panel de bytes
      - Barra de filtros
      - Estadísticas

   b) Herramientas importantes:
      - Captura de interfaces
      - Análisis de protocolos
      - Estadísticas
      - Gráficos
      - Expert Info

2. Filtros Avanzados:
   a) Filtros de captura:
      ```
      host 192.168.1.1
      port 80
      tcp
      !broadcast
      ```

   b) Filtros de visualización:
      ```
      ip.addr == 10.0.0.1
      tcp.port == 443
      http.request.method == "GET"
      frame.time >= "2024-01-01"
      ```

3. Análisis de Protocolos:
   a) Protocolos comunes:
      - TCP/IP
      - HTTP/HTTPS
      - DNS
      - SMB
      - FTP

   b) Características avanzadas:
      - Seguimiento de streams
      - Decodificación de protocolos
      - Análisis de SSL/TLS
      - Extracción de archivos
      - Análisis de malware

4. Técnicas Forenses:
   - Reconstrucción de sesiones
   - Análisis temporal
   - Detección de anomalías
   - Extracción de evidencia
   - Correlación de eventos

5. Consideraciones de Rendimiento:
   - Tamaño de buffer
   - Filtros de captura
   - Recursos del sistema
   - Almacenamiento
   - Rotación de archivos

6. Mejores Prácticas:
   - Documentación detallada
   - Gestión de capturas grandes
   - Seguridad en análisis
   - Verificación de resultados
   - Reportes técnicos
{{% /note %}}

---

### Ejercicio: Análisis de Tráfico con Wireshark
1. Capturar tráfico durante 5 minutos
2. Identificar protocolos utilizados
3. Buscar posibles transferencias de archivos

{{% note %}}
Guía Paso a Paso del Ejercicio:

1. Preparación:
   a) Configuración inicial:
      - Selección de interfaz
      - Configuración de filtros
      - Verificación de permisos
      - Espacio de almacenamiento

   b) Consideraciones previas:
      - Tráfico esperado
      - Protocolos relevantes
      - Objetivos específicos
      - Limitaciones técnicas

2. Captura de Tráfico:
   a) Inicio de captura:
      ```
      # Configurar filtros básicos
      not broadcast and not multicast
      ```

   b) Durante la captura:
      - Monitoreo de paquetes
      - Identificación de patrones
      - Marcado de paquetes importantes
      - Notas de observación

3. Análisis de Protocolos:
   a) Estadísticas:
      - Protocols Hierarchy
      - Conversations
      - Endpoints
      - I/O Graphs

   b) Análisis específico:
      - HTTP/HTTPS
      - DNS queries
      - Conexiones TCP
      - Transferencias de archivos

4. Búsqueda de Transferencias:
   a) Filtros útiles:
      ```
      ftp-data
      http.request.method == "POST"
      http.content_type contains "application"
      smb
      ```

   b) Análisis de contenido:
      - File transfer protocols
      - Content-Type headers
      - File signatures
      - Stream size

5. Documentación:
   - Protocolos identificados
   - Estadísticas relevantes
   - Transferencias detectadas
   - Anomalías encontradas
   - Timeline de eventos

6. Reporte:
   - Metodología
   - Hallazgos
   - Evidencia relevante
   - Recomendaciones
   - Conclusiones
{{% /note %}}

---

### 5. Análisis de Malware
- **Volatility**
- IDA Pro
- Ghidra

{{% note %}}
Fundamentos del Análisis de Malware:

1. Volatility:
   a) Características principales:
      - Análisis de memoria RAM
      - Múltiples sistemas operativos
      - Framework extensible
      - Plugins especializados
      - Análisis forense

   b) Capacidades clave:
      - Procesos y DLLs
      - Conexiones de red
      - Registros y drivers
      - Inyección de código
      - Rootkits

2. IDA Pro:
   a) Funcionalidades:
      - Desensamblado avanzado
      - Decompilación
      - Debugging
      - Scripting
      - Análisis de binarios

   b) Características forenses:
      - Análisis estático
      - Identificación de patrones
      - Signatures
      - Análisis de código
      - Documentación

3. Ghidra:
   a) Ventajas:
      - Código abierto
      - Multi-plataforma
      - Extensible
      - Colaborativo
      - Gratuito

   b) Herramientas:
      - Decompilador
      - Análisis de código
      - Scripting
      - Versionado
      - Plugins

4. Metodología de Análisis:
   - Ambiente seguro
   - Análisis estático
   - Análisis dinámico
   - Documentación
   - Reporte

5. Seguridad:
   - Sandbox
   - Aislamiento de red
   - Snapshots
   - Backups
   - Protección del host

6. Técnicas Avanzadas:
   - Unpacking
   - Debugging
   - Análisis de red
   - Ingeniería inversa
   - Análisis de comportamiento
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
Guía Completa de Volatility:

1. Conceptos Fundamentales:
   a) Análisis de memoria:
      - Memoria volátil vs persistente
      - Estructuras de memoria
      - Artefactos forenses
      - Estados del sistema
      - Evidencia volátil

   b) Perfiles de sistema:
      - Identificación correcta
      - Compatibilidad
      - Estructura de memoria
      - Versiones de SO
      - Arquitecturas

2. Comandos Esenciales:
   a) Información básica:
      ```bash
      # Identificar perfil
      volatility -f memory.dump imageinfo
      
      # Procesos activos
      volatility -f memory.dump --profile=Win10x64 pslist
      
      # Árbol de procesos
      volatility -f memory.dump --profile=Win10x64 pstree
      ```

   b) Análisis de red:
      ```bash
      # Conexiones activas
      volatility -f memory.dump --profile=Win10x64 netscan
      
      # Sockets abiertos
      volatility -f memory.dump --profile=Win10x64 sockets
      ```

3. Plugins Avanzados:
   a) Detección de malware:
      - malfind: código inyectado
      - ldrmodules: DLLs ocultas
      - hollowfind: process hollowing
      - handles: recursos abiertos
      - dlllist: módulos cargados

   b) Análisis de sistema:
      - hivelist: registro de Windows
      - filescan: archivos en memoria
      - cmdscan: comandos ejecutados
      - envars: variables de entorno
      - svcscan: servicios del sistema

4. Técnicas de Análisis:
   - Identificación de anomalías
   - Correlación de evidencia
   - Timeline de eventos
   - Extracción de artefactos
   - Documentación forense

5. Mejores Prácticas:
   - Verificación de integridad
   - Documentación detallada
   - Cadena de custodia
   - Validación de resultados
   - Reportes técnicos

6. Consideraciones Forenses:
   - Volatilidad de datos
   - Orden de volatilidad
   - Tiempo de respuesta
   - Preservación de evidencia
   - Admisibilidad legal
{{% /note %}}

---

### Caso de Estudio: Análisis de Malware en Memoria
Escenario: Se sospecha que un sistema está infectado con un keylogger.

1. Adquirir un volcado de memoria con `winpmem`
2. Usar Volatility para analizar procesos y conexiones
3. Buscar indicadores de compromiso (IoCs)

{{% note %}}
Análisis Detallado del Caso:

1. Adquisición de Memoria:
   a) Preparación:
      - Herramientas necesarias:
        * winpmem
        * Medio de almacenamiento
        * Software de hash
        * Documentación
      
      - Consideraciones:
        * Minimizar impacto
        * Velocidad de captura
        * Integridad de datos
        * Espacio disponible

   b) Proceso de captura:
      ```powershell
      # Captura de memoria
      winpmem_x64.exe -o memoria.raw
      
      # Verificación de integridad
      Get-FileHash memoria.raw -Algorithm SHA256
      ```

2. Análisis con Volatility:
   a) Análisis inicial:
      ```bash
      # Identificar perfil
      volatility -f memoria.raw imageinfo
      
      # Listar procesos
      volatility -f memoria.raw --profile=Win10x64 pslist
      
      # Árbol de procesos
      volatility -f memoria.raw --profile=Win10x64 pstree
      ```

   b) Análisis profundo:
      ```bash
      # Buscar código inyectado
      volatility -f memoria.raw --profile=Win10x64 malfind
      
      # Analizar DLLs
      volatility -f memoria.raw --profile=Win10x64 dlllist
      
      # Examinar conexiones
      volatility -f memoria.raw --profile=Win10x64 netscan
      ```

3. Búsqueda de IoCs:
   a) Indicadores comunes:
      - Procesos sospechosos
      - DLLs no estándar
      - Conexiones inusuales
      - Inyección de código
      - Hooks de teclado

   b) Análisis específico:
      - Patrones de keylogger
      - Comportamiento de red
      - Persistencia
      - Técnicas de evasión
      - Artefactos forenses

4. Documentación:
   - Metodología utilizada
   - Herramientas empleadas
   - Hallazgos significativos
   - Timeline de eventos
   - Evidencia recolectada

5. Recomendaciones:
   - Acciones inmediatas
   - Mitigación
   - Prevención
   - Monitoreo
   - Respuesta a incidentes

6. Consideraciones Legales:
   - Admisibilidad
   - Cadena de custodia
   - Privacidad
   - Cumplimiento
   - Documentación legal
{{% /note %}}

---

### Recursos Adicionales
- SANS Digital Forensics and Incident Response Blog
- Digital Forensics Magazine
- Forensic Focus Forums

{{% note %}}
Guía de Recursos de Aprendizaje:

1. SANS DFIR Blog:
   a) Contenido principal:
      - Artículos técnicos
      - Casos de estudio
      - Herramientas nuevas
      - Mejores prácticas
      - Investigaciones recientes

   b) Recursos disponibles:
      - Whitepapers
      - Webinars
      - Podcasts
      - Herramientas
      - Cheat sheets

2. Digital Forensics Magazine:
   a) Áreas de cobertura:
      - Técnicas avanzadas
      - Nuevas herramientas
      - Tendencias del campo
      - Casos prácticos
      - Investigaciones reales

   b) Contenido especializado:
      - Análisis profundos
      - Tutoriales técnicos
      - Entrevistas expertas
      - Revisiones de herramientas
      - Actualizaciones legales

3. Forensic Focus Forums:
   a) Recursos comunitarios:
      - Discusiones técnicas
      - Resolución de problemas
      - Compartir experiencias
      - Networking profesional
      - Ofertas de trabajo

   b) Contenido adicional:
      - Webinars
      - Artículos
      - Entrevistas
      - Noticias
      - Eventos

4. Otros Recursos:
   a) Libros recomendados:
      - "File System Forensic Analysis"
      - "Digital Forensics with Open Source Tools"
      - "Practical Memory Forensics"
      - "Malware Analyst's Cookbook"
      - "Windows Forensic Analysis"

   b) Certificaciones:
      - EnCE
      - GCFE
      - CFCE
      - GCFA
      - CCE

5. Formación Continua:
   - Conferencias importantes
   - Talleres prácticos
   - Cursos online
   - Laboratorios virtuales
   - CTFs forenses

6. Herramientas y Software:
   - Suites forenses
   - Herramientas especializadas
   - Recursos gratuitos
   - Ambientes de prueba
   - Máquinas virtuales
{{% /note %}}

---

### ¿Preguntas?
