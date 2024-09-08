+++
title = "Fundamentos de Computación Forense - Adquisición y Preservación de Evidencia"
outputs = ["Reveal"]
+++

## Adquisición y Preservación de Evidencia
### Fundamentos de Computación Forense

---

### Objetivos de la Clase
1. Comprender los principios de adquisición y preservación de evidencia digital
2. Aprender técnicas y herramientas para la adquisición forense
3. Entender la importancia de la cadena de custodia
4. Practicar con herramientas forenses comunes

{{% note %}}
Esta clase cubrirá los aspectos fundamentales de la adquisición y preservación de evidencia digital, elementos cruciales en cualquier investigación forense. Asegúrese de enfatizar la importancia de estos procesos para mantener la integridad de la evidencia.
{{% /note %}}

---

### ¿Qué es la Evidencia Digital?
- Información almacenada o transmitida en formato digital
- Puede estar en dispositivos de almacenamiento o en tránsito
- Incluye archivos, metadatos, logs, tráfico de red, etc.

{{% note %}}
Explique que la evidencia digital es muy diversa y puede encontrarse en una variedad de fuentes. Mencione ejemplos como correos electrónicos, historiales de navegación, documentos, imágenes, y bases de datos. Enfatice que la evidencia digital es frágil y fácilmente alterable, lo que hace crucial su correcta adquisición y preservación.
{{% /note %}}

---

### Principios de la Adquisición de Evidencia
1. Preservación de la evidencia original
2. Documentación detallada de cada paso
3. Uso de métodos forenses validados
4. Mantenimiento de la cadena de custodia

{{% note %}}
Detalle cada principio:
1. Nunca trabajar directamente sobre la evidencia original para evitar alteraciones.
2. Documentar meticulosamente cada acción para garantizar la reproducibilidad.
3. Utilizar solo herramientas y métodos aceptados por la comunidad forense.
4. Mantener un registro detallado de quién ha tenido acceso a la evidencia y cuándo.
Enfatice que estos principios son cruciales para garantizar la admisibilidad de la evidencia en un tribunal.
{{% /note %}}

---

### Tipos de Adquisición
- Adquisición física (bit-a-bit)
- Adquisición lógica
- Adquisición en vivo (live acquisition)

{{% note %}}
Explique cada tipo:
- Física: copia exacta de todos los sectores del dispositivo, incluyendo espacio no asignado.
- Lógica: copia solo de archivos y directorios visibles.
- En vivo: captura de datos volátiles de un sistema en funcionamiento.
Mencione que la elección del tipo depende de las circunstancias del caso y los recursos disponibles.
{{% /note %}}

---

### Herramientas de Adquisición
- FTK Imager
- EnCase
- Guymager

{{% note %}}
Presente brevemente cada herramienta:
- FTK Imager: herramienta gráfica popular, buena para principiantes.
- EnCase: suite forense completa, ampliamente utilizada en entornos profesionales.
- Guymager: alternativa de código abierto con interfaz gráfica.
Mencione las ventajas y casos de uso típicos de cada herramienta.
{{% /note %}}

---

### Adquisición de Tráfico con tcpdump
- Herramienta de línea de comandos para captura y análisis de paquetes
- Útil para adquisición de evidencia de red en tiempo real

Comando básico:
```bash
sudo tcpdump -i eth0 -w captura.pcap
```
- `-i`: interfaz de red
- `-w`: archivo de salida

{{% note %}}
Explique que tcpdump es una herramienta poderosa para capturar tráfico de red. Destaque su utilidad en investigaciones de seguridad de red y forense. Mencione que la captura de tráfico puede requerir privilegios elevados. Explique cada parte del comando: -i especifica la interfaz, -w el archivo donde se guardará la captura.
{{% /note %}}

---

### Práctica: Captura de Tráfico con tcpdump
1. Inicia la captura:
   ```bash
   sudo tcpdump -i eth0 -w captura.pcap
   ```
2. Genera algo de tráfico (navega por algunos sitios web)
3. Detén la captura (Ctrl+C)
4. Analiza la captura:
   ```bash
   tcpdump -r captura.pcap
   ```

{{% note %}}
Guíe a los estudiantes a través del proceso:
1. Asegúrese de que identifiquen correctamente su interfaz de red.
2. Explique la importancia de generar tráfico relevante para la práctica.
3. Demuestre cómo detener la captura adecuadamente.
4. Muestre cómo leer y analizar básicamente la captura resultante.
Discuta las implicaciones legales y éticas de la captura de tráfico de red.
{{% /note %}}

---

### Ejercicio: Análisis de Tráfico de Red
1. Captura tráfico durante 5 minutos mientras navegas
2. Analiza la captura buscando:
   - Protocolos utilizados
   - IPs más frecuentes
   - Posibles transferencias de archivos
