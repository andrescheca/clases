+++
title = "Programación Orientada a Objetos - Semana 1"
outputs = ["Reveal"]
+++

### El plan para hoy

- ¿Qué es la Programación Orientada a Objetos?
- Transición desde la programación estructurada
- Introducción a Java
- Preparación del entorno de desarrollo
- Sintaxis básica de Java
- Variables y tipos de datos
- Operadores
- Estructuras de control
- Arrays
- Entrada/Salida básica
- Comentarios y documentación

{{% note %}}
Este plan cubre los conceptos fundamentales que se necesitan para empezar a programar en Java, enfocándonos primero en la sintaxis básica antes de entrar en conceptos de orientación a objetos. La idea es que los estudiantes se sientan cómodos con la sintaxis de Java como primer paso.
{{% /note %}}

---

### ¿Qué necesitamos saber para esta materia?

- Programación estructurada
- Idealmente un lenguaje con sintaxis basada en C
- Conceptos básicos de Python son suficientes

{{% note %}}
Los conceptos fundamentales que los estudiantes ya deberían conocer incluyen:
- Variables y tipos de datos
- Estructuras de control (if, while, for)
- Funciones
- Arrays o listas
- Algoritmos básicos
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
- Estructura más formal en Java
- La necesidad de clases
- Punto de entrada main()
- System.out.println vs print
- Importancia de los tipos de datos
- Compilación vs interpretación
{{% /note %}}

---

### ¿Por qué Orientación a Objetos?

- Organización más natural del código
- Reutilización y mantenimiento más fácil
- Modelado del mundo real
- Encapsulamiento de datos

{{% note %}}
La programación orientada a objetos nos permite:
- Estructurar nuestro código de manera que refleje entidades del mundo real
- Reutilizar código de manera más efectiva
- Proteger nuestros datos de modificaciones no deseadas
- Crear sistemas más complejos pero aún mantenibles
{{% /note %}}

---

### ¿Qué es Java?

- Lenguaje de programación orientado a objetos
- Plataforma independiente y versátil
- Utilizado en aplicaciones web, móviles, y sistemas empresariales
- "Write Once, Run Anywhere"

{{% note %}}
Java fue creado en 1995 por Sun Microsystems (ahora propiedad de Oracle). La independencia de plataforma se logra mediante la JVM (Java Virtual Machine), que permite ejecutar código Java en cualquier dispositivo que tenga una JVM instalada.
{{% /note %}}

---

### En todas partes hay Java

{{< imgref src="/images/2024/05/w1_001_devices_running_java.png" alt="Java en todas partes" class="img">}}

{{% note %}}
Ejemplos concretos de aplicaciones Java:
- Minecraft está escrito en Java
- Android usa Java/Kotlin (basado en la JVM)
- Muchos sistemas bancarios y financieros
- Aplicaciones empresariales
- Servidores web y aplicaciones web
- Sistemas embebidos
{{% /note %}}

---

### Características de Java

- Orientado a Objetos
- Independiente de la plataforma
- Robusto y seguro
- Multihilos
- Alto rendimiento

{{% note %}}
- OO: Todo en Java es un objeto (excepto tipos primitivos)
- Plataforma independiente: El código compilado (.class o .jar) puede ejecutarse en cualquier plataforma con una JVM
- Robusto: Sistema de tipos fuerte, manejo de excepciones
- Seguro: El sandbox de la JVM proporciona un entorno seguro
- Multihilos: Permite ejecutar múltiples hilos concurrentemente
{{% /note %}}

--- 

### Instalación del ambiente de desarrollo

- Java Development Kit (JDK)
- Un entorno de desarrollo (IDE)
  * IntelliJ IDEA (recomendado)
  * Eclipse
  * NetBeans

{{% note %}}
Para instalar el JDK:
1. Visitar oracle.com/java/technologies/downloads o usar OpenJDK
2. Descargar la versión para su sistema operativo
3. Seguir el asistente de instalación
4. Configurar las variables de entorno (PATH, JAVA_HOME)

Para instalar IntelliJ IDEA:
1. Visitar jetbrains.com/idea/download
2. Descargar la versión Community (gratuita) o solicitar una licencia educativa
3. Seguir el asistente de instalación
4. Configurar el JDK en el IDE
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

{{% section %}}

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
- public class: Define una clase pública llamada HolaMundo
- main method: Punto de entrada del programa
- System.out.println: Método para imprimir en la consola
- Las llaves {} definen bloques de código
- Los punto y coma ; terminan cada instrucción
- Los nombres de las clases siempre empiezan con mayúscula
{{% /note %}}

---

### Creando nuestro primer programa

1. Abrir IntelliJ IDEA
2. Crear un nuevo proyecto (File > New > Project)
3. Seleccionar Java y el JDK instalado
4. Nombrar el proyecto "PrimerPrograma"
5. Crear una nueva clase (Click derecho en src > New > Java Class)
6. Nombrar la clase "HolaMundo"
7. Escribir el código del Hola Mundo
8. Ejecutar (Botón verde de play o Shift+F10)

{{% note %}}
Es importante que los estudiantes sigan estos pasos en clase para familiarizarse con el IDE. Posibles problemas:
- No encontrar el JDK instalado (revisar la configuración)
- Errores de sintaxis (prestar atención a llaves y punto y coma)
- Problemas al ejecutar (verificar la configuración de ejecución)
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Sintaxis básica de Java

Las reglas fundamentales de Java incluyen:

1. **Sensibilidad a mayúsculas y minúsculas** (case-sensitive)
2. **Nombres de clase** comienzan con mayúscula (HolaMundo)
3. **Nombres de métodos** comienzan con minúscula (main)
4. **Nombre del archivo** debe coincidir con el nombre de la clase pública (HolaMundo.java)
5. **Todas las instrucciones** terminan con punto y coma (;)

{{% note %}}
Estas reglas son fundamentales para escribir código Java correcto:
- Java es completamente sensible a mayúsculas, por lo que "nombre" y "Nombre" son variables diferentes
- La convención para nombres de clases es PascalCase (cada palabra con mayúscula)
- La convención para métodos y variables es camelCase (primera palabra minúscula, siguientes con mayúscula)
- Si el nombre del archivo no coincide con la clase pública, se producirá un error de compilación
- Olvidar los punto y coma es uno de los errores más comunes para principiantes
{{% /note %}}

---

### Estructura de un programa Java

```java
// 1. Declaraciones de paquete (opcional)
package com.ejemplo.miproyecto;

// 2. Declaraciones de importación (opcionales)
import java.util.Scanner;

// 3. Declaración de la clase
public class MiPrograma {
    // 4. Variables de clase (atributos)
    static int contador = 0;
    
    // 5. Métodos (incluyendo el main)
    public static void main(String[] args) {
        // 6. Cuerpo del método con variables locales
        int numero = 10;
        System.out.println("El número es: " + numero);
    }
    
    // 7. Otros métodos
    public static void otroMetodo() {
        // Código aquí
    }
}
```

