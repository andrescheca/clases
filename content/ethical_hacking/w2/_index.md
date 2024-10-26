+++
title = "Reconocimiento y recopilación de información"
outputs = ["Reveal"]
+++

## Reconocimiento y Recopilación de Información
### Técnicas y Metodologías

---

### El plan para hoy

- Metodología OSINT
- Tipos de reconocimiento pasivo
- Técnicas y herramientas
- Ejercicios prácticos
- Análisis de la información

{{% note %}}
Hoy nos enfocaremos en técnicas de reconocimiento pasivo, comenzando con fundamentos metodológicos hasta llegar a ejercicios prácticos. Es crucial entender que todo lo que veremos son técnicas que no interactúan directamente con el objetivo, permitiendo recopilar información valiosa sin ser detectados.
{{% /note %}}

---

### Metodología OSINT

Fases del proceso:
- Definición de objetivos
- Identificación de fuentes
- Recopilación de datos
- Procesamiento y validación
- Análisis de relaciones
- Documentación

{{% note %}}
Una metodología estructurada para OSINT es crucial:
- Los objetivos definen el alcance y profundidad
- Las fuentes deben ser diversas y confiables
- La recopilación debe ser sistemática y documentada
- La validación evita desinformación
- El análisis de relaciones revela conexiones ocultas
- La documentación permite reproducibilidad
{{% /note %}}

---

### OSINT (Open Source Intelligence)

Recopilación de información de fuentes públicamente disponibles:
- Redes sociales
- Sitios web corporativos
- Registros públicos
- Documentos técnicos
- Foros y grupos de discusión
- Recursos gubernamentales

{{% note %}}
OSINT es la base del reconocimiento pasivo. Incluye:
- Análisis de presencia digital de la organización
- Identificación de empleados y sus roles
- Tecnologías utilizadas
- Infraestructura publicada
- Documentos filtrados o mal configurados
- Información histórica y cambios organizacionales

La clave es construir una imagen completa sin interactuar con el objetivo.
{{% /note %}}

---

### Perfilado de Actores de Amenaza

OSINT para identificar:
- Tácticas, técnicas y procedimientos (TTPs)
- Indicadores de compromiso (IOCs)
- Patrones de ataque
- Infraestructura utilizada
- Objetivos preferidos

{{% note %}}
El perfilado de actores de amenaza mediante OSINT nos permite:
- Identificar patrones de comportamiento
- Anticipar posibles objetivos
- Reconocer herramientas y técnicas comunes
- Establecer atribución de ataques
- Mejorar defensas basadas en TTPs conocidos
{{% /note %}}

---

{{% section %}}

### Ejemplo de Perfilado: APT29 (Cozy Bear)

Características identificadas vía OSINT:
- **TTPs principales:**
  - Spear-phishing con documentos maliciosos
  - WellMess y WellMail malware
  - Movimiento lateral vía PowerShell
  - Exfiltración mediante servicios cloud legítimos

{{% note %}}
APT29 es un ejemplo perfecto de cómo el OSINT nos ayuda a entender actores de amenaza:
- Sus TTPs han sido bien documentados por investigadores de seguridad
- Podemos identificar sus herramientas preferidas mediante análisis de malware público
- Sus objetivos nos permiten predecir futuros ataques
- La comprensión de su infraestructura ayuda en la detección temprana
- Esta información permite desarrollar mejores controles defensivos

Fuentes principales: reportes de MITRE ATT&CK, análisis de empresas de seguridad, y documentación de incidentes previos.
{{% /note %}}

---

### Ejemplo de Perfilado: APT29 (Cozy Bear) (2)

- **Objetivos típicos:**
  - Organizaciones gubernamentales
  - Think tanks y ONGs
  - Instituciones de investigación médica
  - Empresas farmacéuticas

{{% note %}}
APT29 es un ejemplo perfecto de cómo el OSINT nos ayuda a entender actores de amenaza:
- Sus TTPs han sido bien documentados por investigadores de seguridad
- Podemos identificar sus herramientas preferidas mediante análisis de malware público
- Sus objetivos nos permiten predecir futuros ataques
- La comprensión de su infraestructura ayuda en la detección temprana
- Esta información permite desarrollar mejores controles defensivos

