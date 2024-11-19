+++
title = "OWASP Top 10: Vulnerabilidades Web Críticas (Parte 1)"
outputs = ["Reveal"]
+++

## OWASP Top 10 (2021)
### Vulnerabilidades Web Críticas
### Parte 1: A01-A05

---

### El plan para hoy

- Introducción a OWASP Top 10
- WebGoat como plataforma de práctica
- A01: Pérdida de Control de Acceso
- A02: Fallos Criptográficos
- A03: Inyección
- A04: Diseño Inseguro
- A05: Configuración de Seguridad Incorrecta
- Ejercicios prácticos con WebGoat

{{% note %}}
OWASP Top 10 es el estándar de facto para la seguridad de aplicaciones web:
- Actualizado en 2021
- Basado en datos de más de 500,000 aplicaciones
- Refleja las amenazas más críticas actuales
- Proporciona marco de referencia para testing
- Guía para desarrollo seguro

WebGoat es una aplicación web deliberadamente insegura:
- Entorno controlado para práctica
- Ejercicios interactivos
- Explicaciones detalladas
- Progreso medible
- Completamente containerizado
{{% /note %}}

---

{{% section %}}

### Configuración del Laboratorio

Requisitos previos:
- Docker instalado
- Docker Compose instalado
- Puertos 8080 y 9090 disponibles
- ~2GB de espacio libre

{{% note %}}
Antes de comenzar la configuración:

Verificación de requisitos:
1. Docker
   - Versión 20.10.0 o superior recomendada
   - Servicio activo y funcionando
   - Usuario con permisos adecuados

2. Recursos del sistema:
   - Mínimo 4GB RAM disponible
   - 2GB espacio en disco
   - CPU dual core o superior
   
3. Networking:
   - Puertos locales libres
   - Conectividad a Internet
   - Firewall configurado
{{% /note %}}

---

### Archivo de Configuración

```yaml
# docker-compose.yml
version: '3.8'
services:
  webgoat:
    container_name: webgoat
    image: webgoat/webgoat
    ports:
      - "8080:8080"
      - "9090:9090"
    volumes:
      - ./webgoat_data:/home/webgoat/.webgoat
```

{{% note %}}
El archivo docker-compose.yml define la infraestructura:

Componentes principales:
1. Container webgoat:
   - Imagen oficial
   - Puertos mapeados localmente
   - Volumen para persistencia
   
2. Volumen persistente:
   - Almacena progreso
   - Configuraciones
   - Datos de usuario

3. Network:
   - Binding solo a localhost
   - Puertos específicos
   - Aislamiento de red
{{% /note %}}


---

### Despliegue y Acceso

Pasos de instalación:
```bash
# 1. Crear directorio y archivo
mkdir webgoat-lab && cd webgoat-lab
nano docker-compose.yml   # Pegar configuración

# 2. Iniciar servicios
docker-compose up -d

# 3. Verificar estado
docker-compose ps
```

Acceso a las aplicaciones:
- WebGoat: http://localhost:8080/WebGoat
- WebWolf: http://localhost:9090/WebWolf

{{% note %}}
Proceso de despliegue paso a paso:

Comandos importantes:
```bash
# Ver logs en tiempo real
docker-compose logs -f

# Detener el laboratorio
docker-compose down

# Reiniciar servicios
docker-compose restart

# Eliminar todo
docker-compose down -v
```

Troubleshooting común:
1. Error de puertos:
   - Verificar puertos en uso
   - Cambiar mapping si necesario
   
2. Problemas de acceso:
   - Confirmar estado del contenedor
   - Revisar logs
   - Verificar firewall

3. Persistencia:
   - Comprobar permisos
   - Verificar volumen
   - Backup si necesario
{{% /note %}}


---

### Estructura de Lecciones

Cada vulnerabilidad incluye:
- Explicación teórica
- Ejemplos prácticos
- Ejercicios guiados
- Soluciones detalladas
- Referencias adicionales

{{% note %}}
Las lecciones de WebGoat siguen una estructura consistente:

Componentes:
- Introducción teórica
- Escenarios del mundo real
- Ejercicios interactivos
- Pistas y ayudas
- Validación automática

Metodología:
1. Leer material teórico
2. Entender el escenario
3. Intentar resolver sin ayuda
4. Usar pistas si es necesario
5. Verificar solución
6. Revisar explicación

Mejores prácticas:
- Tomar notas detalladas
- Experimentar con variaciones
- Documentar hallazgos
- Relacionar con casos reales
- Discutir con compañeros
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A01: Pérdida de Control de Acceso

Tipos principales:
- IDOR (Insecure Direct Object References)
- Elevación de privilegios
- Bypass de autenticación
- Manipulación de URLs
- CORS mal configurado

{{% note %}}
La pérdida de control de acceso es la vulnerabilidad #1 en 2021:

Impacto potencial:
- Acceso a datos de otros usuarios
- Modificación no autorizada
- Escalación de privilegios
- Bypass de restricciones
- Fuga de información sensible

