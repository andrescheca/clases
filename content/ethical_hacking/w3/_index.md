+++
title = "Enumeración Activa"
outputs = ["Reveal"]
+++

## Enumeración Activa
### Técnicas y Herramientas para Reconocimiento Activo

---

### El plan para hoy

- Fundamentos de Nmap
- Análisis y seguimiento de resultados
- Identificación de sistemas operativos
- Análisis de versiones y banners
- Herramientas web especializadas
- Técnicas de enumeración por protocolo

{{% note %}}
La enumeración activa es una fase crucial en el proceso de ethical hacking donde interactuamos directamente con los objetivos para obtener información detallada sobre sus sistemas y servicios. A diferencia del reconocimiento pasivo, estas técnicas son detectables por el objetivo, por lo que debemos:

- Comprender el impacto de cada herramienta y técnica
- Saber interpretar los resultados obtenidos
- Conocer las mejores prácticas para minimizar la detección
- Entender las implicaciones legales y éticas
- Documentar adecuadamente todos los hallazgos
{{% /note %}}

---

### Nmap: El Estándar de Oro

Herramienta fundamental para:
- Descubrimiento de hosts
- Escaneo de puertos
- Detección de servicios
- Identificación de OS
- Scripts automatizados (NSE)

{{% note %}}
Nmap (Network Mapper) es la herramienta más versátil y poderosa para enumeración de redes:

- Creada por Gordon Lyon (Fyodor) en 1997
- Disponible para todos los sistemas operativos
- Combina múltiples técnicas de escaneo
- Altamente configurable y extensible
- Cuenta con una gran comunidad de usuarios
- Documentación extensa y actualizada

Su versatilidad la hace indispensable en el toolkit de cualquier profesional de seguridad.
{{% /note %}}

---

{{% section %}}

### Flags Comunes de Nmap

Escaneos básicos:
```bash
nmap -sS -p- 192.168.1.0/24    # SYN scan todos los puertos
nmap -sU -p 53,161,162 10.0.0.1 # UDP scan puertos específicos
nmap -sV -sC 172.16.1.10       # Versiones y scripts default
```

{{% note %}}
Los tipos de escaneo en Nmap son fundamentales para diferentes escenarios:

- `-sS` (SYN scan): El más común y sigiloso
  - No completa las conexiones TCP
  - Más rápido que conexiones completas
  - Requiere privilegios root/admin
  - Menor probabilidad de detección

- `-sU` (UDP scan): Esencial para servicios UDP
  - Más lento que TCP
  - Propenso a falsos negativos
  - Importante para servicios como DNS, SNMP

- `-sV` (Version detection): Identifica servicios y versiones
  - Más intrusivo pero información valiosa
  - Puede disparar IDS/IPS
  - Útil para identificar software vulnerable
{{% /note %}}

---

### Optimización de Escaneos

Flags de rendimiento:
```bash
# Escaneo rápido de puertos comunes
nmap -F target.com

# Escaneo agresivo pero optimizado
nmap -T4 -A target.com

# Escaneo sigiloso
nmap -T2 -sS -Pn target.com
```

{{% note %}}
La optimización de escaneos es crucial para balancear velocidad, precisión y sigilo:

Timing templates (-T0 a -T5):
- T0 (Paranoid): Extremadamente lento, evasión de IDS
- T1 (Sneaky): Muy lento, bajo consumo de recursos
- T2 (Polite): Lento, menor impacto en la red
- T3 (Normal): Comportamiento por defecto
- T4 (Aggressive): Rápido, asume buena red
- T5 (Insane): Muy rápido, puede perder información

Otros flags de optimización:
- `-F`: Escanea solo puertos más comunes
- `-r`: Escaneo secuencial en lugar de aleatorio
- `--min-rate`: Establece tasa mínima de paquetes
- `--max-retries`: Limita reintentos por puerto
{{% /note %}}

---

### Scripts NSE Esenciales

```bash
# Scripts de detección básica
nmap --script=default target.com

# Scripts específicos
nmap --script=vuln,exploit target.com

# Scripts de enumeración
nmap --script=discovery target.com
```

