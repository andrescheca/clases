+++
title = "Fundamentos de Computación Forense - Introducción"
outputs = ["Reveal"]
+++

## Introducción a las Ciencias Forenses y Computación Forense

---

### Historia de las Ciencias Forenses
{{% fragment %}}Antigüedad: Primeros métodos de identificación{{% /fragment %}}
{{% fragment %}}Siglo XIX: Nacimiento de la criminalística moderna{{% /fragment %}}
{{% fragment %}}Siglo XX: Avances científicos y tecnológicos{{% /fragment %}}

{{% note %}}
- Antigüedad: Mencionar el método de Arquímedes para detectar fraudes en metales preciosos (250 a.C.).
- Siglo XIX: Destacar las contribuciones de Alphonse Bertillon (sistema antropométrico) y Sir Francis Galton (huellas dactilares).
- Siglo XX: Hablar sobre el desarrollo del análisis de ADN por Alec Jeffreys en 1984.
{{% /note %}}

---

### Caso de Estudio en Forensia: El Asesino del Torso
{{% fragment %}}1935: Crimen sin resolver en Cleveland, Ohio{{% /fragment %}}
{{% fragment %}}Uso pionero de técnicas forenses{{% /fragment %}}
{{% fragment %}}Lecciones aprendidas{{% /fragment %}}

{{% note %}}
Discutir cómo este caso, aunque no resuelto, impulsó el desarrollo de técnicas forenses modernas como el análisis de huellas dactilares en cuerpos descompuestos y la importancia de preservar la escena del crimen. Fomentar un diálogo sobre cómo las técnicas actuales podrían haber cambiado el resultado de la investigación.
{{% /note %}}

---

### Nacimiento de la Computación Forense
{{% fragment %}}1970s: Primeros casos de crímenes informáticos{{% /fragment %}}
{{% fragment %}}1980s: Desarrollo de herramientas y técnicas básicas{{% /fragment %}}
{{% fragment %}}1990s: Reconocimiento como disciplina{{% /fragment %}}

{{% note %}}
- 1970s: Mencionar el caso de Financial Information Systems de Texas (1978), uno de los primeros fraudes informáticos documentados.
- 1980s: Hablar sobre la creación del Magnetic Media Program del IRS en 1986.
- 1990s: Discutir la formación de la International Organization on Computer Evidence (IOCE) en 1995.
{{% /note %}}

---

### Evolución de la Computación Forense
{{% fragment %}}2000s: Estandarización y profesionalización{{% /fragment %}}
{{% fragment %}}2010s: Desafíos de la nube y dispositivos móviles{{% /fragment %}}
{{% fragment %}}2020s: IA, IoT y nuevos retos{{% /fragment %}}

{{% note %}}
- 2000s: Mencionar la creación del estándar ISO 17025 para laboratorios forenses.
- 2010s: Discutir el impacto de servicios como Dropbox y iCloud en las investigaciones.
- 2020s: Abordar los desafíos de la forensia en sistemas de IA y dispositivos IoT.
{{% /note %}}

---

### Admisibilidad Legal de la Evidencia Digital
{{% fragment %}}Principio fundamental de las ciencias forenses{{% /fragment %}}
{{% fragment %}}Garantía de integridad y autenticidad{{% /fragment %}}
{{% fragment %}}Cumplimiento de normas y procedimientos legales{{% /fragment %}}

{{% note %}}
Explicar que el objetivo principal de la computación forense es obtener evidencia digital que sea admisible en un tribunal. Discutir la importancia de seguir procedimientos estandarizados, mantener la cadena de custodia, y documentar meticulosamente cada paso del proceso. Mencionar casos relevantes que han establecido precedentes en la admisibilidad de evidencia digital, como el caso Daubert v. Merrell Dow Pharmaceuticals (1993) en EE.UU., que estableció criterios para la admisibilidad de evidencia científica.
{{% /note %}}

---

### Implicaciones de la Admisibilidad Legal
{{% fragment %}}Necesidad de certificaciones y estándares{{% /fragment %}}
{{% fragment %}}Desafíos en la preservación de evidencia volátil{{% /fragment %}}
{{% fragment %}}Importancia de la documentación exhaustiva{{% /fragment %}}

{{% note %}}
Discutir cómo la necesidad de admisibilidad legal impacta en la práctica de la computación forense. Hablar sobre la importancia de las certificaciones profesionales (como CFCE, EnCE) y el cumplimiento de estándares internacionales (como ISO/IEC 27037). Abordar los desafíos únicos que presenta la evidencia digital, como su volatilidad y facilidad de alteración. Enfatizar la crucial importancia de una documentación meticulosa en cada etapa del proceso forense.
{{% /note %}}