Fuentes principales: reportes de MITRE ATT&CK, análisis de empresas de seguridad, y documentación de incidentes previos.
{{% /note %}}

---

### Ejemplo de Perfilado: APT29 (Cozy Bear) (3)

- **Infraestructura:**
  - Uso de VPNs comerciales
  - Servidores comprometidos como C2
  - Dominios que imitan servicios legítimos

{{% note %}}
APT29 es un ejemplo perfecto de cómo el OSINT nos ayuda a entender actores de amenaza:
- Sus TTPs han sido bien documentados por investigadores de seguridad
- Podemos identificar sus herramientas preferidas mediante análisis de malware público
- Sus objetivos nos permiten predecir futuros ataques
- La comprensión de su infraestructura ayuda en la detección temprana
- Esta información permite desarrollar mejores controles defensivos

Fuentes principales: reportes de MITRE ATT&CK, análisis de empresas de seguridad, y documentación de incidentes previos.
{{% /note %}}

{{% /section %}}

---

### Google Dorks: Búsqueda Avanzada

Operadores básicos:
- `site:` - Buscar en un dominio específico
- `filetype:` - Buscar tipos de archivo
- `inurl:` - Texto en la URL
- `intitle:` - Texto en el título
- `intext:` - Texto en el contenido
- `ext:` - Extensión de archivo

