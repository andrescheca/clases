+++
title = "Conceptos introductorios al Hacking Ético"
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
Equifax CEO: «hubo un error humano al no aplicar un parche, y un
error técnico cuando el escáner no detectó que la vulnerabilidad
estaba pendiente de resolver». Sin embargo, de lo que hoy se sabe,
podemos observar algunos otros aspectos como: <ul> <li>Falta de
monitoreo de la integridad de los archivos.</li> <li>Falta de
segmentación de la red.</li> <li> No se logró identificar
oportunamente el ataque entre otras cosas por falta de visibilidad.
</li> <li> El reporte a las autoridades y a los clientes no fue
oportuno. </li> <li>Mal manejo organizacional de la crisis.</li> <li>
Falta de involucramiento de la alta dirección en temas de
ciberseguridad. </li> </ul>
{{% /note %}}

---

### Todo comienza con CIA

- Confidencialidad
- Integridad
- Disponibilidad

{{% note %}}
Un hacker ético intenta preservar lo que es conocido como la tríada
            de CIA: Confidencialidad, Integridad, y Disponibilidad.
            <p>
              Confidencialidad El principio básico que se refiere a la
              salvaguarda de la información y mantenerla alejada de aquellos no
              autorizados para poseerla. Ejemplos de controles que preservan la
              confidencialidad son permisos y encriptación.
            </p>
            <p>
              Integridad Trata de mantener la información en un formato que sea
              verdadero y correcto para sus propósitos originales, lo que
              significa que los datos a los que accede el receptor son los datos
              que el creador pretendía que tuvieran.
            </p>
            <p>
              Disponibilidad El último y posiblemente uno de los elementos más
              importantes que se debe mantener, la disponibilidad trata de
              mantener información y recursos disponibles para aquellos que
              necesitan usarlos. La información o los recursos, por muy seguros
              que estén, solo son útiles si están disponibles cuando se les
              llama.
            </p>
            Confidentiality:
            <p>
              No tengo nada que esconder?<br />
              ¿Cortinas en casa?<br />
              Hidden with asterisks, or encrypted<br />
              Hidden with steganography<br />
              States of data: at rest, in process, in transit<br />
            </p>
            <br />
            Integrity:
            <p>
              Un sistema médico puso una gota de más en la dosis System
              integrity: the software should perform as expected. (Buffer
              Overflows)<br />
              Data Integrity: Hashes, MACs, signatures<br />
            </p>
            <br />
            Availability:
            <p>
              Sistemas en tiempo real (aviones)<br />
              Sistemas médicos <br />
              SLAs.
            </p>
{{% /note %}}

---

### Desbalance en la tríada de CIA

- Divulgación
- Alteración
- Disrupción

{{% note %}}
Cualquier quiebre en la tríada de CIA puede resultar en
desequilibrio, donde se puede perder la Confidencialidad, Integridad,
o Disponibilidad de la información.
{{% /note %}}

---

### Elementos de apoyo a la tríada de CIA

- No repudio
- Autenticidad

{{% note %}}
 Además de la tríada de CIA, es importante considerar dos elementos
            de apoyo: no repudio y autenticidad.
            <p>
              Non-repudiation is the concept that once an action is carried out
              by a party it cannot be denied by that party. For example, by
              using techniques such as digital signatures it is possible to
              definitively say who sent a message without any possibility of
              denial that they were the originator of the message.
            </p>
            <p>
              Authenticity is the ability to state that an object such as a
              piece of data or message came from a legitimate and identifiable
              source. This is an important property for an item to have because
              it states that the source of an action is valid and known. Because
              the sender has signed their digital signature with their private
              key, the subsequent verification of the signature using their
              public key proves the sender's identity and thus authenticates the
              sender and the origin of the message.
            </p>
{{% /note %}}

---

### PTES - Estándar de Ejecución de Pruebas de Penetración

Penetration Testing Execution Standard