---

### Las 5 Etapas de una Investigación Forense Digital
1. {{% fragment %}}Identificación{{% /fragment %}}
2. {{% fragment %}}Extracción y Preservación{{% /fragment %}}
3. {{% fragment %}}Análisis{{% /fragment %}}
4. {{% fragment %}}Documentación{{% /fragment %}}
5. {{% fragment %}}Presentación{{% /fragment %}}

{{% note %}}
Introducir las cinco etapas principales de una investigación forense digital. Mencionar que aunque algunos modelos pueden variar ligeramente, estos pasos fundamentales son generalmente reconocidos en el campo.
{{% /note %}}

---

### 1. Identificación
{{% fragment %}}Reconocimiento de evidencia potencial{{% /fragment %}}
{{% fragment %}}Determinación de su valor probatorio{{% /fragment %}}
{{% fragment %}}Priorización de fuentes de evidencia{{% /fragment %}}

{{% note %}}
Explicar la importancia de identificar correctamente las fuentes de evidencia relevantes. Discutir cómo esta etapa puede influir en la dirección de toda la investigación. Dar ejemplos de tipos de evidencia digital: correos electrónicos, registros de navegación, archivos de sistema, etc.
{{% /note %}}

---

### 2. Extracción y Preservación
{{% fragment %}}Creación de copias forenses{{% /fragment %}}
{{% fragment %}}Uso de bloqueadores de escritura{{% /fragment %}}
{{% fragment %}}Mantenimiento de la cadena de custodia{{% /fragment %}}

{{% note %}}
Enfatizar la crucial importancia de preservar la integridad de la evidencia original. Explicar el concepto de "imagen forense" y por qué es esencial trabajar con copias. Discutir herramientas como FTK Imager o dd. Detallar la importancia de la cadena de custodia para la admisibilidad legal.
{{% /note %}}

---

### 3. Análisis
{{% fragment %}}Recuperación de datos eliminados{{% /fragment %}}
{{% fragment %}}Análisis de metadatos{{% /fragment %}}
{{% fragment %}}Correlación de evidencias{{% /fragment %}}

{{% note %}}
Describir las técnicas y herramientas comunes utilizadas en el análisis forense, como la recuperación de archivos eliminados, el análisis de registros del sistema, y la correlación de timestamps. Mencionar herramientas populares como EnCase o Autopsy. Discutir la importancia de mantener un enfoque metódico y documentado durante esta fase.
{{% /note %}}

---

### 4. Documentación
{{% fragment %}}Registro detallado de procedimientos{{% /fragment %}}
{{% fragment %}}Creación de líneas de tiempo{{% /fragment %}}
{{% fragment %}}Elaboración de informes técnicos{{% /fragment %}}

{{% note %}}
Enfatizar la importancia crucial de una documentación exhaustiva para la admisibilidad legal. Discutir cómo crear informes claros y detallados que puedan ser entendidos tanto por expertos como por no expertos. Mencionar la importancia de documentar no solo los hallazgos, sino también cada paso del proceso de investigación.
{{% /note %}}

---

### 5. Presentación
{{% fragment %}}Preparación para testimonio en corte{{% /fragment %}}
{{% fragment %}}Comunicación de hallazgos a no expertos{{% /fragment %}}
{{% fragment %}}Defensa de la metodología utilizada{{% /fragment %}}

{{% note %}}
Discutir los desafíos de presentar evidencia técnica en un entorno legal. Enfatizar la importancia de comunicar claramente los hallazgos y metodologías a una audiencia no técnica. Mencionar técnicas para presentar evidencia digital de manera efectiva en un tribunal.
{{% /note %}}

---

### Otros modelos - Ken Zatyco (2007)

- Autoridad de Búsqueda
- Cadena de Custodia
- Función de Imágenes/Hashing
- Herramientas Validadas
- Análisis
- Repetibilidad (Garantía de Calidad)
- Reportes
- Posible Presentación de Expertos

---

### Caso de Estudio: Silk Road
{{% fragment %}}2011-2013: Mercado negro en la dark web{{% /fragment %}}
{{% fragment %}}Desafíos de investigación en criptomonedas{{% /fragment %}}
{{% fragment %}}Técnicas forenses utilizadas{{% /fragment %}}

{{% note %}}
Discutir cómo el FBI rastreó al fundador de Silk Road, Ross Ulbricht. Hablar sobre las técnicas de OSINT utilizadas y cómo se vincularon las transacciones de Bitcoin con Ulbricht. Analizar cómo se manejó la evidencia digital para asegurar su admisibilidad en el juicio.
{{% /note %}}

