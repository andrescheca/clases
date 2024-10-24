+++
title = "Programación Orientada a Objetos - Semana 1"
outputs = ["Reveal"]
+++

### El plan para hoy

- ¿Qué es la Programación Orientada a Objetos?
- Transición desde la programación estructurada
- Introducción a Java
- Preparación del entorno de desarrollo
- Primer programa en Java

---

### ¿Qué necesitamos saber para esta materia?

- Programación estructurada
- Idealmente un lenguaje con sintaxis basada en C
- Conceptos básicos de Python son suficientes

{{% note %}}
Puntos clave para discutir:
- Muchos vienen de Python?
- Conceptos fundamentales son transferibles
- La sintaxis diferente no debe ser intimidante
- Conceptos que ya conocen:
  * Variables y tipos de datos
  * Estructuras de control (if, while, for)
  * Funciones
{{% /note %}}

---

### De Python a Java: ¿Qué cambia?

```python
# Python
def saludar(nombre):
    print(f"Hola {nombre}")

saludar("Ana")
```

```java
// Java
public class Saludos {
    public static void main(String[] args) {
        saludar("Ana");
    }
    
    public static void saludar(String nombre) {
        System.out.println("Hola " + nombre);
    }
}
```

{{% note %}}
Principales diferencias:
- Tipado estático vs dinámico
- Tipado fuerte y debil (strongly and weakly typed)
- Estructura más formal en Java
- La necesidad de clases
- Punto de entrada main()
- System.out.println vs print
- Importancia de los tipos de datos
{{% /note %}}

---

### ¿Por qué Orientación a Objetos?

- Organización más natural del código
- Reutilización y mantenimiento más fácil
- Modelado del mundo real
- Encapsulamiento de datos

{{% note %}}
Usar ejemplos cotidianos:
- Un carro tiene propiedades (color, modelo) y comportamientos (arrancar, frenar)
- Una cuenta bancaria tiene atributos (saldo) y operaciones (depositar, retirar)
- Enfatizar cómo esto se relaciona con el mundo real
- Mencionar cómo esto mejora la organización del código que ya escriben
{{% /note %}}

---

### ¿Qué es Java?

- Lenguaje de programación orientado a objetos
- Plataforma independiente y versátil
- Utilizado en aplicaciones web, móviles, y sistemas empresariales
- "Write Once, Run Anywhere"

{{% note %}}
Contextualizar Java:
- Creado en 1995 por Sun Microsystems
- Por qué la independencia de plataforma es importante
- El concepto de la JVM
{{% /note %}}

---

### En todas partes hay Java

{{< imgref src="/images/2024/05/w1_001_devices_running_java.png" alt="Java en todas partes" class="img">}}

{{% note %}}
Ejemplos concretos:
- Minecraft está escrito en Java
- Android usa Java/Kotlin
- Muchos juegos y aplicaciones que usan
- Sistemas empresariales
- Versatilidad del lenguaje
{{% /note %}}

---

### Características de Java

- Orientado a Objetos
- Independiente de la plataforma
- Robusto y seguro
- Multihilos
- Alto rendimiento

{{% note %}}
Profundizar en cada característica:
- OO: Todo es un objeto (excepto tipos primitivos)
- Plataforma: Explicar JVM brevemente
- Robusto: Sistema de tipos fuerte, manejo de excepciones
- Multihilos: Mencionar pero no profundizar aún
- Comparar con Python cuando sea relevante
{{% /note %}}

--- 

### Nuestro primer programa

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola Mundo!");
    }
}
```

{{% note %}}
Analizar cada parte del código:
- public class: Concepto de clase
- main method: Punto de entrada
- System.out.println: Salida estándar
- Comparar con el equivalente en Python
- Mencionar la importancia de las llaves y punto y coma
{{% /note %}}

---

### ¿Qué hace falta para comenzar?

- Java Development Kit (JDK)
- Un entorno de desarrollo (IDE)
  * IntelliJ IDEA (recomendado)
  * Eclipse
  * NetBeans

{{% note %}}
Guiar en la instalación:
- Explicar la diferencia entre JDK y JRE
- Por qué usar un IDE es importante
- Ventajas de IntelliJ para principiantes
- Mencionar que la licencia educativa es gratuita
{{% /note %}}

---

### Instalemos IntelliJ y el JDK

- [JDK](https://www.oracle.com/java/technologies/downloads/)
- [Solicitar acceso gratuito a IntelliJ](https://www.jetbrains.com/community/education/)
- [Descarga de IntelliJ](https://www.jetbrains.com/idea/download/?section=mac)

{{% note %}}
Pasos de instalación:
- Demostrar la descarga del JDK
- Proceso de solicitud de licencia educativa
- Instalación paso a paso de IntelliJ
- Verificación de la instalación
- Problemas comunes y soluciones
{{% /note %}}

---

### JShell: Tu Mejor Amigo para Aprender Java

```bash
$ jshell
jshell> int x = 42
x ==> 42
jshell> System.out.println("El valor es: " + x)
El valor es: 42
```

{{% note %}}
Diferencias clave con el REPL de Python:

No se necesita print() para ver resultados de expresiones
Las declaraciones de tipos son obligatorias
El prompt jshell> indica que estamos en modo JShell
Autocompletado con Tab funciona diferente
Los errores muestran más información de tipos


Comandos útiles de JShell:

/help - muestra ayuda general
/list - muestra el código ingresado
/vars - lista las variables definidas
/methods - muestra los métodos definidos
/imports - muestra los imports activos
/reset - reinicia el estado de JShell
/exit - sale de JShell
/save archivo.jsh - guarda la sesión
/open archivo.jsh - carga una sesión guardada
{{% /note %}}

---

### Para la próxima clase...

- Tener instalado el JDK y IntelliJ
- Crear y ejecutar el programa "Hola Mundo"
- Repasar conceptos básicos de programación
- Leer sobre clases y objetos

---

### ¿Preguntas?

--- 

[Regresar al listado de semanas]({{< ref "/poo/_index.md#/weekly-content" >}})