{{% note %}}
Nmap Script Engine (NSE) extiende significativamente las capacidades de Nmap:

Categorías principales de scripts:
- auth: Autenticación y bypass
- broadcast: Descubrimiento por broadcast
- brute: Fuerza bruta de credenciales
- default: Scripts seguros y útiles
- discovery: Enumeración de servicios
- dos: Detección de vulnerabilidades DoS
- exploit: Explotación de vulnerabilidades
- fuzzer: Fuzzing de protocolos
- intrusive: Scripts más agresivos
- malware: Detección de malware
- safe: Scripts no intrusivos
- vuln: Detección de vulnerabilidades

Es importante entender el impacto de cada script antes de ejecutarlo.
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Análisis de Resultados por Protocolo

FTP (21):
```bash
# Verificar acceso anónimo
nmap --script ftp-anon target.com
```

SMB (445):
```bash
# Enumerar recursos compartidos
nmap --script smb-enum-shares target.com
```

{{% note %}}
Cada protocolo requiere un enfoque específico de enumeración:

FTP (Puerto 21):
- Verificar acceso anónimo
- Buscar directorios escribibles
- Comprobar configuración de SSL/TLS
- Identificar versiones vulnerables
- Analizar banners informativos

SMB (Puerto 445):
- Enumerar recursos compartidos
- Verificar acceso null session
- Identificar versiones de Windows
- Buscar vulnerabilidades conocidas
- Verificar políticas de contraseñas
{{% /note %}}

---

### Análisis de Resultados (cont.)

HTTP/HTTPS (80/443):
```bash
# Enumeración web básica
nmap --script http-enum target.com

# Verificar SSL/TLS
nmap --script ssl-enum-ciphers target.com
```

{{% note %}}
La enumeración web es especialmente importante:

HTTP/HTTPS:
- Identificar servidores web (Apache, Nginx, IIS)
- Verificar versiones y módulos
- Descubrir directorios y archivos
- Analizar certificados SSL/TLS
- Detectar CMS y frameworks
- Buscar vulnerabilidades comunes
- Identificar archivos de configuración expuestos
- Analizar headers de seguridad

Esta información es crucial para planificar pruebas más específicas.
{{% /note %}}

---

### Análisis de Resultados (cont.)

DNS (53):
```bash
# Enumeración DNS
nmap --script dns-brute target.com
```

SSH (22):
```bash
# Enumeración SSH
nmap --script ssh-auth-methods target.com
```

{{% note %}}
Protocolos adicionales importantes:

DNS (Puerto 53):
- Transferencias de zona
- Enumeración de subdominios
- Registros DNS específicos
- Configuraciones mal securizadas
- Versiones de software DNS

SSH (Puerto 22):
- Métodos de autenticación permitidos
- Algoritmos de cifrado soportados
- Banners informativos
- Verificación de versiones vulnerables
- Políticas de acceso
{{% /note %}}

{{% /section %}}

---

### Identificación de Sistemas Operativos

Técnicas de Nmap:
```bash
# Detección de OS básica
nmap -O target.com

# Detección agresiva
nmap -A target.com
```

{{% note %}}
La identificación del sistema operativo es crucial para:

Métodos de detección:
- TCP/IP Fingerprinting
  - Análisis de características TCP/IP únicas
  - Comportamiento de pila de red
  - Valores TTL por defecto
  - Tamaños de ventana TCP
  - Ordenamiento de opciones TCP

- Análisis de respuestas
  - Comportamiento ante paquetes malformados
  - Respuestas a pruebas específicas
  - Formatos de respuesta ICMP
  - Características de servicios comunes

La precisión depende de:
- Cantidad de puertos abiertos
- Filtrado de firewall
- Configuraciones personalizadas
- Virtualización
{{% /note %}}

---

### Análisis de Banners y Versiones

Técnicas:
- Conexiones directas (netcat)
- Escaneo de versiones Nmap
- Herramientas específicas por servicio