---

### The Cuckoo's Egg: Un Hito en Computación Forense
{{% fragment %}}1986: Clifford Stoll descubre una discrepancia de 75 centavos{{% /fragment %}}
{{% fragment %}}Rastreo de un hacker a través de redes internacionales{{% /fragment %}}
{{% fragment %}}Uso pionero de técnicas de monitoreo y análisis de red{{% /fragment %}}
{{% fragment %}}Colaboración entre instituciones académicas y agencias gubernamentales{{% /fragment %}}
{{% fragment %}}Implicaciones en seguridad nacional y espionaje{{% /fragment %}}

{{% note %}}
Puntos clave para discusión en clase:

1. Origen del caso: 
   - Discrepancia de 75 centavos en la contabilidad del Laboratorio Lawrence Berkeley.
   - Stoll, un astrónomo convertido en administrador de sistemas, investiga por curiosidad.

2. Métodos de investigación:
   - Creación de registros detallados de actividad de red (primeras formas de logs).
   - Uso de "honeypots" para atraer y estudiar al intruso.
   - Rastreo manual de conexiones a través de múltiples redes y países.

3. Desafíos técnicos:
   - Limitaciones tecnológicas de la época (modems de baja velocidad, redes primitivas).
   - Falta de herramientas especializadas para forensia digital.
   - Necesidad de desarrollar métodos de monitoreo en tiempo real.

4. Implicaciones legales y éticas:
   - Debates sobre la legalidad de monitorear comunicaciones.
   - Cuestiones de jurisdicción internacional en cibercrimen.
   - Equilibrio entre seguridad nacional y privacidad individual.

5. Resultados e impacto:
   - Identificación del hacker Markus Hess, trabajando para la KGB.
   - Aumento de la conciencia sobre vulnerabilidades en sistemas conectados.
   - Impulso para el desarrollo de políticas y herramientas de seguridad informática.

6. Legado en computación forense:
   - Establecimiento de prácticas básicas de registro y análisis de actividades de red.
   - Demostración de la importancia de la persistencia y el detalle en investigaciones digitales.
   - Inspiración para futuras generaciones de profesionales en seguridad informática.

Fomentar la discusión sobre cómo este caso, ocurrido en los albores de Internet, sentó las bases para muchas prácticas modernas de computación forense y seguridad de redes.
{{% /note %}}

---

### Ejercicio Práctico: Análisis de un Caso
{{% fragment %}}Escenario: Sospecha de fraude financiero interno{{% /fragment %}}
{{% fragment %}}Evidencia: Laptop corporativa, smartphone, registros de correo{{% /fragment %}}
{{% fragment %}}Tarea: Diseñar plan de investigación siguiendo las 5 etapas{{% /fragment %}}

{{% note %}}
Dividir la clase en grupos pequeños. Dar 20 minutos para que diseñen un plan de investigación basado en las 5 etapas discutidas, enfatizando la importancia de la admisibilidad legal en cada paso. Luego, facilitar una discusión donde cada grupo presente su enfoque y se comparen las diferentes estrategias.
{{% /note %}}

---

### Desafíos Actuales en Computación Forense
{{% fragment %}}Cifrado y protección de datos{{% /fragment %}}
{{% fragment %}}Computación en la nube y jurisdicción legal{{% /fragment %}}
{{% fragment %}}Internet de las cosas (IoT) y diversidad de dispositivos{{% /fragment %}}
{{% fragment %}}Evolución rápida de la tecnología vs. precedentes legales{{% /fragment %}}

{{% note %}}
Discutir cómo cada uno de estos desafíos impacta en las investigaciones forenses y en la admisibilidad de la evidencia. Por ejemplo, cómo el cifrado puede hacer inaccesible la evidencia, o cómo la computación en la nube dispersa los datos en múltiples jurisdicciones, complicando la legalidad de la recolección de evidencia.
{{% /note %}}

---

### El Futuro de la Computación Forense
{{% fragment %}}Inteligencia artificial en el análisis forense{{% /fragment %}}
{{% fragment %}}Forensia en entornos de realidad virtual y aumentada{{% /fragment %}}
{{% fragment %}}Adaptación de leyes y estándares a nuevas tecnologías{{% /fragment %}}

{{% note %}}
Discutir cómo estas tecnologías emergentes están cambiando el campo de la computación forense y los desafíos que presentan para la admisibilidad legal. Por ejemplo, cómo la IA puede ayudar a analizar grandes volúmenes de datos, pero también plantea preguntas sobre la explicabilidad de sus conclusiones en un tribunal.
{{% /note %}}

---

### ¿Preguntas?