- Pre-compromiso (Pre-engagement)
- Recolección de Información (Intelligence Gathering)
- Modelado de Amenazas (Threat Modeling)
- Análisis de Vulnerabilidades (Vulnerability Analysis)
- Explotación (Exploitation)
- Post-Explotación (Post Exploitation)
- Reporte (Reporting)

{{% note %}}
El PTES es un estándar que define las fases de una prueba de penetración profesional:

- Pre-compromiso (Pre-engagement): Definición del alcance, reglas de compromiso, objetivos, tiempos y entregables del proyecto.

- Recolección de Información (Intelligence Gathering): Recopilación exhaustiva de información sobre el objetivo usando fuentes públicas y técnicas de reconocimiento activo/pasivo.

- Modelado de Amenazas (Threat Modeling): Identificación de activos valiosos, vectores de ataque, y priorización de esfuerzos basado en el análisis de riesgos.

- Análisis de Vulnerabilidades (Vulnerability Analysis): Descubrimiento y verificación de vulnerabilidades mediante escaneos, pruebas manuales y análisis de configuraciones.

- Explotación (Exploitation): Aprovechamiento de las vulnerabilidades encontradas para obtener acceso a los sistemas objetivo de manera controlada.

- Post-Explotación (Post Exploitation): Elevación de privilegios, movimiento lateral, persistencia y evaluación del impacto potencial del compromiso.

- Reporte (Reporting): Documentación detallada de hallazgos, metodología, impacto y recomendaciones de remediación.
{{% /note %}}

---

### Cyber Kill Chain (defensa)

- Reconocimiento (Reconnaissance)
- Armamento (Weaponization)
- Entrega (Delivery)
- Explotación (Exploitation) 
- Instalación (Installation)
- Comando y Control (Command & Control)
- Acciones sobre objetivos (Actions on Objectives)

{{% note %}}
La Cyber Kill Chain es un modelo que describe las fases típicas de un ciberataque:

- Reconocimiento (Reconnaissance): El atacante identifica y selecciona objetivos, recolectando información técnica y de la organización.

- Armamento (Weaponization): Creación de malware o exploit específico combinando un payload con un exploit que ataque una vulnerabilidad.

- Entrega (Delivery): Transmisión del "arma" (malware) al objetivo a través de email, USB, sitios web, etc.

- Explotación (Exploitation): El malware se activa, aprovechando la vulnerabilidad para ejecutar código en el sistema objetivo.

- Instalación (Installation): Instalación de una puerta trasera o malware persistente que permita mantener acceso.

- Comando y Control (Command & Control): El malware establece un canal de comunicación con servidores controlados por el atacante.

- Acciones sobre objetivos (Actions on Objectives): El atacante toma acciones para lograr sus objetivos como exfiltración de datos, destrucción o alteración de sistemas.
{{% /note %}}


---

### Elementos del riesgo

{{< imgref src="images/2024/10/elementos_analisis_riesgo.png" alt="Elementos del análisis de riesgo" style="width: 70%; height: 70%; margin: 0 auto">}}

---

### Probabilidad e impacto

{{< imgref src="images/2024/10/gestion_riesgos.png" alt="Gestión de riesgos" style="width: 70%; height: 70%; margin: 0 auto">}}

---

### ¿Ética en esta profesión?  

- La ética es práctica, no teórica
- Las habilidades son neutrales, su uso define la ética
- El marco ético se basa en:
  - Responsabilidad profesional
  - Reglas contractuales
  - Consecuencias de nuestras acciones
- La diferencia entre hacker ético y criminal está en las decisiones, no en las habilidades

{{% note %}}

- La ética en el hacking no es un tema filosófico abstracto, sino un conjunto de decisiones prácticas diarias.
- Las mismas habilidades técnicas pueden usarse para proteger o dañar - la ética guía esa decisión.
- La responsabilidad profesional incluye:
  * Actuar dentro del alcance autorizado
  * Proteger la información del cliente
  * Reportar hallazgos de manera responsable
  * Considerar el impacto de nuestras acciones