Causas comunes:
1. Falta de verificaciones en backend
2. Dependencia de valores cliente
3. Configuración CORS incorrecta
4. Tokens predecibles
5. Fuerza bruta permitida

Medidas de prevención:
- Denegar por defecto
- Implementar RBAC
- Verificar permisos en cada request
- Usar tokens seguros
- Validar en backend

En WebGoat:
- Módulo "Access Control Flaws"
- Ejercicios IDOR
- Pruebas de bypass
- Manipulación de tokens
- Escalación vertical/horizontal
{{% /note %}}

---

### Ejercicio: IDOR en WebGoat

```http
# Request original
GET /WebGoat/users/details/1234

# Modificación para IDOR
GET /WebGoat/users/details/1235

# Verificar respuesta
{
  "userId": 1235,
  "username": "otro_usuario",
  "email": "privado@ejemplo.com"
}
```

{{% note %}}
El ejercicio de IDOR demuestra un fallo común:

Proceso de explotación:
1. Identificar patrón de IDs
2. Interceptar request legítimo
3. Modificar valores sistemáticamente
4. Observar respuestas
5. Documentar hallazgos

Indicadores de vulnerabilidad:
- IDs secuenciales
- Respuestas detalladas
- Falta de verificación
- Acceso a otros perfiles
- Datos sensibles expuestos

Impacto en aplicaciones reales:
- Fuga de PII
- Acceso no autorizado
- Modificación de datos
- Privacidad comprometida
- Cumplimiento afectado

WebGoat incluye:
- Múltiples ejercicios IDOR
- Diferentes tipos de referencias
- Validación automática
- Explicaciones detalladas
- Guías de mitigación
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A02: Fallos Criptográficos

Problemas comunes:
- Datos sensibles en texto plano
- Algoritmos débiles/obsoletos
- Claves hardcodeadas
- Certificados inválidos
- Generación débil de claves

{{% note %}}
Los fallos criptográficos exponen datos sensibles:

Escenarios comunes:
1. Almacenamiento inseguro de contraseñas
2. Transmisión sin cifrar
3. Uso de algoritmos débiles
4. Gestión inadecuada de claves
5. Certificados autofirmados

Impacto:
- Robo de credenciales
- Intercepción de datos
- Suplantación de identidad
- Compromiso de sesiones
- Violaciones de privacidad

Mejores prácticas:
- Usar algoritmos actuales
- Implementar TLS 1.3
- Salt único por usuario
- Funciones de derivación seguras
- Rotación regular de claves

WebGoat proporciona:
- Ejercicios de cifrado
- Análisis de hashes
- Ataques prácticos
- Ejemplos de implementación
- Guías de fortalecimiento
{{% /note %}}

---

### Ejercicio: Hashing en WebGoat

```python
# Ejemplo de hash inseguro (MD5)
md5("password123") = "482c811da5d5b4bc6d497ffa98491e38"

# Hash seguro con salt (bcrypt)
bcrypt("password123", salt) = "$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LcdYaM.ZK.4K3W"
```

{{% note %}}
La práctica de hashing es fundamental:

Comparación de algoritmos:
- MD5: Obsoleto, colisiones
- SHA1: Vulnerable, no recomendado
- SHA256: Mejor, pero sin salt
- bcrypt: Diseñado para passwords
- Argon2: Estado del arte

Características de hash seguro:
1. Función unidireccional
2. Resistente a colisiones
3. Efecto avalancha
4. Computacionalmente intensivo
5. Salt único por entrada

WebGoat enseña:
- Diferencias entre algoritmos
- Importancia del salt
- Ataques de diccionario
- Rainbow tables
- Timing attacks

Ejercicios prácticos:
- Generación de hashes
- Cracking de passwords
- Implementación de salt
- Análisis de fortaleza
- Mitigaciones efectivas
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A03: Inyección

Tipos principales:
- SQL Injection
- Command Injection
- LDAP Injection
- XML Injection
- Template Injection

{{% note %}}
La inyección sigue siendo una amenaza crítica:

Vectores comunes:
1. Parámetros de URL
2. Campos de formulario
3. Headers HTTP
4. Cookies
5. Archivos subidos

Impacto potencial:
- Acceso no autorizado a BD
- Ejecución de comandos
- Bypass de autenticación
- Modificación de datos
- Compromiso del servidor

Prevención:
- Parametrización de queries
- Validación de entrada
- Escape de caracteres
- Principio de menor privilegio
- WAF actualizado

WebGoat ofrece:
- Módulo completo de SQL Injection
- Ejercicios de command injection
- Diferentes niveles de dificultad
- Técnicas de bypass
- Métodos de prevención
{{% /note %}}

---

### Ejercicio: SQL Injection

