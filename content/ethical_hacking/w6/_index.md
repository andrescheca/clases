+++
title = "OWASP Top 10 2021 (Items 6-10)"
outputs = ["Reveal"]
+++

## OWASP Top 10 2021 (Items 6-10)
### Vulnerabilidades Web y Prácticas con WebGoat/DVWA

---

### El plan para hoy

- Vulnerable and Outdated Components (A06)
- Identification and Authentication Failures (A07)
- Software and Data Integrity Failures (A08)
- Security Logging and Monitoring Failures (A09)
- Server-Side Request Forgery (A10)
- Práctica con WebGoat
- Instalación y configuración de DVWA
- Ejercicios prácticos

{{% note %}}
En esta sesión abordaremos:
- Las últimas 5 vulnerabilidades del OWASP Top 10 2021
- Ejercicios prácticos en WebGoat para cada vulnerabilidad
- Configuración de un nuevo entorno de pruebas (DVWA)
- Casos reales y ejemplos de explotación
- Técnicas de mitigación y mejores prácticas

Es importante mantener un enfoque práctico y entender cómo estas vulnerabilidades afectan a aplicaciones reales.
{{% /note %}}

---

{{% section %}}

### A06: Vulnerable and Outdated Components

Principales problemas:
- Dependencias desactualizadas
- Vulnerabilidades conocidas
- Falta de parcheo
- Technical debt
- Configuraciones inseguras

```bash
# Ejemplo de análisis de dependencias
npm audit
composer audit
```

{{% note %}}
Los componentes vulnerables son un problema crítico:

Causas comunes:
- Falta de inventario de componentes
- Desconocimiento de versiones
- Ausencia de proceso de actualización
- Dependencias transitivas
- Legacy systems

Impacto potencial:
- RCE en componentes antiguos
- Inyecciones por librerías vulnerables
- Pérdida de datos
- Compromiso del sistema
- Backdoors en componentes maliciosos

Mejores prácticas:
1. Inventario actualizado de componentes
2. Monitoreo de CVEs
3. Actualizaciones automáticas cuando sea posible
4. Análisis de dependencias en CI/CD
5. Políticas de fin de vida (EOL)
{{% /note %}}

---

### WebGoat: Vulnerable Components

Ejercicio práctico:
```json
{
  "name": "my-web-app",
  "version": "1.0.0",
  "dependencies": {
    "lodash": "4.17.15",
    "express": "4.16.1",
    "node-fetch": "2.6.0",
    "jquery": "3.4.1"
  }
}
```

---

### Aplicación que usa el código

```javascript
const express = require('express');
const fetch = require('node-fetch');
const _ = require('lodash');
const app = express();

// Vulnerable a prototype pollution via lodash merge
app.post('/merge', express.json(), (req, res) => {
    const merged = _.merge({}, req.body);
    res.json(merged);
});

// Vulnerable a SSRF via node-fetch
app.get('/proxy', async (req, res) => {
    const url = req.query.url;
    const response = await fetch(url);
    const data = await response.text();
    res.send(data);
});

// Vulnerable a ReDoS via express
app.get('/search/:pattern', (req, res) => {
    const regex = new RegExp(req.params.pattern);
    // ... búsqueda usando regex inseguro
});

// XSS via jQuery en el frontend
app.get('/', (req, res) => {
    res.send(`
        <script src="/jquery.min.js"></script>
        <script>
            // Vulnerable a XSS en jQuery < 3.5.0
            $(document).ready(function() {
                $('#content').html(location.hash.slice(1));
            });
        </script>
        <div id="content"></div>
    `);
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});
```

--- 

Herramientas de análisis:
- OWASP Dependency Check
- Snyk
- WhiteSource
- GitHub Dependabot

{{% note %}}
En WebGoat practicaremos:

1. Identificación de componentes:
   - Análisis de manifiestos (package.json, pom.xml)
   - Detección de versiones
   - Búsqueda de CVEs conocidos

2. Explotación:
   - CVE-2017-5638 (Struts2)
   - Deserialization vulnerabilities
   - Known exploits en componentes antiguos

3. Mitigación:
   - Actualización de componentes
   - Verificación de firmas
   - Monitoreo continuo
   - Política de actualizaciones
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A07: Identification and Authentication Failures