3. Documenta tus hallazgos

{{% note %}}
Supervise a los estudiantes durante el ejercicio. Anímelos a:
1. Ser metódicos en su análisis.
2. Utilizar filtros de tcpdump para aislar tráfico específico.
3. Considerar las implicaciones de seguridad y privacidad de sus hallazgos.
Prepare una discusión sobre los tipos de información que se pueden obtener del análisis de tráfico de red y su relevancia en investigaciones forenses.
{{% /note %}}

---

### Análisis de Memoria con Volatility: Caso Práctico
Escenario: Sospecha de malware en un sistema Windows

Pasos:
1. Adquirir imagen de memoria
2. Identificar procesos sospechosos
3. Analizar conexiones de red
4. Extraer archivos sospechosos

{{% note %}}
Explique que este escenario simula una situación real donde se sospecha la presencia de malware en un sistema Windows. Enfatice la importancia de seguir un proceso sistemático en el análisis de memoria. Mencione que Volatility es especialmente útil para detectar malware que intenta ocultarse en la memoria del sistema.
{{% /note %}}

---

### Paso 1: Adquisición de Memoria en Windows
- Usar herramientas como FTK Imager, DumpIt, o WinPmem
- Ejemplo con WinPmem:
  ```
  winpmem_mini_x64_rc2.exe memoria.raw
  ```

{{% note %}}
Explique que la adquisición de memoria debe realizarse con cuidado para no alterar el estado del sistema. Mencione que en un caso real, la adquisición se haría idealmente antes de cualquier otro análisis. Destaque la importancia de documentar el proceso de adquisición para mantener la cadena de custodia. Aclare que estamos usando herramientas específicas para Windows en este escenario.
{{% /note %}}

---

### Paso 2: Identificar Procesos Sospechosos
Comando Volatility:
```bash
volatility -f memoria.raw --profile=Win10x64_19041 pslist
```

Buscar:
- Nombres de procesos inusuales
- Procesos con rutas de ejecución sospechosas
- Procesos hijos inesperados

{{% note %}}
Explique cómo interpretar la salida de pslist. Enseñe a los estudiantes a identificar anomalías como procesos con nombres similares a procesos del sistema pero ligeramente diferentes, o procesos ejecutándose desde ubicaciones inusuales. Mencione que el malware a menudo intenta camuflarse como procesos legítimos.
{{% /note %}}

---

### Paso 3: Analizar Conexiones de Red
Comando Volatility:
```bash
volatility -f memoria.raw --profile=Win10x64_19041 netscan
```

Buscar:
- Conexiones a IPs sospechosas
- Puertos inusuales en uso
- Procesos no esperados con conexiones de red

{{% note %}}
Demuestre cómo netscan puede revelar conexiones de red ocultas que no serían visibles en el sistema en funcionamiento. Explique cómo correlacionar esta información con los procesos identificados anteriormente. Discuta cómo las conexiones de red pueden indicar comunicación con servidores de comando y control en casos de malware.
{{% /note %}}

---

### Paso 4: Extraer Archivos Sospechosos
Comando Volatility:
```bash
volatility -f memoria.raw --profile=Win10x64_19041 dumpfiles -Q 0x000000007e410890 -D ./extracted/
```
- `-Q`: dirección física del archivo
- `-D`: directorio de salida

{{% note %}}
Explique cómo usar filescan para encontrar archivos de interés y luego extraerlos con dumpfiles. Demuestre cómo obtener la dirección física de un archivo sospechoso. Mencione la importancia de preservar estos archivos extraídos como evidencia potencial.
{{% /note %}}

---

### Ejercicio: Análisis de Memoria con Volatility
1. Usa la imagen de memoria proporcionada
2. Identifica al menos un proceso sospechoso
3. Analiza sus conexiones de red
4. Intenta extraer un archivo asociado
5. Documenta todo el proceso y tus hallazgos

{{% note %}}
Guíe a los estudiantes a través del ejercicio, asegurándose de que:
1. Utilicen correctamente los comandos de Volatility.
2. Apliquen pensamiento crítico para identificar anomalías.
3. Correlacionen información entre diferentes outputs de Volatility.
4. Mantengan una documentación clara de sus acciones y hallazgos.
Prepare una discusión sobre los desafíos del análisis de memoria y cómo interpretar los resultados en el contexto de una investigación real.
{{% /note %}}

---

### Preservación de Evidencia
- Uso de bloqueadores de escritura
- Almacenamiento seguro
- Documentación detallada
- Hashing para verificar integridad