```sql
-- Query vulnerable
SELECT * FROM users WHERE username = '$user' AND password = '$pass'

-- Ataque básico
' OR '1'='1

-- Query resultante
SELECT * FROM users WHERE username = '' OR '1'='1' AND password = ''
```

{{% note %}}
SQL Injection es una vulnerabilidad crítica:

Tipos de SQLi:
1. In-band
   - Union based
   - Error based
2. Blind
   - Boolean based
   - Time based
3. Out-of-band
   - DNS
   - HTTP

Técnicas de explotación:
- Enumeración de columnas
- Extracción de datos
- Manipulación de queries
- Bypass de autenticación
- Ejecución de comandos

WebGoat incluye:
- Ejercicios progresivos
- Diferentes escenarios
- Técnicas avanzadas
- Herramientas útiles
- Métodos de prevención

Herramientas útiles:
- sqlmap
- Burp Suite
- DirBuster
- OWASP ZAP
- Wireshark
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A04: Diseño Inseguro

Problemas comunes:
- Falta de límites de uso
- Validación cliente-side
- Race conditions
- Flujos inseguros
- Exposición de información

{{% note %}}
El diseño inseguro representa fallos fundamentales:

Áreas críticas:
1. Control de acceso
2. Gestión de sesiones
3. Validación de datos
4. Manejo de errores
5. Arquitectura de seguridad

Patrones inseguros:
- Confianza en frontend
- Datos sensibles expuestos
- Falta de rate limiting
- Funciones sin autorización
- Logging inadecuado

Mejores prácticas:
- Threat modeling
- Principio de menor privilegio
- Defense in depth
- Fail secure
- Logging centralizado

WebGoat demuestra:
- Fallos de diseño comunes
- Escenarios realistas
- Impacto de decisiones
- Soluciones seguras
- Patrones recomendados
{{% /note %}}

---

### Ejercicio: Race Conditions

```javascript
// Código vulnerable
async function procesarCompra(userId, itemId) {
    let saldo = await getSaldo(userId);
    let precio = await getPrecio(itemId);
    
    if (saldo >= precio) {
        await realizarCompra(userId, itemId);
        await actualizarSaldo(userId, saldo - precio);
    }
}
```

{{% note %}}
Las race conditions son un ejemplo de diseño inseguro:

Causas comunes:
1. Operaciones no atómicas
2. Estado compartido
3. Falta de sincronización
4. Verificaciones temporales
5. Transacciones incompletas

Impacto potencial:
- Duplicación de operaciones
- Inconsistencia de datos
- Bypass de límites
- Pérdida de recursos
- Corrupción de estado

Prevención:
- Operaciones atómicas
- Bloqueos apropiados
- Transacciones ACID
- Idempotencia
- Verificación post-operación

WebGoat enseña:
- Identificación de races
- Explotación práctica
- Implementación segura
- Patrones de concurrencia
- Testing efectivo
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### A05: Configuración de Seguridad Incorrecta

Problemas típicos:
- Servicios innecesarios
- Cuentas por defecto
- Errores detallados
- HTTPS desactivado
- Headers faltantes

{{% note %}}
La configuración incorrecta es muy común:

Áreas problemáticas:
1. Servidores web
2. Frameworks
3. Bases de datos
4. Cloud services
5. Contenedores

Errores frecuentes:
- Puertos innecesarios
- Directorios listables
- Versiones obsoletas
- Permisos excesivos
- Credenciales débiles

Hardening básico:
- Eliminar servicios no usados
- Actualizar sistemas
- Configurar HTTPS
- Implementar headers seguros
- Restringir accesos

WebGoat incluye:
- Escaneo de configuración
- Análisis de headers
- Enumeración de servicios
- Detección de misconfigs
- Guías de hardening
{{% /note %}}

---

### Ejercicio: Headers de Seguridad

```http
# Headers recomendados
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Content-Security-Policy: default-src 'self'
X-XSS-Protection: 1; mode=block
```

{{% note %}}
Los headers HTTP son críticos para la seguridad:

Headers esenciales:
1. HSTS
   - Fuerza HTTPS
   - Previene downgrade
   - Incluye subdominios
   
2. CSP
   - Control de recursos
   - Prevención XSS
   - Reporting
   
3. X-Frame-Options
   - Previene clickjacking
   - Control de embedding
   - Opciones flexibles
   
4. Cache-Control
   - Datos sensibles
   - Privacidad
   - Performance

WebGoat permite:
- Análisis de headers en tiempo real
- Pruebas de bypass
- Configuración práctica
- Validación de políticas
- Ejemplos de explotación

Ejercicios prácticos:
- Identificar headers faltantes
- Implementar CSP efectiva
- Probar diferentes políticas
- Explotar misconfiguraciones
- Validar correcciones

Herramientas útiles:
- securityheaders.com
- SSL Labs
- Observatory by Mozilla
- CSP Evaluator
- OWASP ZAP
{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?

Recursos adicionales:
- owasp.org/Top10
- github.com/WebGoat/WebGoat
- portswigger.net/web-security