Problemas comunes:
- Credenciales débiles
- Brute force permitido
- Session fixation
- Missing MFA
- Tokens expuestos

```python
# Ejemplo de autenticación débil
def login(username, password):
    user = find_user(username)
    if user and user.password == password:  # Comparación en texto plano
        session['user_id'] = user.id        # Sin rotación de sesión
        return True                         
    return False                            # Sin rate limiting
```

{{% note %}}
Las fallas de autenticación son críticas:

Vectores comunes:
1. Credential stuffing
2. Password spraying
3. Session hijacking
4. Token theft
5. Bypass de autenticación

Impacto:
- Acceso no autorizado
- Robo de identidad
- Escalación de privilegios
- Compromiso de cuentas
- Pérdida de datos

Mitigación:
1. Implementar MFA
2. Políticas de contraseñas fuertes
3. Rate limiting
4. Gestión segura de sesiones
5. Monitoreo de actividad sospechosa
{{% /note %}}

---

### WebGoat: Authentication Failures

Ejercicios:
1. Password reset flaws
2. JWT vulnerabilities
3. Session management
4. OAuth misconfigurations

```javascript
// JWT vulnerable
const token = jwt.sign(
  { user: 'admin' },
  'secret',
  { algorithm: 'none' }
);
```

{{% note %}}
Prácticas en WebGoat:

1. Password Reset:
   - Host header injection
   - Preguntas secretas débiles
   - Token prediction
   - Email spoofing

2. JWT:
   - None algorithm
   - Weak secrets
   - Missing signature validation
   - Token replay

3. Session:
   - Session fixation
   - Cookie theft
   - CSRF tokens
   - Timeout handling

4. OAuth:
   - Redirect_uri validation
   - State parameter
   - Token handling
   - Scope validation
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A08: Software and Data Integrity Failures

Áreas críticas:
- CI/CD security
- Dependency chain
- Auto-updates
- Deserialization
- Data integrity

```python
# Deserialization insegura
import pickle
data = pickle.loads(user_input)  # Peligroso!
```

{{% note %}}
La integridad del software y datos es fundamental:

Vectores de ataque:
1. Compromiso de CI/CD
2. Supply chain attacks
3. Malicious dependencies
4. Insecure deserialization
5. Unsigned updates

Impacto:
- Ejecución de código malicioso
- Modificación de binarios
- Compromiso de producción
- Pérdida de integridad
- Backdoors persistentes

Mitigación:
1. Firmas digitales
2. Verificación de integridad
3. Secure build pipelines
4. Dependency verification
5. Update authentication
{{% /note %}}

---

### WebGoat: Integrity Failures

Ejercicios prácticos:
1. Insecure deserialization
2. Upload validation bypass
3. Checksum verification
4. Update mechanism abuse

{{% note %}}
En WebGoat exploraremos:

1. Deserialization:
   - Java ObjectInputStream
   - PHP unserialize
   - YAML parsing
   - XML external entities

2. File Uploads:
   - Type verification
   - Content validation
   - Metadata checking
   - Anti-virus evasion

3. Updates:
   - Version checking
   - Signature verification
   - Download security
   - Rollback mechanisms
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A09: Security Logging and Monitoring Failures

Aspectos clave:
- Auditable events
- Log integrity
- Alert thresholds
- Incident detection
- Response time

```python
# Logging insuficiente
def login(user, pwd):
    if authenticate(user, pwd):
        return True
    return False
    # Sin logging de intentos fallidos!
```

{{% note %}}
Logging y monitoreo son cruciales:

Eventos críticos a registrar:
1. Intentos de autenticación
2. Cambios de privilegios
3. Acceso a datos sensibles
4. Modificaciones de sistema
5. Errores de seguridad

Componentes de monitoreo:
- SIEM systems
- Log aggregation
- Alert correlation
- Incident response
- Forensic readiness

Mejores prácticas:
1. Centralización de logs
2. Protección de integridad
3. Retención adecuada
4. Análisis en tiempo real
5. Respuesta automatizada
{{% /note %}}

---

### WebGoat: Logging Exercises