{{% note %}}
Esta estructura básica muestra los elementos principales de un programa Java:
1. El paquete organiza las clases (similar a los módulos en Python)
2. Los imports permiten usar clases de otras bibliotecas
3. Cada archivo contiene principalmente una clase pública
4. Las variables a nivel de clase se llaman atributos
5. El método main es el punto de entrada del programa
6. Las variables dentro de métodos son locales a ese método
7. Un programa puede tener muchos métodos

Esta estructura es importante para organizar el código de manera eficiente.
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Variables en Java

Una variable es un espacio de memoria con:
- Un nombre
- Un tipo de dato
- Un valor

**Sintaxis básica:**
```java
tipo nombreVariable = valor;
```

**Ejemplos:**
```java
int edad = 25;
double precio = 19.99;
boolean activo = true;
char letra = 'A';
String nombre = "Juan";  // String es una clase, no un primitivo
```

{{% note %}}
A diferencia de Python, en Java:
- Debemos declarar explícitamente el tipo de cada variable
- Una vez declarada, la variable no puede cambiar de tipo
- El tipo determina qué operaciones podemos realizar
- Los nombres de variables siguen la convención camelCase
- Las variables pueden declararse sin inicializar, pero deben inicializarse antes de usarse
{{% /note %}}

---

### Tipos de datos primitivos en Java

| Tipo    | Tamaño   | Rango                                       | Ejemplo       |
|---------|----------|---------------------------------------------|---------------|
| byte    | 8 bits   | -128 a 127                                  | byte b = 100; |
| short   | 16 bits  | -32,768 a 32,767                            | short s = 20000; |
| int     | 32 bits  | -2^31 a 2^31-1                              | int i = 42;   |
| long    | 64 bits  | -2^63 a 2^63-1                              | long l = 123456789L; |
| float   | 32 bits  | Hasta 7 dígitos decimales                   | float f = 3.14f; |
| double  | 64 bits  | Hasta 16 dígitos decimales                  | double d = 3.14159; |
| boolean | 1 bit    | true o false                                | boolean b = true; |
| char    | 16 bits  | '\u0000' a '\uffff' (caracteres Unicode)    | char c = 'A'; |

{{% note %}}
Es importante entender que:
- int es el tipo entero más utilizado para operaciones estándar
- double es el tipo flotante más utilizado para la mayoría de cálculos con decimales
- Los sufijos 'L' y 'f' son necesarios para constantes long y float respectivamente
- char utiliza comillas simples y String comillas dobles
- A diferencia de Python, true y false se escriben en minúsculas
- Estos tipos primitivos son más eficientes en memoria que sus equivalentes de objeto
{{% /note %}}

---

### Variables: Declaración vs Inicialización

**Declaración:** Reservar espacio de memoria
```java
int edad;
String nombre;
```

**Inicialización:** Asignar un valor inicial
```java
edad = 25;
nombre = "Ana";
```

**Combinados:**
```java
int edad = 25;
String nombre = "Ana";
```

{{% note %}}
En Java:
- Las variables locales deben ser inicializadas antes de ser utilizadas
- Las variables de clase (atributos) reciben valores por defecto si no se inicializan
- Es una buena práctica inicializar las variables al declararlas
- El compilador dará error si intentamos usar una variable local no inicializada
{{% /note %}}

---

### Ejercicio: Declaración de variables

**Ejercicio 1:** Declara variables para almacenar la siguiente información de un estudiante:
- Nombre
- Edad
- Promedio de calificaciones
- Si está activo o no
- Inicial de su segundo nombre

Luego imprime toda la información.

{{% note %}}
Solución:
```java
public class InformacionEstudiante {
    public static void main(String[] args) {
        // Declaración e inicialización de variables
        String nombre = "María";
        int edad = 20;
        double promedio = 8.5;
        boolean activo = true;
        char inicial = 'L';
        
        // Impresión de la información
        System.out.println("Nombre: " + nombre);
        System.out.println("Edad: " + edad);
        System.out.println("Promedio: " + promedio);
        System.out.println("¿Activo? " + activo);
        System.out.println("Inicial del segundo nombre: " + inicial);
    }
}
```
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Alcance de variables (Scope)

El alcance determina dónde es accesible una variable:

**Variables locales:** Declaradas dentro de un método
```java
public void ejemplo() {
    int x = 10;  // Solo accesible dentro de este método
}
```

**Variables de clase (atributos):** Declaradas en la clase, fuera de métodos
```java
public class Ejemplo {
    int y = 20;  // Accesible desde cualquier método de la clase
    
    public void metodo1() {
        System.out.println(y);  // Puede acceder a y
    }
}
```

{{% note %}}
El alcance de una variable en Java está determinado por las llaves {}:
- Las variables locales solo existen dentro del bloque donde fueron declaradas
- Las variables de clase existen mientras exista el objeto de la clase
- Si una variable local tiene el mismo nombre que una variable de clase, la local tiene prioridad (shadowing)
- Es importante entender el alcance para evitar errores como intentar acceder a variables fuera de su ámbito
{{% /note %}}

---

### Ejemplo de alcance de variables

```java
public class EjemploScope {
    int variableDeClase = 10;  // Variable de clase
    
    public void metodo1() {
        int variableLocal = 20;  // Variable local a metodo1
        System.out.println(variableDeClase);  // Accesible
        System.out.println(variableLocal);    // Accesible
        // System.out.println(otraVariable);  // Error: no existe aquí
    }
    
    public void metodo2() {
        int otraVariable = 30;  // Variable local a metodo2
        System.out.println(variableDeClase);  // Accesible
        // System.out.println(variableLocal);  // Error: fuera de alcance
        
        if (true) {
            int variableDentroDeIf = 40;  // Variable local al bloque if
            System.out.println(variableDentroDeIf);  // Accesible
        }
        // System.out.println(variableDentroDeIf);  // Error: fuera de alcance
    }
}
```

{{% note %}}
Este ejemplo ilustra varios conceptos importantes sobre el alcance:
- Las variables de clase (variableDeClase) son accesibles desde cualquier método
- Las variables locales (variableLocal, otraVariable) solo existen dentro del método donde se declararon
- Las variables declaradas en bloques como if, for, while solo existen dentro de ese bloque
- Es buena práctica declarar las variables en el alcance más pequeño posible
{{% /note %}}

---

### Constantes en Java

Para declarar una constante, usa la palabra clave `final`:

```java
final double PI = 3.14159;
final int DIAS_SEMANA = 7;
```

**Características:**
- No pueden cambiar su valor después de la inicialización
- Por convención, se nombran en MAYÚSCULAS_CON_GUIONES_BAJOS
- Mejoran la legibilidad y mantenimiento del código

```java
// Intento de modificar una constante
PI = 3.14;  // Error de compilación
```

{{% note %}}
Las constantes son útiles para:
- Valores que nunca deben cambiar (π, número de días de la semana)
- Evitar "números mágicos" en el código, mejorando la legibilidad
- Centralizar valores que podrían necesitar ajustes futuros
- Prevenir errores accidentales de asignación
- Las constantes finales a nivel de clase deben inicializarse en la declaración o en todos los constructores
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Operadores en Java

