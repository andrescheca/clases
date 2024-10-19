+++
title = "Introducción a Kali Linux y Comandos Básicos para Computación Forense"
outputs = ["Reveal"]
+++

## Ethical Hacking
### Conceptos introductorios al Hacking Ético

---

### El plan para hoy

- Fundamentos de seguridad
- Metodologías de hacking ético
- Ética y responsabilidad
- Áreas del hacking ético
- Certificaciones y recursos de aprendizaje

---

### ¿Qué tienen en común?

- Equifax (2017)
- Yahoo! (2012)
- Sony (2011)
- Solarwinds (2020)

{{% note %}}
[Nota original sobre Equifax]
{{% /note %}}

---

### Todo comienza con CIA

- Confidencialidad
- Integridad
- Disponibilidad

{{% note %}}
[Nota original sobre CIA]
{{% /note %}}

---

### Desbalance en la tríada de CIA

- Divulgación
- Alteración
- Disrupción

{{% note %}}
[Nota original sobre desbalance en CIA]
{{% /note %}}

---

### Elementos de apoyo a la tríada de CIA

- No repudio
- Autenticidad

{{% note %}}
[Nota original sobre elementos de apoyo]
{{% /note %}}

---

### Metodología de hacking

1. Footprinting
2. Escaneo
3. Enumeración
4. Hackeo del sistema
5. Escalamiento de privilegios
6. Cubrimiento de rastros
7. Plantación de puertas traseras

{{% note %}}
[Nota original sobre metodología de hacking]
{{% /note %}}

---

### Elementos del riesgo

{{< imgref src="images/2024/10/elementos_analisis_riesgo.png" alt="Elementos del análisis de riesgo" style="width: 70%; height: 70%; margin: 0 auto">}}

{{% note %}}
[Nota original sobre elementos del riesgo]
{{% /note %}}

---

### Probabilidad e impacto

{{< imgref src="images/2024/10/gestion_riesgos.png" alt="Gestión de riesgos" style="width: 70%; height: 70%; margin: 0 auto">}}

{{% note %}}
[Nota original sobre probabilidad e impacto]
{{% /note %}}

---

### Hacker Ético vs Hacker No Ético

Un hacker ético opera dentro de un código de ética, mientras que un ciberdelincuente actúa sin restricciones éticas.

{{% note %}}
[Nota original sobre hacker ético vs no ético]
{{% /note %}}

---

### Tipos de Hackers

- Script Kiddies
- Suicide Hackers
- Hacktivist
- CyberTerrorist
- State/Nation Sponsored Hacker

{{% note %}}
[Nota original sobre tipos de hackers]
{{% /note %}}

---

### Ética en el Hacking

- Permiso explícito
- Alcance definido
- Reporte responsable
- Confidencialidad
- No explotar hallazgos

{{% note %}}
La ética es fundamental en el hacking ético. Algunos puntos clave:
- Siempre se debe tener permiso explícito antes de realizar cualquier prueba.
- El alcance de las pruebas debe estar claramente definido y respetado.
- Los hallazgos deben reportarse de manera responsable al cliente o la organización.
- La confidencialidad de la información obtenida es crucial.
- Nunca se deben explotar las vulnerabilidades encontradas para beneficio personal.
{{% /note %}}

---

### La puerta abierta no es una invitación

"No porque la puerta esté abierta significa que puedo entrar"

{{% note %}}
Esta frase resume un principio ético importante en el hacking:
- Una vulnerabilidad descubierta no es una invitación para explorarla sin autorización.
- La analogía de la puerta abierta ilustra que, incluso si un sistema parece accesible, no es ético ni legal entrar sin permiso.
- La integridad profesional implica respetar los límites y actuar solo dentro del alcance autorizado.
{{% /note %}}

---

### Áreas del Hacking Ético

- Network Pentesting
- Web Pentesting
- Reversing
- Exploit Development
- Malware Analysis
- Mobile Security
- IoT Security