[Ejemplo documento oficial](https://www.google.com/search?q=intext%3A%22ecuador+del+encuentro%22+filetype%3Apdf&client=firefox-b-d&sca_esv=e0c7aecaa2e75e78&sxsrf=ADLYWIKxvSKepMdOZsmMl8fh2EPnRihoWQ%3A1729912000213&ei=wFwcZ67eDIeqwbkPqd6ZwQY&ved=0ahUKEwiuvo-yiKuJAxUHVTABHSlvJmgQ4dUDCA8&uact=5&oq=intext%3A%22ecuador+del+encuentro%22+filetype%3Apdf&gs_lp=Egxnd3Mtd2l6LXNlcnAiK2ludGV4dDoiZWN1YWRvciBkZWwgZW5jdWVudHJvIiBmaWxldHlwZTpwZGZI2xVQzQJY2BNwAXgAkAEAmAGXAaABzA2qAQQwLjEzuAEDyAEA-AEBmAIAoAIAmAMAiAYBkgcAoAfJBA&sclient=gws-wiz-serp)

[Ejemplo](https://www.google.com/search?client=firefox-b-d&q=filetype%3Apdf+harry+potter)

{{% note %}}
Google Dorks es una técnica de búsqueda avanzada que permite:
- Encontrar archivos específicos en dominios
- Descubrir información sensible expuesta
- Identificar vulnerabilidades de configuración
- Localizar paneles de administración
- Encontrar documentos internos expuestos

Ejemplo: "site:ejemplo.com filetype:pdf intext:confidential" buscaría documentos PDF con la palabra "confidencial" en un dominio específico.
{{% /note %}}

---

### Extracción y Análisis de Metadatos

Herramientas y técnicas:
- ExifTool
- FOCA
- Metagoofil
- PowerMeta
- API de análisis de documentos

Información revelada:
- Usuarios y sistemas
- Software utilizado
- Ubicaciones
- Timestamps
- Datos organizacionales

{{% note %}}
Los metadatos son una fuente rica de información que frecuentemente se pasa por alto:
- Los datos EXIF en imágenes pueden revelar ubicaciones exactas con coordenadas GPS
- Las imágenes pueden mostrar el dispositivo usado y configuraciones de cámara
- Los documentos pueden contener nombres de usuario y rutas de sistema
- Los timestamps revelan patrones de trabajo y zonas horarias
- Las versiones de software indican posible software vulnerable
{{% /note %}}

---

### Búsqueda Inversa de Imágenes

Herramientas:
- Google Lens
- TinEye
- Yandex Images
- Bing Visual Search

Usos en OSINT:
- Verificar autenticidad de imágenes
- Encontrar fuentes originales
- Identificar ubicaciones
- Descubrir metadatos

{{% note %}}
La búsqueda inversa de imágenes nos permite:
- Verificar la autenticidad de logos e imágenes corporativas
- Encontrar usos no autorizados de recursos visuales
- Identificar ubicaciones físicas de instalaciones
- Analizar metadatos EXIF que pueden revelar información sensible
- Establecer conexiones entre diferentes entidades u organizaciones
{{% /note %}}

---

### Ejercitemos el músculo de OSINT

{{< imgref src="images/2024/10/osint_1.jpg" alt="Encontremos donde es esto" style="width: 70%; height: 70%; margin: 0 auto">}}

---

### Ahora ustedes

{{< imgref src="images/2024/10/osint_2.jpg" alt="Encontremos donde es esto" style="width: 70%; height: 70%; margin: 0 auto">}}

---

### Agregación y Correlación de Datos

Técnicas de correlación:
- Mapeo de relaciones
- Análisis temporal
- Patrones de comportamiento
- Vínculos organizacionales
- Inferencia de información

{{% note %}}
La correlación de datos OSINT permite:
- Crear perfiles organizacionales completos
- Identificar relaciones no evidentes
- Descubrir patrones operacionales
- Validar información entre fuentes
- Generar nuevas líneas de investigación

Por ejemplo: Combinar información de LinkedIn con formatos de email corporativos puede revelar posibles objetivos de phishing.
{{% /note %}}

---

### Herramientas OSINT Adicionales

- Shodan
- theHarvester
- Maltego
- Recon-ng
- WHOIS y DNS
- Wayback Machine
- GitHub y repositorios de código

{{% note %}}
Cada herramienta cumple un propósito específico:
- Shodan: descubrimiento de dispositivos y servicios expuestos
- theHarvester: recopilación de emails, subdominios y nombres
- Maltego: mapeo de relaciones y entidades
- Recon-ng: framework de reconocimiento
- WHOIS/DNS: información sobre dominios e infraestructura
- Wayback Machine: contenido histórico de sitios web
- GitHub: código fuente, comentarios y configuraciones
{{% /note %}}

---

### Footprinting (Reconocimiento Pasivo)

Técnicas específicas de recopilación sin interacción:
- Análisis de DNS
- Búsqueda de subdominios
- Registros históricos
- Metadatos de documentos
- Tecnologías y frameworks utilizados
- Información de empleados
- Arquitectura de red publicada

{{% note %}}
El footprinting se enfoca en construir el perfil técnico del objetivo:
- Los registros DNS revelan infraestructura
- Los subdominios pueden indicar servicios internos
- Los metadatos exponen software y usuarios
- La información de empleados ayuda a mapear la organización
- Los detalles técnicos permiten identificar vulnerabilidades potenciales

Todo esto sin generar tráfico sospechoso hacia el objetivo.
{{% /note %}}

---

### Análisis de la Información

Categorización de hallazgos:
- Información organizacional
- Infraestructura técnica
- Configuraciones y políticas
- Vectores de ataque potenciales
- Vulnerabilidades identificadas

{{% note %}}
El análisis debe estructurarse por criticidad e impacto:
- Priorizar hallazgos que representan riesgo inmediato
- Identificar patrones y relaciones entre datos
- Documentar posibles vectores de ataque
- Mapear la superficie de ataque completa
- Preparar recomendaciones basadas en hallazgos

Esta fase es crucial para planificar siguientes pasos y generar reportes útiles.
{{% /note %}}

---

### ¿Preguntas?

{{% note %}}
Momento para resolver dudas sobre las técnicas de reconocimiento pasivo y OSINT que hemos cubierto hoy.
{{% /note %}}

---

### Parte de la siguiente tarea

Realizar reconocimiento pasivo de una organización:
1. Usar solo técnicas OSINT
2. Documentar metodología
3. Categorizar hallazgos
4. Analizar implicaciones de seguridad

{{% note %}}
La tarea permitirá practicar técnicas de reconocimiento pasivo:
- Aplicar herramientas OSINT vistas en clase
- Documentar cada hallazgo y su fuente
- Evaluar el impacto potencial en la seguridad
- Preparar un reporte profesional
- No realizar ningún tipo de reconocimiento activo
{{% /note %}}