+++
title = "Fundamentos de Computación Forense - Adquisición y Preservación de Evidencia"
outputs = ["Reveal"]
+++

## Identificación de Evidencia
### Fundamentos de Computación Forense

---
### Identificación en Análisis Forense Digital
- Primer paso crucial en cualquier investigación forense
- Determina el alcance y los objetivos de la investigación
- Identifica las fuentes potenciales de evidencia digital

{{% note %}}
La etapa de identificación es fundamental en el proceso forense digital. Es el punto de partida que establece las bases para toda la investigación subsiguiente. En esta etapa, determinamos qué estamos buscando, dónde podríamos encontrarlo, y qué recursos necesitaremos para la investigación.

Puntos clave a enfatizar:
1. La importancia de esta etapa para dirigir eficientemente los recursos y esfuerzos.
2. Cómo una identificación incorrecta puede llevar a perder evidencia crucial o a malgastar tiempo y recursos.
3. La necesidad de un enfoque metódico y sistemático desde el principio de la investigación.
{{% /note %}}

---

### Preparación para un Evento Forense
- La preparación adecuada es crucial para el éxito de la investigación
- Tener el equipo correcto puede hacer la diferencia
- La planificación previa ayuda a evitar errores y omisiones

{{% note %}}
La preparación para un evento forense es tan importante como la investigación en sí. Una preparación inadecuada puede llevar a la pérdida de evidencia crítica o incluso a la invalidación de la evidencia recolectada.

Puntos clave a enfatizar:
1. La importancia de tener una lista de verificación pre-evento.
2. Cómo la preparación adecuada puede ahorrar tiempo y recursos valiosos durante la investigación.
3. La necesidad de actualizar regularmente el kit de herramientas forenses para mantenerse al día con los avances tecnológicos.

Recuerde a los estudiantes que la tecnología evoluciona rápidamente, por lo que es crucial mantenerse actualizado con las últimas herramientas y técnicas.
{{% /note %}}

---

### ¿Qué llevar a un evento forense?
1. Bloqueador de escritura (Write Blocker)
2. Juego de destornilladores
3. Unidad flash con sistema operativo booteable
4. Unidad flash con FTK Imager portable
5. Disco duro externo de gran capacidad
6. Cables y adaptadores varios
7. Guantes antiestáticos
8. Cámara fotográfica
9. Etiquetas y marcadores

{{% note %}}
Vamos a discutir cada elemento en detalle:

1. Bloqueador de escritura: Es crucial para prevenir modificaciones accidentales en los dispositivos originales. Explique cómo funciona y por qué es esencial para mantener la integridad de la evidencia.

2. Destornilladores: Necesarios para abrir dispositivos si es necesario. Mencione la importancia de tener varios tamaños y tipos.

3. OS booteable: Permite iniciar un sistema sin modificar el disco duro original. Hable sobre las distribuciones forenses como CAINE o SIFT.

4. FTK Imager portable: Herramienta esencial para crear imágenes forenses. Explique brevemente sus funciones principales.

5. Disco duro externo: Para almacenar las imágenes forenses. Enfatice la necesidad de tener suficiente espacio y considerar la velocidad de transferencia.

6. Cables y adaptadores: Para conectar diversos tipos de dispositivos. Mencione adaptadores comunes como SATA a USB, IDE a USB, etc.

7. Guantes antiestáticos: Protegen los componentes electrónicos sensibles. Explique los riesgos de la electricidad estática.

8. Cámara: Para documentar la escena y el estado de los dispositivos. Discuta la importancia de la documentación visual.

9. Etiquetas y marcadores: Para etiquetar evidencia. Hable sobre la importancia de un sistema de etiquetado claro y consistente.

Enfatice que esta lista no es exhaustiva y puede variar según las necesidades específicas de cada caso. Anime a los estudiantes a pensar en otros elementos que podrían ser útiles en diferentes escenarios.
{{% /note %}}

---