Prácticas:
1. Log injection
2. Log forging
3. Audit trails
4. Alert thresholds

```sql
-- Log injection
admin'); DROP TABLE logs;--
```

{{% note %}}
Ejercicios prácticos:

1. Log Injection:
   - CRLF injection
   - SQL injection en logs
   - Log forging
   - Log poisoning

2. Monitoreo:
   - Detección de patrones
   - Correlación de eventos
   - Umbrales de alerta
   - Falsos positivos

3. Análisis:
   - Forensic analysis
   - Timeline reconstruction
   - Attack detection
   - Incident response
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A10: Server-Side Request Forgery (SSRF)

Vectores comunes:
- URL parameters
- File imports
- API calls
- Webhooks
- Resource loading

```python
# SSRF vulnerable
def get_data(url):
    return requests.get(url).text
```

{{% note %}}
SSRF es una vulnerabilidad crítica:

Tipos de SSRF:
1. Basic SSRF
2. Blind SSRF
3. Semi-blind SSRF
4. Time-based SSRF
5. DNS-based SSRF

Objetivos comunes:
- Cloud metadata
- Internal services
- Admin interfaces
- Restricted APIs
- Local files

Mitigación:
1. Validación de URL
2. Whitelisting
3. DNS resolution control
4. Request timeouts
5. Response filtering
{{% /note %}}

---

### WebGoat: SSRF Exercises

Escenarios prácticos:
1. Basic SSRF
2. Cloud metadata access
3. Internal port scanning
4. File URL attacks

```bash
# Ejemplo de payload SSRF
http://internal-service/
file:///etc/passwd
dict://attacker:11211/
```

{{% note %}}
Ejercicios en WebGoat:

1. Basic SSRF:
   - URL manipulation
   - Protocol switches
   - Redirect following
   - IP restrictions bypass

2. Advanced SSRF:
   - Cloud metadata access
   - Service discovery
   - Filter bypass
   - Blind exploitation

3. Mitigación:
   - URL parsing
   - Domain validation
   - Protocol restrictions
   - Response handling
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Instalación de DVWA

Crear archivo `compose.yml`:
```yaml
version: '3'
services:
  dvwa:
    image: vulnerables/web-dvwa:latest
    ports:
      - "8080:80"
    environment:
      - MYSQL_USER=dvwa
      - MYSQL_PASSWORD=p@ssw0rd
      - MYSQL_DATABASE=dvwa
    volumes:
      - dvwa_data:/var/lib/mysql
    restart: unless-stopped

volumes:
  dvwa_data:
```

Comandos para ejecutar:
```bash
# Iniciar DVWA
docker compose up -d

# Verificar estado
docker compose ps

# Ver logs
docker compose logs -f

# Detener DVWA
docker compose down
```

{{% note %}}
Configuración de DVWA:

1. Requisitos:
   - Docker instalado
   - Docker Compose
   - Puerto 8080 disponible
   - Navegador web
   - Burp Suite (opcional)

2. Configuración inicial:
   - Usuario por defecto: admin
   - Password por defecto: password
   - Base de datos: MySQL
   - Security level: low

3. Verificación:
   - Test de conexión DB
   - Configuración PHP
   - Permisos de escritura
   - Funcionalidad reCAPTCHA

4. Troubleshooting común:
   - Problemas de permisos
   - Conexión a base de datos
   - Configuración PHP
   - Acceso a archivos
{{% /note %}}

---

### Ejercicio: DVWA Security Level Low

Objetivos:
1. Login bypass
2. SQL Injection
3. XSS reflected
4. Command injection
5. File upload

{{% note %}}
Ejercicio práctico en clase:

1. Configuración:
   - Establecer nivel "Low"
   - Preparar Burp Suite
   - Configurar navegador
   - Documentar hallazgos

2. Exploración:
   - Identificar vulnerabilidades
   - Probar vectores básicos
   - Documentar resultados
   - Compartir hallazgos

3. Metodología:
   - Análisis sistemático
   - Pruebas controladas
   - Documentación clara
   - Discusión grupal

4. Evaluación:
   - Éxito en ejercicios
   - Comprensión de conceptos
   - Técnicas utilizadas
   - Lecciones aprendidas
{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?