```bash
# Netcat para banner grabbing
nc -nv target.com 80

# Nmap version scan
nmap -sV --version-intensity 5 target.com
```

{{% note %}}
El análisis de banners proporciona información vital:

Importancia de los banners:
- Identificación precisa de servicios
- Detección de versiones específicas
- Información sobre configuración
- Pistas sobre el sistema operativo
- Posibles vulnerabilidades

Técnicas de obtención:
- Conexiones TCP directas
- Solicitudes HTTP personalizadas
- Scripts automatizados
- Herramientas especializadas
- Análisis de respuestas de error

Consideraciones de seguridad:
- Los banners pueden ser falsificados
- Necesidad de validación cruzada
- Importancia del contexto
- Actualización de bases de datos
- Documentación de hallazgos
{{% /note %}}

---

### Herramientas Web Especializadas

Nikto:
```bash
# Escaneo básico
nikto -h http://target.com

# Escaneo con tuning
nikto -h target.com -Tuning 123
```

{{% note %}}
Nikto es una herramienta robusta para escaneo web:

Características principales:
- Detección de configuraciones inseguras
- Identificación de archivos peligrosos
- Verificación de vulnerabilidades comunes
- Comprobación de versiones obsoletas
- Análisis de headers HTTP
- Detección de backdoors conocidas
- Identificación de archivos de configuración

Opciones de tuning:
1. Ataques de archivo
2. Misconfiguraciones
3. Información y divulgación
4. Inyección XSS
5. Inyección SQL
6. Inyección de comandos
7. Problemas de autenticación
8. Problemas de autorización
9. Evasión de IDS
{{% /note %}}

---

### Plugins de Navegador

Herramientas esenciales:
- Wappalyzer
- BuiltWith
- FoxyProxy
- User-Agent Switcher
- Web Developer

{{% note %}}
Los plugins de navegador son herramientas valiosas para reconocimiento web:

Wappalyzer:
- Identifica tecnologías web
- Frameworks y librerías
- Servidores web y CMS
- Análisis de JavaScript
- Herramientas de análisis

BuiltWith:
- Detalles de tecnología
- Historial de cambios
- Información de hosting
- Certificados SSL
- Integración con servicios

Otras herramientas útiles:
- Cookie Editors
- Security Headers
- CORS analyzers
- Cache viewers
- Network analyzers

Ventajas:
- Interfaz gráfica intuitiva
- Análisis en tiempo real
- No requieren configuración
- Integración con el flujo de trabajo
- Actualizaciones frecuentes
{{% /note %}}

---

### Gobuster: Enumeración Web

Modos principales:
```bash
# Modo dir (directorios)
gobuster dir -u http://target.com -w wordlist.txt

# Modo dns (subdominios)
gobuster dns -d target.com -w wordlist.txt

# Modo vhost (hosts virtuales)
gobuster vhost -u http://target.com -w wordlist.txt
```

{{% note %}}
Gobuster es una herramienta moderna para enumeración web:

Características principales:
- Múltiples modos de operación
- Alto rendimiento (Go)
- Soporte para patrones
- Manejo de wildcard
- Personalización de solicitudes

Modos de operación:
- dir: Búsqueda de directorios y archivos
- dns: Enumeración de subdominios
- vhost: Descubrimiento de hosts virtuales
- fuzz: Fuzzing de parámetros
- ext: Extensiones específicas

Optimización:
- Threads ajustables
- Timeouts configurables
- Filtrado de respuestas
- Manejo de cookies
- Seguimiento de redirecciones

Wordlists recomendadas:
- SecLists
- dirb
- dirbuster
- wfuzz
- custom lists
{{% /note %}}

---

### ¿Preguntas?

{{% note %}}
Conceptos clave revisados:
- Uso eficiente de Nmap
- Análisis de resultados por protocolo
- Identificación de sistemas
- Enumeración web
- Herramientas especializadas

Recordar:
- La enumeración activa debe ser autorizada
- Documentar todos los hallazgos
- Mantener un enfoque sistemático
- Validar resultados
{{% /note %}}