**Operadores aritméticos:**
```java
int a = 10;
int b = 3;
System.out.println(a + b);  // 13 (suma)
System.out.println(a - b);  // 7 (resta)
System.out.println(a * b);  // 30 (multiplicación)
System.out.println(a / b);  // 3 (división entera)
System.out.println(a % b);  // 1 (módulo/resto)
```

{{% note %}}
Los operadores aritméticos en Java son similares a Python, pero con algunas diferencias:
- La división entre enteros produce un resultado entero (truncado, no redondeado)
- Para obtener una división con decimales, al menos uno de los operandos debe ser float o double
- El operador % funciona igual que en Python
- Java tiene operadores de incremento/decremento que Python no tiene (++, --)
{{% /note %}}

---

### Operadores de asignación

```java
int x = 10;  // Asignación simple

// Asignación compuesta
x += 5;      // Equivale a: x = x + 5;  (ahora x vale 15)
x -= 3;      // Equivale a: x = x - 3;  (ahora x vale 12)
x *= 2;      // Equivale a: x = x * 2;  (ahora x vale 24)
x /= 4;      // Equivale a: x = x / 4;  (ahora x vale 6)
x %= 4;      // Equivale a: x = x % 4;  (ahora x vale 2)
```

{{% note %}}
Los operadores de asignación compuestos:
- Abrevian operaciones comunes
- Son más eficientes porque evalúan la variable solo una vez
- Son especialmente útiles cuando el lado izquierdo es una expresión compleja
- Funcionan con todos los tipos numéricos
- También existen para operadores bit a bit (&=, |=, ^=, etc.)
{{% /note %}}

---

### Operadores de incremento y decremento

```java
int a = 5;
a++;        // Incremento en 1 (postfijo): a = a + 1; (ahora a vale 6)
++a;        // Incremento en 1 (prefijo):  a = a + 1; (ahora a vale 7)

int b = 8;
b--;        // Decremento en 1 (postfijo): b = b - 1; (ahora b vale 7)
--b;        // Decremento en 1 (prefijo):  b = b - 1; (ahora b vale 6)
```

La diferencia entre prefijo y postfijo importa en expresiones:
```java
int x = 5;
int y = x++;  // y = 5, x = 6 (asigna primero, luego incrementa)

int m = 5;
int n = ++m;  // n = 6, m = 6 (incrementa primero, luego asigna)
```

{{% note %}}
Los operadores de incremento/decremento son muy comunes en Java, especialmente en bucles:
- Postfijo (x++): retorna el valor actual y luego incrementa
- Prefijo (++x): incrementa primero y luego retorna el nuevo valor
- Son más eficientes que escribir x = x + 1
- A pesar de su eficiencia, pueden crear código confuso si se usan en expresiones complejas
- En la práctica, prefiero x++ cuando solo quiero incrementar, y ++x cuando uso el valor en una expresión
{{% /note %}}

---

### Operadores de comparación

```java
int a = 5;
int b = 7;

System.out.println(a == b);  // false (igualdad)
System.out.println(a != b);  // true (desigualdad)
System.out.println(a > b);   // false (mayor que)
System.out.println(a < b);   // true (menor que)
System.out.println(a >= b);  // false (mayor o igual que)
System.out.println(a <= b);  // true (menor o igual que)
```

**¡Precaución!** Para objetos como String, usa el método `equals()`:
```java
String s1 = "Hola";
String s2 = "Hola";
System.out.println(s1 == s2);       // Puede dar true o false (compara referencias)
System.out.println(s1.equals(s2));  // true (compara contenido)
```

{{% note %}}
Los operadores de comparación son fundamentales para expresiones condicionales:
- Siempre devuelven un valor boolean (true o false)
- Funcionan igual que en la mayoría de lenguajes
- El error más común es usar == para comparar Strings, que puede dar resultados inesperados
- Para comparar el contenido de objetos, siempre usa el método equals()
- Para tipos primitivos (int, double, etc.), == funciona como se espera
{{% /note %}}

---

### Operadores lógicos

```java
boolean a = true;
boolean b = false;

System.out.println(a && b);  // false (AND lógico - ambos deben ser true)
System.out.println(a || b);  // true (OR lógico - al menos uno debe ser true)
System.out.println(!a);      // false (NOT lógico - invierte el valor)
```

**Ejemplo práctico:**
```java
int edad = 25;
boolean tieneLicencia = true;

boolean puedeConducir = edad >= 18 && tieneLicencia;
System.out.println("¿Puede conducir? " + puedeConducir);  // true
```

{{% note %}}
Los operadores lógicos son esenciales para combinar condiciones:
- && es el AND lógico (equivalente a and en Python)
- || es el OR lógico (equivalente a or en Python)
- ! es el NOT lógico (equivalente a not en Python)
- Java utiliza evaluación de cortocircuito:
  * En a && b, si a es false, b no se evalúa
  * En a || b, si a es true, b no se evalúa
- Esto es útil para evitar errores como divisiones por cero o índices fuera de rango
{{% /note %}}

---

### Precedencia de operadores

Los operadores se evalúan en un orden específico:

1. Postfijo `expr++` `expr--`
2. Prefijo `++expr` `--expr` `+expr` `-expr` `!`
3. Multiplicativos `*` `/` `%`
4. Aditivos `+` `-`
5. Relacionales `<` `>` `<=` `>=`
6. Igualdad `==` `!=`
7. AND lógico `&&`
8. OR lógico `||`
9. Asignación `=` `+=` `-=` etc.

**Use paréntesis para mejorar la claridad:**
```java
int resultado = (a + b) * c;  // Los paréntesis se evalúan primero
```

{{% note %}}
La precedencia de operadores determina el orden de evaluación:
- Es similar a las reglas matemáticas (multiplicación antes que suma, etc.)
- Cuando hay duda, es mejor usar paréntesis para hacer el código más claro
- Los paréntesis siempre tienen la precedencia más alta
- Las expresiones se evalúan de izquierda a derecha dentro del mismo nivel de precedencia
- Memorizar toda la tabla de precedencia no es necesario, pero es importante conocer las reglas básicas
{{% /note %}}

---

### Ejercicio: Operadores

**Ejercicio 2:** Escribe un programa que calcule el área y el perímetro de un rectángulo.
- Declara variables para la base y la altura
- Calcula el área y el perímetro
- Muestra los resultados

{{% note %}}
Solución:
```java
public class CalculoRectangulo {
    public static void main(String[] args) {
        // Declaración de variables
        double base = 5.0;
        double altura = 3.0;
        
        // Cálculo de área y perímetro
        double area = base * altura;
        double perimetro = 2 * (base + altura);
        
        // Mostrar resultados
        System.out.println("Base del rectángulo: " + base);
        System.out.println("Altura del rectángulo: " + altura);
        System.out.println("Área del rectángulo: " + area);
        System.out.println("Perímetro del rectángulo: " + perimetro);
    }
}
```
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Entrada por consola en Java