### Consideraciones adicionales
- Documentación (formularios de cadena de custodia, notas)
- Equipo de protección personal (si es necesario)
- Fuente de alimentación portátil y baterías de repuesto
- Software de análisis forense adicional
- Dispositivos de almacenamiento en blanco (USBs, DVDs)

{{% note %}}
Estas consideraciones adicionales son igualmente importantes:

1. Documentación: Los formularios de cadena de custodia son cruciales para mantener la integridad de la evidencia. Explique cómo llenar estos formularios correctamente y la importancia de tomar notas detalladas durante todo el proceso.

2. Equipo de protección: En algunos casos, puede ser necesario equipo como máscaras, gafas de seguridad o trajes protectores. Discuta escenarios donde esto podría ser necesario (por ejemplo, en un laboratorio o en una escena de crimen).

3. Fuente de alimentación: Las baterías externas y los cargadores son esenciales para garantizar que el equipo no se quede sin energía durante la adquisición de datos, que puede llevar mucho tiempo.

4. Software adicional: Además de FTK Imager, podría ser útil tener otras herramientas como Autopsy, Volatility, o Wireshark. Discuta brevemente el propósito de cada una.

5. Dispositivos en blanco: Útiles para hacer copias rápidas de pequeñas cantidades de datos o para bootear sistemas. Enfatice la importancia de usar medios nuevos y confiables.

Recuerde a los estudiantes que la preparación también incluye la formación y la práctica. Sugiera realizar simulacros o ejercicios prácticos para familiarizarse con el equipo y los procedimientos antes de enfrentarse a un caso real.
{{% /note %}}

---

### Preparación del kit forense
- Organizar todo el equipo en un maletín o caja resistente
- Hacer un inventario y checklist del contenido
- Verificar y probar todo el equipo regularmente
- Mantener el software y los sistemas operativos actualizados
- Considerar tener kits duplicados para diferentes escenarios

{{% note %}}
La organización y mantenimiento del kit forense es tan importante como su contenido:

1. Maletín o caja: Debe ser resistente y preferiblemente a prueba de agua. Explique la importancia de proteger el equipo durante el transporte.

2. Inventario y checklist: Ayuda a asegurar que no falta nada antes de salir a un evento. Sugiera crear una lista laminated para fácil referencia.

3. Verificación regular: Pruebe los equipos periódicamente para asegurarse de que funcionan correctamente. Discuta la frecuencia recomendada (por ejemplo, mensualmente) y qué aspectos verificar.

4. Actualizaciones: El software y los sistemas operativos desactualizados pueden ser vulnerables o incompatibles con nuevos tipos de evidencia. Enfatice la importancia de mantenerse al día.

5. Kits duplicados: Diferentes escenarios pueden requerir diferentes herramientas. Por ejemplo, un kit para análisis de red vs. un kit para análisis de dispositivos móviles.

{{% /note %}}

---
### Objetivos de la Identificación
1. Determinar la naturaleza del incidente o caso
2. Identificar sistemas y dispositivos relevantes
3. Establecer una línea de tiempo preliminar
4. Identificar tipos de datos potencialmente relevantes

{{% note %}}
Expliquemos cada objetivo en detalle:

1. Naturaleza del incidente: ¿Es un caso de fraude, intrusión en la red, fuga de datos, etc.? Esto guiará toda la investigación.

2. Sistemas y dispositivos: Pueden incluir computadoras, servidores, dispositivos móviles, dispositivos IoT, etc. Es crucial no pasar por alto ninguna fuente potencial de evidencia.

3. Línea de tiempo: Establecer cuándo ocurrió el incidente, o el periodo de interés para la investigación. Esto ayuda a priorizar qué datos buscar.

4. Tipos de datos: Dependiendo del caso, podríamos estar buscando registros financieros, comunicaciones, registros de acceso, etc.

Enfatice que una identificación completa y precisa en esta etapa facilita enormemente las etapas posteriores de adquisición y análisis.
{{% /note %}}