{{% note %}}
El hacking ético abarca diversas áreas especializadas:
- Network Pentesting: Pruebas de seguridad en redes y sistemas.
- Web Pentesting: Evaluación de seguridad en aplicaciones web.
- Reversing: Análisis de software para entender su funcionamiento interno.
- Exploit Development: Creación de exploits para probar vulnerabilidades.
- Malware Analysis: Estudio de software malicioso para entender su comportamiento.
- Mobile Security: Seguridad en dispositivos y aplicaciones móviles.
- IoT Security: Seguridad en dispositivos del Internet de las Cosas.
{{% /note %}}

---

### Más allá de lo técnico

- OSINT (Open Source Intelligence)
- Ingeniería Social
- Técnicas de OPSEC (Operational Security)
- Lockpicking

{{% note %}}
El hacking ético no se limita a aspectos técnicos:
- OSINT: Recopilación de información de fuentes públicas.
- Ingeniería Social: Manipulación psicológica para obtener información.
- OPSEC: Prácticas para proteger información sensible.
Estas áreas son cruciales para una evaluación de seguridad completa.
{{% /note %}}

---

### Pre-requisitos ideales

- Conocimientos básicos de redes
- Familiaridad con sistemas Linux
- Comprensión de sistemas Windows
- Nociones de programación

{{% note %}}
Para iniciarse en el hacking ético, es recomendable tener:
- Conocimientos de redes: Protocolos, arquitecturas, configuraciones.
- Linux: Manejo de línea de comandos, distribuciones comunes.
- Windows: Administración básica, servicios, registros.
- Programación: Conceptos básicos, scripting, al menos un lenguaje.
Estos conocimientos proporcionan una base sólida para adentrarse en el campo.
{{% /note %}}

---

### Recursos de aprendizaje

- OffSec Certified Professional (OSCP)
- CompTIA Security+ o Pentest+
- Certified Information Systems Security Professional (CISSP)
- Plataformas de práctica: TryHackMe, HackTheBox
- Cursos en línea: Coursera, edX, Udemy

{{% note %}}
[Nota original sobre recursos de aprendizaje, ampliada con las plataformas de práctica y cursos en línea]
{{% /note %}}

---

### Muchos Nombres, Pero el Trabajo es Similar

- Ethical Hacking
- Vulnerability Assessment
- Pentesting
- Red Team Assessment

{{% note %}}

- Ethical Hacking: Término general que abarca la práctica de buscar vulnerabilidades de seguridad con permiso.
- Vulnerability Assessment: Se enfoca en identificar y clasificar vulnerabilidades en un sistema, pero generalmente no incluye la explotación de estas.
- Pentesting (Pruebas de Penetración): Va un paso más allá de la evaluación de vulnerabilidades, incluyendo la explotación controlada de vulnerabilidades para demostrar el impacto potencial.
- Red Team Assessment: Simula ataques del mundo real de manera más completa, a menudo incluyendo ingeniería social y otros métodos para probar la seguridad integral de una organización.

Es importante destacar que aunque estos términos tienen diferencias sutiles, todos comparten el objetivo común de mejorar la seguridad de los sistemas y organizaciones. La elección del término a menudo depende del contexto específico, el alcance del trabajo y las preferencias del cliente o la industria.
{{% /note %}}

---

### Consideraciones legales

- Marco legal del hacking ético
- Acuerdos de confidencialidad (NDAs)
- Limitaciones jurisdiccionales
- Responsabilidad legal

{{% note %}}
Es crucial entender el marco legal:
- Las leyes varían según el país y la jurisdicción.
- Siempre se deben firmar acuerdos de confidencialidad.
- Hay que tener en cuenta las limitaciones jurisdiccionales en pruebas remotas.
- El hacker ético puede ser responsable legalmente por acciones no autorizadas.
{{% /note %}}

---

### ¿Preguntas?