Para leer entrada del usuario, usamos la clase `Scanner`:

```java
import java.util.Scanner;

public class EntradaUsuario {
    public static void main(String[] args) {
        // Crear un objeto Scanner
        Scanner scanner = new Scanner(System.in);
        
        // Solicitar datos
        System.out.print("Ingrese su nombre: ");
        String nombre = scanner.nextLine();
        
        System.out.print("Ingrese su edad: ");
        int edad = scanner.nextInt();
        
        // Mostrar los datos ingresados
        System.out.println("Hola " + nombre + ", tienes " + edad + " años.");
        
        // Cerrar el scanner
        scanner.close();
    }
}
```

{{% note %}}
La clase Scanner es fundamental para leer entrada del usuario:
- Debe importarse con `import java.util.Scanner;`
- Se crea pasando `System.in` como fuente de entrada
- Métodos principales:
  * nextLine(): Lee una línea completa de texto
  * next(): Lee una palabra
  * nextInt(), nextDouble(): Lee números
  * nextBoolean(): Lee valores booleanos
- Es importante cerrar el scanner con close() al final
- ¡Cuidado! Después de nextInt() o nextDouble(), si se quiere leer un String con nextLine(), hay que consumir el salto de línea con un nextLine() adicional
{{% /note %}}

---

### Problema común con Scanner

```java
import java.util.Scanner;

public class ProblemaScanner {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Ingrese su edad: ");
        int edad = scanner.nextInt();  // Lee el número pero deja el salto de línea
        
        // Este nextLine() consume el salto de línea dejado por nextInt()
        scanner.nextLine();
        
        System.out.print("Ingrese su nombre: ");
        String nombre = scanner.nextLine();
        
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
        
        scanner.close();
    }
}
```

{{% note %}}
Este es uno de los errores más comunes al usar Scanner:
- nextInt(), nextDouble(), etc., no consumen el salto de línea (`\n`)
- Si luego se usa nextLine(), este leerá ese salto de línea pendiente
- Solución: añadir un scanner.nextLine() adicional para consumir el salto de línea
- Alternativa: leer todo como String con nextLine() y convertir a los tipos necesarios

```java
// Alternativa más segura
String edadStr = scanner.nextLine();
int edad = Integer.parseInt(edadStr);
```

Esta alternativa también evita excepciones si el usuario ingresa algo que no es un número.
{{% /note %}}

---

### Parámetros de línea de comandos

Los parámetros pasados al ejecutar el programa se reciben en `args`:

```java
public class ParametrosComandos {
    public static void main(String[] args) {
        System.out.println("Número de argumentos: " + args.length);
        
        for (int i = 0; i < args.length; i++) {
            System.out.println("Argumento " + i + ": " + args[i]);
        }
    }
}
```

Para ejecutar con parámetros:
```bash
java ParametrosComandos uno dos tres
```

{{% note %}}
Los parámetros de línea de comandos son útiles para configurar la ejecución:
- Se pasan después del nombre de la clase al ejecutar
- Se reciben como un array de String en el parámetro args del método main
- Siempre son tratados como texto (String)
- Si necesitas valores numéricos, debes convertirlos:
  ```java
  int numero = Integer.parseInt(args[0]);
  ```
- Es importante verificar que hay suficientes argumentos antes de usarlos para evitar excepciones
- A diferencia de otros lenguajes, Java no incluye el nombre del programa como primer argumento
{{% /note %}}

---

### Ejercicio: Entrada de usuario

**Ejercicio 3:** Crea un programa que solicite al usuario su nombre, edad y altura en metros. Luego calcula e imprime su índice de masa corporal (IMC).
- Formula: IMC = peso / (altura * altura)
- Solicita peso en kilogramos y altura en metros
- Muestra el IMC con dos decimales

{{% note %}}
Solución:
```java
import java.util.Scanner;

public class CalculadoraIMC {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Solicitar datos
        System.out.print("Ingrese su nombre: ");
        String nombre = scanner.nextLine();
        
        System.out.print("Ingrese su peso en kg: ");
        double peso = scanner.nextDouble();
        
        System.out.print("Ingrese su altura en metros: ");
        double altura = scanner.nextDouble();
        
        // Calcular IMC
        double imc = peso / (altura * altura);
        
        // Mostrar resultado
        System.out.println("\nResultados para " + nombre + ":");
        System.out.printf("Su IMC es: %.2f\n", imc);
        
        scanner.close();
    }
}
```

La función `printf` permite formatear la salida, donde `%.2f` indica que se mostrará un número de punto flotante con 2 decimales.
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Estructuras de control: Condicionales

**if-else**: Evalúa una condición y ejecuta código según el resultado

```java
int edad = 18;

if (edad >= 18) {
    System.out.println("Es mayor de edad");
} else {
    System.out.println("Es menor de edad");
}
```

{{% note %}}
La estructura if-else en Java:
- La condición debe evaluarse a un valor booleano
- Las llaves {} son obligatorias si hay más de una instrucción en el bloque
- Se pueden omitir para bloques de una sola instrucción, pero no es recomendable
- A diferencia de Python, no se usan : y la indentación, sino {} para definir bloques
- La condición siempre va entre paréntesis ()
{{% /note %}}

---

### if-else-if

Para múltiples condiciones:

```java
int nota = 85;

if (nota >= 90) {
    System.out.println("Sobresaliente");
} else if (nota >= 80) {
    System.out.println("Notable");
} else if (nota >= 70) {
    System.out.println("Bien");
} else if (nota >= 60) {
    System.out.println("Suficiente");
} else {
    System.out.println("Insuficiente");
}
```

{{% note %}}
La estructura if-else-if:
- Permite evaluar múltiples condiciones en secuencia
- Se evalúan en orden y se ejecuta el primer bloque cuya condición es true
- Si ninguna condición es true, se ejecuta el bloque else (si existe)
- Es útil para categorizar valores en rangos
- Similar a elif en Python, pero con sintaxis diferente
- Para condiciones complejas, considerar usar switch en su lugar
{{% /note %}}

---

### Operador ternario

Una forma concisa de expresar condiciones simples:

```java
// Sintaxis: condición ? valorSiTrue : valorSiFalse
int edad = 20;
String estado = (edad >= 18) ? "Mayor de edad" : "Menor de edad";

System.out.println(estado);  // "Mayor de edad"
```

También se puede usar en asignaciones:

```java
int a = 5;
int b = 7;
int maximo = (a > b) ? a : b;
System.out.println("El máximo es: " + maximo);  // 7
```

{{% note %}}
El operador ternario:
- Es una forma abreviada de if-else para asignaciones simples
- Siempre devuelve un valor (a diferencia de if-else)
- Tiene tres partes: condición, valor si true, valor si false
- Útil para asignaciones condicionales en una sola línea
- No es recomendable anidar múltiples operadores ternarios, ya que reduce la legibilidad
- Equivalente a `x if condicion else y` en Python
{{% /note %}}