- Las reglas contractuales proporcionan un marco legal y ético claro.
- Un hacker ético necesita tanta o más habilidad que uno malicioso, la diferencia está en cómo usa ese conocimiento.
- Las consecuencias de nuestras acciones pueden afectar a personas reales, empresas y sistemas críticos.

La ética no limita nuestras capacidades técnicas, sino que nos da un marco para usarlas responsablemente.
{{% /note %}}

---

### Tipos de Threat Actors

- Script Kiddies
- Hacktivist
- CyberTerrorists
- Insider Threats
- State/Nation Sponsored Hacker

{{% note %}}
Los diferentes tipos de actores de amenaza tienen distintas motivaciones, capacidades y recursos:

- Script Kiddies: Atacantes novatos o inexpertos que utilizan herramientas y scripts desarrollados por otros sin entender completamente cómo funcionan. Sus motivaciones suelen ser la curiosidad, ego o simple vandalismo. Bajo nivel de habilidad pero pueden causar daño usando herramientas automatizadas.

- Hacktivist: Activistas que utilizan sus habilidades de hacking para promover una causa política o social. Sus tácticas comunes incluyen defacement de sitios web, DDoS y filtración de información. Ejemplos conocidos: Anonymous, LulzSec.

- CyberTerrorists: Actores que buscan causar daño significativo o terror a través de ataques cibernéticos, especialmente contra infraestructura crítica. Sus motivaciones son ideológicas o políticas, y buscan causar disrupciones masivas o pérdidas de vidas.

- Insider Threats: Empleados o ex-empleados con acceso legítimo a los sistemas. Pueden actuar por venganza, beneficio económico o ser manipulados por actores externos. Son especialmente peligrosos por su conocimiento interno y accesos privilegiados.

- State/Nation Sponsored Hacker: Hackers respaldados por gobiernos con recursos significativos y objetivos estratégicos. Realizan espionaje industrial, sabotaje y operaciones de influencia. Ejemplos: APT28 (Fancy Bear), APT29 (Cozy Bear). Son los actores más sofisticados y persistentes.

Importante recordar
- La sofisticación y recursos aumentan desde Script Kiddies hasta Nation-State
- Un mismo ataque puede tener diferentes impactos según quién lo ejecute
- Importante entender estos perfiles para priorizar defensas
- Las motivaciones ayudan a predecir objetivos probables
{{% /note %}}

---

### Ética en el Hacking

- Permiso explícito
- Alcance definido
- Reporte responsable
- Confidencialidad
- No explotar hallazgos (a menos que el cliente lo espere)

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
- Lockpicking (Physical Security)

{{% note %}}
El hacking ético no se limita a aspectos técnicos:
- OSINT: Recopilación de información de fuentes públicas.
- Ingeniería Social: Manipulación psicológica para obtener información.
- OPSEC: Prácticas para proteger información sensible.
Estas áreas son cruciales para una evaluación de seguridad completa.
{{% /note %}}

---

### The Security Mentality

- Cambio de paradigma
- Cuando somos programadores pensamos con lógica
- Como hackers tenemos que romper la lógica
- Identificar falencias en el sistema

> [Bruce Schneier](https://www.schneier.com/blog/archives/2008/03/the_security_mi_1.html)

---

### Pre-requisitos ideales

- Conocimientos básicos de redes
- Familiaridad con sistemas Linux
- Comprensión de sistemas Windows
- Nociones de programación

{{% note %}}
Para iniciarse en el hacking ético, es recomendable tener:
- Conocimientos de redes: Protocolos, arquitecturas, configuraciones. Puertos comunes. 
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

- Marco legal del hacking ético a veces únicamente el contrato
- Acuerdos de confidencialidad (NDAs)
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