---

### Fuentes de Evidencia Digital
- Dispositivos de almacenamiento (discos duros, SSDs, USBs)
- Dispositivos móviles (teléfonos, tablets)
- Sistemas de red (routers, switches, firewalls)
- Sistemas en la nube
- Dispositivos IoT

{{% note %}}
Es crucial entender la variedad de fuentes de evidencia digital en la actualidad:

1. Dispositivos de almacenamiento: Contienen gran cantidad de datos, incluyendo archivos eliminados y fragmentos de datos.

2. Dispositivos móviles: Fuentes ricas en información personal, ubicaciones, comunicaciones.

3. Sistemas de red: Pueden proporcionar logs de tráfico, intentos de acceso, y otras actividades de red.

4. Sistemas en la nube: Cada vez más relevantes, pueden contener copias de seguridad, documentos compartidos, y otros datos críticos.

5. Dispositivos IoT: A menudo pasados por alto, pero pueden proporcionar información valiosa sobre actividades y ubicaciones.

Destaque la importancia de considerar todas las fuentes potenciales y no limitarse solo a las más obvias. Cada caso puede requerir un enfoque diferente en cuanto a las fuentes de evidencia más relevantes.
{{% /note %}}

---

### Técnicas de Identificación
1. Entrevistas con personal relevante
2. Revisión de políticas y procedimientos
3. Análisis de registros y logs preliminares
4. Escaneo de red (cuando sea apropiado)
5. Revisión de documentación del sistema

{{% note %}}
Estas técnicas nos ayudan a recopilar información crucial en la etapa de identificación:

1. Entrevistas: Hablar con administradores de sistemas, usuarios, y otros involucrados puede proporcionar contexto valioso y pistas sobre dónde buscar.

2. Políticas y procedimientos: Entender cómo se supone que deben funcionar los sistemas nos ayuda a identificar anomalías.

3. Registros y logs: Una revisión preliminar puede indicar dónde enfocar la investigación más detallada.

4. Escaneo de red: Puede revelar dispositivos desconocidos o configuraciones inusuales, pero debe realizarse con precaución para no alterar evidencia.

5. Documentación del sistema: Proporciona una línea base de cómo debería ser el entorno normal.

Enfatice que estas técnicas deben aplicarse de manera que no alteren potencial evidencia. La documentación cuidadosa de cada paso es crucial desde esta etapa temprana.
{{% /note %}}

---

### Desafíos en la Identificación
- Entornos tecnológicos complejos y en constante cambio
- Datos volátiles y efímeros
- Encriptación y protección de datos
- Jurisdicciones múltiples (especialmente en casos internacionales)
- Limitaciones de tiempo y recursos
- En investigaciones no jurídicas: Dueño del dispositivo (Organización o empleado)

{{% note %}}
Los investigadores forenses enfrentan varios desafíos en la etapa de identificación:

1. Entornos complejos: La tecnología evoluciona rápidamente, lo que requiere una actualización constante de conocimientos y herramientas.

2. Datos volátiles: Algunos datos críticos pueden perderse si no se capturan rápidamente, como la memoria RAM o conexiones de red activas.

3. Encriptación: Puede hacer que ciertos datos sean inaccesibles sin las claves adecuadas.

4. Jurisdicciones múltiples: Diferentes leyes y regulaciones pueden afectar qué datos podemos acceder y cómo.

5. Limitaciones: A menudo hay presión para actuar rápidamente con recursos limitados.

Discuta cómo estos desafíos pueden afectar la estrategia de identificación y la importancia de la planificación y priorización cuidadosas.
{{% /note %}}

---

### Mejores Prácticas en Identificación
1. Mantener la objetividad
2. Documentar meticulosamente cada paso
3. Priorizar la preservación de evidencia volátil
4. Considerar implicaciones legales y éticas
5. Colaborar con expertos en áreas específicas cuando sea necesario

{{% note %}}
Estas mejores prácticas son cruciales para una identificación efectiva y ética:

1. Objetividad: Evitar suposiciones y sesgos que puedan dirigir incorrectamente la investigación.

2. Documentación: Cada decisión y acción debe registrarse. Esto es crucial para la credibilidad y admisibilidad de la evidencia.

3. Evidencia volátil: Identificar y preservar primero los datos que podrían perderse rápidamente, como la memoria RAM o las conexiones de red activas.

4. Implicaciones legales y éticas: Asegurarse de que todas las acciones cumplan con las leyes y regulaciones aplicables.

5. Colaboración: Reconocer cuándo se necesita experiencia adicional, ya sea en tecnologías específicas o en aspectos legales.

Enfatice que seguir estas prácticas desde el principio establece una base sólida para toda la investigación forense.
{{% /note %}}

---

### Introducción a la Cadena de Custodia
- Formato de [ejemplo](/forensics_resources/chain_of_custody.html)
- Comienza desde el momento de la identificación
- Documenta cada interacción con la potencial evidencia
- Crucial para la admisibilidad en procesos legales
- Establece la base para la fase de adquisición

{{% note %}}
La cadena de custodia es un concepto fundamental que se inicia desde el momento en que se identifica la potencial evidencia:

1. Inicio temprano: Enfatice que la cadena de custodia no comienza con la adquisición, sino desde el primer contacto con cualquier elemento que pueda ser evidencia.

2. Documentación continua: Explique que cada observación, cada dispositivo identificado, cada persona que accede a la escena debe ser documentado desde esta etapa inicial.

3. Admisibilidad legal: Destaque cómo una cadena de custodia bien mantenida desde la identificación fortalece la integridad de la evidencia en procesos legales.

4. Preparación para la adquisición: Mencione cómo una buena práctica de cadena de custodia en la fase de identificación facilita una transición suave a la fase de adquisición.

{{% /note %}}

---

### Caso de Estudio: Identificación en un Incidente de Seguridad
Escenario: Una empresa sospecha una brecha de datos
Pasos de identificación:
1. Entrevistar al equipo de TI
2. Revisar logs de firewall y servidores
3. Identificar sistemas potencialmente comprometidos
4. Establecer una línea de tiempo preliminar del incidente

{{% note %}}
Este caso de estudio ilustra cómo se aplica el proceso de identificación en un escenario real:

1. Las entrevistas con el equipo de TI pueden revelar anomalías observadas o cambios recientes en los sistemas.

2. La revisión de logs puede mostrar patrones de acceso inusuales o intentos de exfiltración de datos.

3. Basándose en los logs y entrevistas, se identifican los sistemas que necesitan una investigación más profunda.

4. Se crea una línea de tiempo preliminar que ayuda a enfocar la investigación en los periodos más relevantes.

Discuta cómo cada paso informa al siguiente y cómo esta identificación inicial guiaría las etapas posteriores de adquisición y análisis. Enfatice la importancia de mantener una mente abierta y estar dispuesto a ajustar el enfoque a medida que se descubre nueva información.
{{% /note %}}

---

## Adquisición y Preservación de Evidencia
### Fundamentos de Computación Forense

---

### Objetivos de la Sección
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
- Guymager (Linux)
- ewf-tools (Linux)

{{% note %}}
Presente brevemente cada herramienta:
- FTK Imager: herramienta gráfica popular, buena para principiantes.
- EnCase: suite forense completa, ampliamente utilizada en entornos profesionales.
- Guymager: alternativa de código abierto con interfaz gráfica.
Mencione las ventajas y casos de uso típicos de cada herramienta.
{{% /note %}}

---

### Write Blockers por Software
- Alternativa o complemento a los bloqueadores de escritura hardware
- Previenen modificaciones accidentales en la evidencia durante la adquisición
- Útiles cuando no se dispone de bloqueadores hardware o para ciertos tipos de dispositivos

{{% note %}}
Explique que los write blockers por software son una herramienta importante en el kit del investigador forense:

1. Función: Al igual que los bloqueadores hardware, evitan escrituras en el dispositivo original.
2. Ventajas: Flexibilidad, menor costo, útiles para dispositivos no estándar.
3. Desventajas: Pueden ser menos confiables que las soluciones hardware en algunos casos.

Enfatice que, aunque son útiles, en situaciones críticas o legalmente sensibles, los bloqueadores hardware siguen siendo preferidos por muchos profesionales debido a su robustez y aceptación generalizada en los tribunales.
{{% /note %}}

---

### Opciones de Write Blockers por Software
1. Linux: Linux Write Blocker ([link](https://github.com/msuhanov/Linux-write-blocker))
2. Windows: USB Write Blocker ([link](https://sourceforge.net/projects/usbwriteblockerforwindows8/))
3. Windows: Registry Write Block ([link](https://github.com/digitalsleuth/Registry-Write-Block))
4. MacOS: Disk Arbitrator ([link](https://github.com/aburgh/Disk-Arbitrator))

---

### Uso de Write Blockers por Software: Mejores Prácticas
1. Verifica la integridad antes y después de la adquisición
2. Documenta el uso del write blocker en la cadena de custodia
3. Combina con otras técnicas de preservación cuando sea posible
4. Mantén actualizado el software y conoce sus limitaciones

{{% note %}}
Explique cada práctica en detalle:

1. Integridad: Use hashes para verificar que no ha habido cambios en la evidencia.
2. Documentación: Es crucial registrar qué software se usó, su versión y configuración.
3. Técnicas combinadas: Por ejemplo, usar un write blocker por software junto con un sistema operativo forense live como [Paladin](https://sumuri.com/product-category/brands/paladin/?wpf_filter_cat_0=356&wpf_count=12&all_products_filtering=1)
4. Actualizaciones: Las nuevas versiones pueden corregir bugs o mejorar la compatibilidad.

Enfatice que, aunque los write blockers por software son herramientas valiosas, deben usarse con precaución y entendimiento de sus limitaciones para garantizar la integridad de la evidencia.
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

### Cadena de Custodia en la Adquisición
- Continuación del proceso iniciado en la fase de identificación
- Registro detallado de la manipulación de evidencia durante la adquisición
- Incluye:
  - Quién adquirió la evidencia
  - Cuándo se realizó la adquisición
  - Métodos y herramientas utilizados
  - Dónde se almacenó la evidencia adquirida

{{% note %}}
En esta fase, la cadena de custodia se vuelve aún más crítica y detallada:

1. Continuidad: Refuerce que esto es una continuación del proceso iniciado en la fase de identificación. La documentación debe ser consistente y complementaria a lo iniciado anteriormente.

2. Detalle en la adquisición: Explique la importancia de documentar cada paso del proceso de adquisición, incluyendo los métodos específicos, las herramientas utilizadas (con números de versión), y los hashes de verificación.

3. Manipulación de evidencia: Enfatice que cada transferencia de la evidencia, cada copia realizada, debe ser meticulosamente registrada.

4. Almacenamiento: Discuta las mejores prácticas para el almacenamiento seguro de la evidencia adquirida y cómo documentar el acceso a este almacenamiento.

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

### Ejercicio: Adquisición y Documentación Completa
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

### Exportar archivos y crear custom images
- En una imagen en específico podemos exportar archivos, también podemos exportar sus hashes.
- Podemos crear custom images con archivos específicos. Lo hacemos así para que sean también imágenes forenses.
- Tener cuidado con custom images y la cadena de custodia

---

### Repitiendo el proceso desde Kali

```bash
ewfacquire /dev/sdb
#Name: evidence
#Case number: 1
#Description: A description for the case
#Evidence number: 1
#Examiner Name: Your name
#Media type: fixed
#Media characteristics: physical
#File format: encase6
#Compression method: deflate
#Compression level: fast

#Then use default values
#It will generate the disk image in the current directory
```


---

### Preguntas