---

### Switch

Para comparar una variable con múltiples valores posibles:

```java
int dia = 3;
String nombreDia;

switch (dia) {
    case 1:
        nombreDia = "Lunes";
        break;
    case 2:
        nombreDia = "Martes";
        break;
    case 3:
        nombreDia = "Miércoles";
        break;
    case 4:
        nombreDia = "Jueves";
        break;
    case 5:
        nombreDia = "Viernes";
        break;
    case 6:
        nombreDia = "Sábado";
        break;
    case 7:
        nombreDia = "Domingo";
        break;
    default:
        nombreDia = "Día inválido";
}

System.out.println("El día " + dia + " es " + nombreDia);
```

{{% note %}}
La estructura switch:
- Es útil cuando se compara una variable con valores específicos
- La expresión debe ser de tipo int, byte, short, char, String o enum
- Cada case debe terminar con break para evitar la "caída" a los casos siguientes
- default se ejecuta si ningún case coincide (similar a else)
- A partir de Java 12 existe el switch de expresión con sintaxis mejorada
- El switch tradicional es más eficiente que múltiples if-else para muchas comparaciones
- No existe en Python; allí se usaría un diccionario o if-elif
{{% /note %}}

---

### Ejercicio: Condicionales

**Ejercicio 4:** Crea un programa que determine el tipo de triángulo según sus lados:
- Solicita las longitudes de los tres lados
- Determina si es equilátero (tres lados iguales), isósceles (dos lados iguales) o escaleno (todos diferentes)
- También verifica si los lados pueden formar un triángulo (la suma de dos lados debe ser mayor que el tercero)

{{% note %}}
Solución:
```java
import java.util.Scanner;

public class TipoTriangulo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Ingrese las longitudes de los tres lados del triángulo:");
        System.out.print("Lado 1: ");
        double lado1 = scanner.nextDouble();
        
        System.out.print("Lado 2: ");
        double lado2 = scanner.nextDouble();
        
        System.out.print("Lado 3: ");
        double lado3 = scanner.nextDouble();
        
        // Verificar si puede formar un triángulo
        if (lado1 + lado2 > lado3 && lado1 + lado3 > lado2 && lado2 + lado3 > lado1) {
            // Determinar tipo de triángulo
            if (lado1 == lado2 && lado2 == lado3) {
                System.out.println("Es un triángulo equilátero");
            } else if (lado1 == lado2 || lado1 == lado3 || lado2 == lado3) {
                System.out.println("Es un triángulo isósceles");
            } else {
                System.out.println("Es un triángulo escaleno");
            }
        } else {
            System.out.println("¡Error! Estos lados no pueden formar un triángulo");
        }
        
        scanner.close();
    }
}
```
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Estructuras de control: Bucles

**while**: Ejecuta un bloque mientras una condición sea verdadera

```java
int contador = 1;

while (contador <= 5) {
    System.out.println("Iteración: " + contador);
    contador++;
}
```

{{% note %}}
El bucle while:
- Evalúa la condición antes de cada iteración
- Si la condición es false inicialmente, el bloque nunca se ejecuta
- Es necesario actualizar la condición dentro del bloque para evitar bucles infinitos
- Usualmente se incrementa un contador o se modifica alguna variable para cambiar la condición
- Funcionamiento idéntico al while de Python, aunque con sintaxis diferente
- Útil cuando no sabemos cuántas iteraciones serán necesarias
{{% /note %}}

---

### do-while

Ejecuta un bloque **al menos una vez** y luego mientras la condición sea verdadera:

```java
int contador = 1;

do {
    System.out.println("Iteración: " + contador);
    contador++;
} while (contador <= 5);
```

{{% note %}}
El bucle do-while:
- Evalúa la condición después de cada iteración
- Garantiza que el bloque se ejecute al menos una vez
- No existe en Python
- Útil para escenarios donde siempre se necesita una primera ejecución
- Común en validación de entrada de usuario (pedimos datos y luego verificamos)
- La sintaxis requiere punto y coma después de la condición while
{{% /note %}}

---

### for

El bucle más común para un número conocido de iteraciones:

```java
// for (inicialización; condición; incremento)
for (int i = 0; i < 5; i++) {
    System.out.println("Valor de i: " + i);
}
```

Equivalente a:
```java
int i = 0;
while (i < 5) {
    System.out.println("Valor de i: " + i);
    i++;
}
```

{{% note %}}
El bucle for tradicional:
- Tiene tres partes: inicialización, condición e incremento
- Es más compacto y menos propenso a errores que while para conteo
- La variable declarada en la inicialización solo existe dentro del bucle
- Se puede omitir cualquiera de las tres partes (incluso todas)
- Múltiples variables pueden ser inicializadas y actualizadas, separadas por comas
- A diferencia del for de Python, que itera sobre colecciones, este es un bucle de conteo
- Equivale aproximadamente a `for i in range(5):` en Python
{{% /note %}}

---

### for mejorado (for-each)

Para iterar sobre colecciones (arrays, listas, etc.):

```java
String[] nombres = {"Ana", "Juan", "María", "Pedro"};

// Equivalente a "for nombre in nombres:" en Python
for (String nombre : nombres) {
    System.out.println(nombre);
}
```

{{% note %}}
El bucle for-each:
- Introducido en Java 5
- Más simple y legible que el for tradicional para colecciones
- No proporciona acceso al índice
- No permite modificar la colección durante la iteración
- Similar al for de Python cuando itera sobre una colección
- Funciona con arrays y cualquier objeto que implemente Iterable
- Útil cuando solo necesitamos acceder a los elementos, no a sus posiciones
{{% /note %}}

---

### break y continue

**break**: Sale completamente del bucle

```java
for (int i = 1; i <= 10; i++) {
    if (i == 5) {
        break;  // Sale del bucle cuando i es 5
    }
    System.out.println(i);  // Imprime 1, 2, 3, 4
}
```

**continue**: Salta a la siguiente iteración

```java
for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
        continue;  // Salta los números pares
    }
    System.out.println(i);  // Imprime 1, 3, 5, 7, 9
}
```

{{% note %}}
Las instrucciones break y continue:
- break termina inmediatamente el bucle más interno
- continue salta al inicio de la siguiente iteración
- Funcionan en for, while y do-while
- Son idénticas en comportamiento a Python
- Útiles para control de flujo condicional dentro de bucles
- Usar con moderación: el abuso puede hacer el código difícil de seguir
- En bucles anidados, solo afectan al bucle más interno (a menos que se usen etiquetas)
{{% /note %}}

---

### Ejercicio: Bucles

**Ejercicio 5:** Crea un programa que imprima la tabla de multiplicar de un número:
- Solicita al usuario un número entero
- Imprime su tabla de multiplicar del 1 al 10
- Usa un bucle for