{{% note %}}
Explique cada aspecto de la preservación:
- Bloqueadores de escritura: previenen modificaciones accidentales durante la adquisición.
- Almacenamiento seguro: protege la evidencia de daños físicos y acceso no autorizado.
- Documentación: registra cada acción realizada con la evidencia.
- Hashing: permite verificar que la evidencia no ha sido alterada.
Enfatice que la preservación es crucial para mantener la admisibilidad de la evidencia.
{{% /note %}}

---

### Cadena de Custodia
- Registro detallado de la manipulación de evidencia
- Incluye:
  - Quién manipuló la evidencia
  - Cuándo fue manipulada
  - Qué se hizo con ella
  - Dónde se almacenó

{{% note %}}
Explique la importancia de la cadena de custodia para demostrar que la evidencia no ha sido alterada o contaminada. Mencione que una cadena de custodia rota puede hacer que la evidencia sea inadmisible en un tribunal. Proporcione ejemplos de formularios de cadena de custodia y cómo deben ser llenados correctamente.
{{% /note %}}

---

### FTK Imager y Cadena de Custodia
- FTK Imager facilita la documentación de la cadena de custodia
- Campos integrados para registrar metadata forense
- Formatos de imagen que incluyen metadata de cadena de custodia

{{% note %}}
Explique que FTK Imager no solo es una herramienta de adquisición, sino que también ayuda en la documentación del proceso forense. Mencione que esto es crucial para mantener la integridad de la evidencia y su admisibilidad en procedimientos legales.
{{% /note %}}

---

### Campos de Metadata en FTK Imager
- Nombre del caso
- Número de evidencia
- Examinador
- Notas
- Detalles del sistema

{{% note %}}
Demuestre dónde se encuentran estos campos en la interfaz de FTK Imager. Explique la importancia de cada campo y cómo contribuyen a la documentación forense. Enfatice la necesidad de ser preciso y consistente al llenar esta información.
{{% /note %}}

---

### Formatos de Imagen en FTK Imager
- E01 (EnCase Evidence File Format)
- AFF (Advanced Forensic Format)
- AD1 (AccessData Custom Content Image)

Ventajas:
- Incluyen metadata forense
- Compresión de datos
- Integridad verificable

{{% note %}}
Explique las diferencias entre estos formatos y sus ventajas en el contexto forense. Mencione que E01 es ampliamente aceptado en la comunidad forense y en tribunales. Destaque cómo estos formatos ayudan a mantener la integridad de la evidencia y facilitan la verificación de la cadena de custodia.
{{% /note %}}

---

### Práctica: Creación de Imagen con FTK Imager
1. Inicia FTK Imager
2. Selecciona "Create Disk Image"
3. Elige una fuente (ej. unidad USB)
4. Selecciona formato E01
5. Llena los campos de metadata
6. Inicia la adquisición

{{% note %}}
Guíe a los estudiantes paso a paso en el proceso:
1. Muestre cómo seleccionar correctamente la fuente de la evidencia.
2. Explique las opciones de formato y por qué E01 es una buena elección.
3. Demuestre cómo llenar adecuadamente los campos de metadata.
4. Explique la importancia de verificar la integridad de la imagen después de la adquisición.
Discuta cómo este proceso contribuye a mantener una cadena de custodia sólida.
{{% /note %}}

---

### Ejercicio Final: Adquisición y Documentación Completa
1. Crea una imagen de una unidad USB usando FTK Imager
2. Documenta todo el proceso en un informe forense
3. Incluye:
   - Metadata de la adquisición
   - Hash de la imagen
   - Cadena de custodia detallada
4. Presenta tu informe a la clase

{{% note %}}
Supervise a los estudiantes durante el ejercicio, asegurándose de que:
1. Sigan las mejores prácticas en la adquisición de evidencia.
2. Documenten meticulosamente cada paso del proceso.
3. Incluyan toda la información relevante en su informe.
4. Entiendan la importancia de cada elemento en el contexto de una investigación real.
Prepare una discusión final sobre la importancia de la documentación precisa y la cadena de custodia en investigaciones forenses.
{{% /note %}}

---

### Resumen y Conclusiones
- Importancia de la adquisición y preservación adecuadas
- Rol crucial de la documentación y cadena de custodia
- Herramientas clave: tcpdump, Volatility, FTK Imager
- Consideraciones éticas y legales en forense digital

{{% note %}}
Recapitule los puntos clave de la clase:
- La adquisición y preservación correctas son fundamentales para la admisibilidad de la evidencia.
- La documentación detallada y la cadena de custodia son esenciales en cualquier investigación forense.
- Las herramientas como tcpdump, Volatility y FTK Imager son fundamentales en el toolkit de un investigador forense.
- Siempre se deben considerar las implicaciones éticas y legales en la práctica forense.
Anime a los estudiantes a seguir practicando y aprendiendo sobre estas herramientas y técnicas.
{{% /note %}}

---

### Preguntas