{{% note %}}
Solución:
```java
import java.util.Scanner;

public class TablaMultiplicar {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Ingrese un número para ver su tabla de multiplicar: ");
        int numero = scanner.nextInt();
        
        System.out.println("\nTabla de multiplicar del " + numero + ":");
        
        for (int i = 1; i <= 10; i++) {
            System.out.println(numero + " × " + i + " = " + (numero * i));
        }
        
        scanner.close();
    }
}
```
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Arrays en Java

Un array es una colección de elementos del mismo tipo con tamaño fijo:

**Declaración e inicialización:**
```java
// Declaración
int[] numeros;  // Recomendado
// o
int numeros[];  // Válido pero menos usado

// Inicialización con tamaño
numeros = new int[5];  // Array de 5 enteros (con valores 0)

// Asignación de valores
numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;
numeros[3] = 40;
numeros[4] = 50;

// Declaración e inicialización en una línea
int[] primos = {2, 3, 5, 7, 11};
```

{{% note %}}
Características importantes de los arrays en Java:
- Tienen tamaño fijo una vez creados
- Se indexan desde 0 hasta length-1
- Almacenan elementos del mismo tipo
- Los elementos no inicializados reciben valores predeterminados (0 para números, false para boolean, null para objetos)
- La notación int[] es preferible a int array[] (más clara)
- A diferencia de las listas en Python, el tamaño no puede cambiar dinámicamente
- new int[5] reserva espacio para 5 enteros
- La inicialización con llaves {} debe hacerse en la declaración
{{% /note %}}

---

### Acceso y propiedades de arrays

```java
int[] numeros = {10, 20, 30, 40, 50};

// Acceso a elementos
System.out.println(numeros[0]);  // 10
System.out.println(numeros[2]);  // 30

// Modificación de elementos
numeros[1] = 25;  // Ahora es {10, 25, 30, 40, 50}

// Longitud del array
System.out.println("Tamaño del array: " + numeros.length);  // 5

// Acceso al último elemento
System.out.println("Último elemento: " + numeros[numeros.length - 1]);  // 50
```

{{% note %}}
Acceder y trabajar con arrays:
- El acceso a los elementos es por índice entre corchetes []
- El índice debe estar entre 0 y length-1
- Intentar acceder fuera de rango causa una excepción ArrayIndexOutOfBoundsException
- La propiedad length devuelve el tamaño del array (nota: no es un método, no lleva paréntesis)
- A diferencia de Python, no hay acceso con índices negativos (-1 para el último elemento)
- Los arrays en Java son objetos, pero length es una propiedad, no un método como en Python (len())
{{% /note %}}

---

### Iteración sobre arrays

Hay varias formas de recorrer un array:

```java
int[] numeros = {10, 20, 30, 40, 50};

// Usando for tradicional
for (int i = 0; i < numeros.length; i++) {
    System.out.println("numeros[" + i + "] = " + numeros[i]);
}

// Usando for-each (más simple, sin índice)
for (int numero : numeros) {
    System.out.println(numero);
}
```

{{% note %}}
Formas de iterar sobre arrays:
- El bucle for tradicional permite acceso al índice y al valor
- El bucle for-each es más simple pero no da acceso al índice
- El for-each es preferible cuando no necesitamos el índice
- En el for-each, la variable (numero) recibe una copia del valor
- Modificar la variable en el for-each no afecta el array original
- Para modificar elementos, es necesario usar el for tradicional con índices
{{% /note %}}

---

### Arrays multidimensionales

Java soporta arrays de arrays (matrices):

```java
// Declaración e inicialización
int[][] matriz = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Acceso a elementos
System.out.println(matriz[1][2]);  // 6 (fila 1, columna 2)

// Inicialización con tamaño
int[][] tabla = new int[3][3];  // Matriz 3x3 de ceros

// Asignación de valores
tabla[0][0] = 1;
tabla[0][1] = 2;
// ...
```

{{% note %}}
Arrays multidimensionales:
- Son realmente arrays de arrays
- Las dimensiones pueden tener diferentes tamaños (arrays irregulares)
- Se accede con múltiples índices: array[fila][columna]
- También tienen la propiedad length (número de filas)
- Para obtener el número de columnas: array[fila].length
- Pueden tener más de dos dimensiones: int[][][] cubo
- Son útiles para representar datos tabulares, matrices, etc.
{{% /note %}}

---

### Iteración sobre arrays multidimensionales

```java
int[][] matriz = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Usando for tradicional
for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[i].length; j++) {
        System.out.print(matriz[i][j] + "\t");
    }
    System.out.println();  // Nueva línea después de cada fila
}

// Usando for-each
for (int[] fila : matriz) {
    for (int valor : fila) {
        System.out.print(valor + "\t");
    }
    System.out.println();
}
```

{{% note %}}
Recorrer arrays multidimensionales:
- Se requieren bucles anidados para recorrer todas las dimensiones
- Con for tradicional tenemos acceso a los índices
- Con for-each el código es más limpio pero sin índices
- matriz.length da el número de filas
- matriz[i].length da el número de columnas en la fila i
- En arrays irregulares, cada fila puede tener diferente longitud
- La impresión con tabuladores (\t) ayuda a visualizar la estructura
{{% /note %}}

---

### Métodos útiles para arrays

La clase `java.util.Arrays` proporciona métodos útiles:

```java
import java.util.Arrays;

public class MetodosArrays {
    public static void main(String[] args) {
        int[] numeros = {5, 2, 8, 1, 9};
        
        // Ordenar
        Arrays.sort(numeros);
        System.out.println(Arrays.toString(numeros));  // [1, 2, 5, 8, 9]
        
        // Buscar (en array ordenado)
        int indice = Arrays.binarySearch(numeros, 5);
        System.out.println("5 está en el índice " + indice);  // 2
        
        // Llenar
        int[] cincos = new int[5];
        Arrays.fill(cincos, 5);
        System.out.println(Arrays.toString(cincos));  // [5, 5, 5, 5, 5]
        
        // Comparar
        int[] a = {1, 2, 3};
        int[] b = {1, 2, 3};
        System.out.println("¿Arrays iguales? " + Arrays.equals(a, b));  // true
    }
}
```

{{% note %}}
La clase Arrays proporciona métodos estáticos útiles:
- Arrays.toString() convierte un array a String para visualización
- Arrays.sort() ordena un array en orden ascendente
- Arrays.binarySearch() busca un elemento en un array ordenado
- Arrays.fill() asigna un valor a todos los elementos
- Arrays.equals() compara si dos arrays tienen los mismos elementos
- Arrays.copyOf() crea una copia de un array
- Para usar estos métodos, hay que importar java.util.Arrays
- Arrays.sort() modifica el array original, a diferencia de sorted() en Python
{{% /note %}}

---

### Ejercicio: Arrays

**Ejercicio 6:** Crea un programa que:
- Defina un array de 10 números enteros
- Calcule la suma y el promedio de los elementos
- Encuentre el valor máximo y mínimo
- Cuente cuántos números son pares

{{% note %}}
Solución:
```java
public class OperacionesArray {
    public static void main(String[] args) {
        // Definir un array de enteros
        int[] numeros = {23, 45, 12, 8, 95, 16, 37, 42, 19, 60};
        
        // Calcular suma
        int suma = 0;
        for (int numero : numeros) {
            suma += numero;
        }
        
        // Calcular promedio
        double promedio = (double) suma / numeros.length;
        
        // Encontrar máximo y mínimo
        int maximo = numeros[0];
        int minimo = numeros[0];
        
        // Contar pares
        int contadorPares = 0;
        
        for (int numero : numeros) {
            if (numero > maximo) {
                maximo = numero;
            }
            
            if (numero < minimo) {
                minimo = numero;
            }
            
            if (numero % 2 == 0) {
                contadorPares++;
            }
        }
        
        // Mostrar resultados
        System.out.println("Array: " + java.util.Arrays.toString(numeros));
        System.out.println("Suma: " + suma);
        System.out.println("Promedio: " + promedio);
        System.out.println("Máximo: " + maximo);
        System.out.println("Mínimo: " + minimo);
        System.out.println("Cantidad de números pares: " + contadorPares);
    }
}
```
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Comentarios en Java

Java soporta tres tipos de comentarios:

```java
// Comentario de una línea

/*
 * Comentario de
 * múltiples líneas
 */

/**
 * Comentario de documentación (Javadoc)
 * @author Nombre del Autor
 * @version 1.0
 */
```

{{% note %}}
Los comentarios son esenciales para documentar el código:
- Comentarios de una línea (//): para explicaciones breves
- Comentarios de múltiples líneas (/*...*/): para bloques explicativos
- Comentarios de documentación (/**...*/): para generar documentación API
- Los comentarios no afectan la ejecución del programa
- Es importante usar comentarios para explicar el porqué, no el qué (que debería ser obvio por el código)
- Los comentarios de Javadoc permiten generar documentación HTML automáticamente
{{% /note %}}

---

### Javadoc: Comentarios de documentación

Usados para generar documentación automática:

```java
/**
 * Esta clase calcula áreas de figuras geométricas.
 * @author Juan Pérez
 * @version 1.0
 */
public class Geometria {
    
    /**
     * Calcula el área de un círculo.
     * 
     * @param radio El radio del círculo en cm
     * @return El área del círculo en cm²
     */
    public double areaCirculo(double radio) {
        return Math.PI * radio * radio;
    }
}
```

{{% note %}}
Los comentarios Javadoc tienen etiquetas especiales:
- @author: nombre del autor
- @version: versión del código
- @param: describe un parámetro del método
- @return: describe el valor de retorno
- @throws: describe excepciones que pueden ocurrir
- @see: proporciona enlaces a otros elementos
- @since: indica cuándo se agregó la funcionalidad
- @deprecated: indica que no se recomienda su uso

Estos comentarios se pueden procesar con la herramienta javadoc para generar documentación en HTML similar a la documentación oficial de Java.
{{% /note %}}

---

### Buenas prácticas de comentarios

✅ Lo recomendado:
- Comentar el **porqué**, no el **qué**
- Mantener comentarios actualizados con el código
- Usar Javadoc para documentar APIs
- Comentar código complejo o no intuitivo
- Usar comentarios para TODO, FIXME, etc.

❌ Lo que se debe evitar:
- Comentarios obvios (`x++; // Incrementa x`)
- Comentarios desactualizados
- Código comentado (usar control de versiones)
- Comentarios excesivos

{{% note %}}
Los comentarios efectivos:
- Explican la intención y el razonamiento detrás del código
- Señalan posibles problemas o limitaciones
- Documentan decisiones de diseño importantes
- Facilitan el mantenimiento y la comprensión del código
- Son concisos y precisos

Recordar que el mejor comentario es un código claro y legible. Si el código necesita muchos comentarios para entenderse, considera refactorizarlo para hacerlo más claro.
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Depuración en Java

La depuración (debugging) es el proceso de encontrar y corregir errores:

**Tipos de errores:**
1. **Errores de compilación**: Detectados antes de ejecutar el programa
2. **Errores en tiempo de ejecución**: Ocurren durante la ejecución (excepciones)
3. **Errores lógicos**: El programa funciona pero no hace lo esperado

{{% note %}}
La depuración es una habilidad esencial:
- Los errores de compilación son los más fáciles de corregir (el compilador indica el problema)
- Los errores en tiempo de ejecución generan excepciones con mensajes de error
- Los errores lógicos son los más difíciles de encontrar (el programa no falla pero da resultados incorrectos)
- IntelliJ IDEA y otros IDEs proporcionan herramientas poderosas de depuración
- Entender los errores comunes acelera el desarrollo
{{% /note %}}

---

### Errores comunes de compilación

```java
// Error: punto y coma faltante
int x = 5
System.out.println(x);

// Error: llaves desbalanceadas
if (x > 0) {
    System.out.println("Positivo");
    // Falta llave de cierre

// Error: tipo incorrecto
int y = "Hola";  // No se puede asignar String a int

// Error: variable no declarada
z = 10;  // z no ha sido declarada

// Error: nombre mal escrito
System.out.prntln("Texto");  // Método inexistente
```

{{% note %}}
Errores comunes de compilación incluyen:
- Olvidar punto y coma al final de las instrucciones
- Llaves {} mal balanceadas
- Usar tipos incompatibles
- Usar variables no declaradas
- Errores ortográficos en nombres de métodos o variables
- Errores en mayúsculas/minúsculas (case sensitivity)
- El compilador generalmente señala la línea y el tipo de error
- Algunos IDEs marcan estos errores antes de compilar (análisis estático)
{{% /note %}}

---

### Excepciones comunes

```java
// ArrayIndexOutOfBoundsException
int[] array = {1, 2, 3};
System.out.println(array[3]);  // El índice 3 no existe

// NullPointerException
String texto = null;
System.out.println(texto.length());  // No se puede llamar métodos en null

// ArithmeticException
int division = 10 / 0;  // División por cero

// NumberFormatException
int numero = Integer.parseInt("abc");  // "abc" no es un número

// InputMismatchException
Scanner scanner = new Scanner(System.in);
int x = scanner.nextInt();  // Si el usuario ingresa texto
```

{{% note %}}
Las excepciones más comunes:
- ArrayIndexOutOfBoundsException: Acceso a índice fuera de rango
- NullPointerException: Llamada a método en referencia null
- ArithmeticException: Operaciones matemáticas inválidas
- NumberFormatException: Conversión inválida de String a número
- InputMismatchException: Entrada de usuario de tipo incorrecto

Estas excepciones incluyen mensajes y stack traces que ayudan a identificar:
- El tipo de excepción
- La línea donde ocurrió
- La secuencia de llamadas que llevó al error
{{% /note %}}

---

### Uso de println para depuración

Una técnica simple pero efectiva:

```java
public int calcularTotal(int[] precios) {
    System.out.println("Iniciando cálculo del total");
    
    int suma = 0;
    for (int i = 0; i < precios.length; i++) {
        System.out.println("Procesando índice " + i + ", valor: " + precios[i]);
        suma += precios[i];
    }
    
    System.out.println("Suma total: " + suma);
    return suma;
}
```

{{% note %}}
Usar println para depuración:
- Es simple pero muy útil para principiantes
- Permite seguir el flujo de ejecución paso a paso
- Muestra valores de variables en puntos críticos
- Ayuda a identificar dónde ocurren los problemas
- Desventajas: hay que eliminar o comentar los mensajes después
- Para aplicaciones más grandes, es preferible usar el depurador del IDE
{{% /note %}}

---

### Depuración con IntelliJ IDEA

1. **Puntos de interrupción (breakpoints):** Click en el margen izquierdo
2. **Iniciar sesión de depuración:** Click en "Debug" en lugar de "Run"
3. **Controles de ejecución:** 
   - Step Over (F8): Ejecutar la línea actual y pasar a la siguiente
   - Step Into (F7): Entrar en un método
   - Step Out (Shift+F8): Salir del método actual
   - Resume (F9): Continuar hasta el próximo breakpoint
4. **Inspección de variables:** Ver valores actuales en la ventana "Variables"

{{% note %}}
El depurador de IntelliJ IDEA es muy potente:
- Permite pausar la ejecución en puntos específicos
- Examinar el estado de las variables en ese momento
- Evaluar expresiones durante la pausa
- Modificar valores en tiempo de ejecución
- Ver la pila de llamadas (call stack)
- Usar condiciones en los breakpoints
- A diferencia de los println, no requiere modificar el código

Es recomendable que los estudiantes practiquen con el depurador desde el principio para familiarizarse con esta herramienta esencial.
{{% /note %}}

---

### Consejos para depuración efectiva

1. **Reproducir el error**: Encuentra pasos específicos que causan el problema
2. **Divide y vencerás**: Aísla la sección problemática
3. **Prueba con casos simples**: Reduce la complejidad
4. **Usa la depuración interactiva**: Breakpoints en puntos estratégicos
5. **Verifica tus suposiciones**: No asumas, confirma
6. **Lee cuidadosamente los mensajes de error**: Contienen pistas valiosas
7. **Busca patrones**: ¿Ocurre bajo ciertas condiciones?
8. **Toma descansos**: A veces la solución llega cuando te alejas

{{% note %}}
La depuración es tanto ciencia como arte:
- Desarrollar una mentalidad sistemática para encontrar errores
- La experiencia hace que sea más fácil reconocer patrones de error
- Aprender a leer y entender los mensajes de error acelera la resolución
- Documentar bugs y soluciones ayuda a evitar repetirlos
- El proceso de depuración enseña mucho sobre el funcionamiento del lenguaje
- Con práctica, se desarrolla intuición para anticipar problemas
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Ejercicio práctico: Contador de palabras

Crearemos un programa que analice un texto:
1. Contar número de palabras
2. Contar número de caracteres (sin espacios)
3. Encontrar la palabra más larga

```java
import java.util.Scanner;

public class ContadorPalabras {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Ingrese un texto:");
        String texto = scanner.nextLine();
        
        // Dividir el texto en palabras
        String[] palabras = texto.split("\\s+");
        
        // Contar palabras
        int numPalabras = palabras.length;
        
        // Contar caracteres (sin espacios)
        int numCaracteres = texto.replaceAll("\\s+", "").length();
        
        // Encontrar palabra más larga
        String palabraMasLarga = "";
        for (String palabra : palabras) {
            if (palabra.length() > palabraMasLarga.length()) {
                palabraMasLarga = palabra;
            }
        }
        
        // Mostrar resultados
        System.out.println("\nAnálisis completado:");
        System.out.println("Número de palabras: " + numPalabras);
        System.out.println("Número de caracteres (sin espacios): " + numCaracteres);
        System.out.println("Palabra más larga: '" + palabraMasLarga + "' (" + 
                          palabraMasLarga.length() + " caracteres)");
        
        scanner.close();
    }
}
```

{{% note %}}
Este ejercicio integra varios conceptos importantes:
- Uso de Scanner para entrada
- Manipulación de Strings con split() y replaceAll()
- Arrays para almacenar las palabras
- Bucles para analizar cada palabra
- Expresiones regulares básicas (\\s+ para espacios en blanco)

Posibles mejoras para discutir:
- Considerar signos de puntuación
- Normalizar mayúsculas/minúsculas
- Calcular frecuencia de palabras
- Encontrar palabras más comunes
{{% /note %}}

---

### Ejercicio práctico: Juego de adivinanzas

Crearemos un juego simple donde el jugador debe adivinar un número aleatorio:

```java
import java.util.Scanner;
import java.util.Random;

public class JuegoAdivinanza {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();
        
        // Generar número aleatorio entre 1 y 100
        int numeroSecreto = random.nextInt(100) + 1;
        int intentos = 0;
        boolean adivinado = false;
        
        System.out.println("¡Bienvenido al juego de adivinanzas!");
        System.out.println("He pensado un número entre 1 y 100.");
        
        while (!adivinado && intentos < 10) {
            System.out.print("Intento " + (intentos + 1) + ": Ingresa tu número: ");
            
            // Manejo de entrada inválida
            if (!scanner.hasNextInt()) {
                System.out.println("Por favor, ingresa un número válido.");
                scanner.next(); // Descartar entrada inválida
                continue;
            }
            
            int intento = scanner.nextInt();
            intentos++;
            
            if (intento < 1 || intento > 100) {
                System.out.println("Por favor, ingresa un número entre 1 y 100.");
            } else if (intento < numeroSecreto) {
                System.out.println("El número es mayor.");
            } else if (intento > numeroSecreto) {
                System.out.println("El número es menor.");
            } else {
                adivinado = true;
                System.out.println("¡Correcto! Has adivinado en " + intentos + " intentos.");
            }
        }
        
        if (!adivinado) {
            System.out.println("¡Has agotado tus 10 intentos! El número era: " + numeroSecreto);
        }
        
        scanner.close();
    }
}
```

{{% note %}}
Este ejercicio incorpora varios conceptos avanzados:
- Generación de números aleatorios con la clase Random
- Uso de bucles con condiciones múltiples
- Validación de entrada de usuario
- Manejo de estados con variables booleanas
- Límite de intentos
- Retroalimentación al usuario según su intento

Puntos para discutir:
- Cómo se manejan las entradas inválidas
- La importancia de validar la entrada de usuario
- Cómo hacer el juego más interesante (puntuación, dificultad ajustable)
- El uso de random.nextInt(100) + 1 para obtener números de 1 a 100
{{% /note %}}

{{% /section %}}

---

### Para la próxima clase...

- Tener instalado el JDK y IntelliJ IDEA
- Practicar los ejercicios vistos
- Repasar la sintaxis básica de Java
- Leer sobre los conceptos básicos de Orientación a Objetos

---

### ¿Preguntas?

---

[Regresar al listado de semanas]({{< ref "/poo/_index.md#/weekly-content" >}})