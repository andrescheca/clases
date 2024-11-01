+++
title = "Programación Orientada a Objetos - Sintaxis básica en Java"
outputs = ["Reveal"]
+++

## Semana 2

- Introducción a la sintaxis de Java
- Diferencias clave con Python
- Conceptos básicos de orientación a objetos

{{% note %}}
Objetivos de la semana:
- Entender las diferencias principales entre Java y Python
- Conocer la sintaxis básica de Java
- Introducir conceptos fundamentales de POO
{{% /note %}}

---

### Características de la Orientación a Objetos

{{% fragment class="bullet-point" %}}**1. Todo es parte de un objeto**: Los datos y comportamientos están unidos{{% /fragment %}}
{{% fragment class="bullet-point" %}}**2. Organización del Código**: Cada objeto maneja sus propios datos{{% /fragment %}}
{{% fragment class="bullet-point" %}}**3. Reutilización**: Podemos crear objetos similares fácilmente{{% /fragment %}}
{{% fragment class="bullet-point" %}}**4. Claridad**: El código refleja el mundo real{{% /fragment %}}

{{% note %}}
Conceptos fundamentales:
- Un objeto combina datos y acciones (como en Python)
- Los objetos son similares a cosas del mundo real
- Los objetos pueden interactuar entre sí
- El código se organiza en unidades lógicas (objetos)
{{% /note %}}

---

### Características Fundamentales de POO

La Programación Orientada a Objetos se basa en cuatro características principales:

1. **Encapsulación**: Ocultar los detalles internos
2. **Abstracción**: Modelar objetos del mundo real
3. **Herencia**: Reutilizar y extender código
4. **Polimorfismo**: Múltiples formas de comportamiento

{{% note %}}
Estas son las cuatro características fundamentales que hacen a la POO tan poderosa:
- Cada una resuelve un problema específico del desarrollo de software
- Se complementan entre sí
- Son la base para crear código mantenible y reutilizable
{{% /note %}}

---

### Encapsulación

**¿Qué es?** 
- Ocultar los detalles internos de un objeto para simplificar el uso
- Proteger los datos del acceso directo y evitar inconsistencias
- Agregar lógica de negocio transparente. `setEdad()` no debería aceptar negativos

**En Java se implementa con:**
- Modificadores de acceso: `public`, `private`, `protected`
- Métodos getters y setters

```java
class CuentaBancaria {
    private double saldo;  // Solo accesible dentro de la clase
    
    public void depositar(double monto) {
        if (monto > 0) {
            saldo += monto;
        }
    }
}
```

{{% note %}}
La encapsulación:
- Protege los datos de modificaciones no deseadas
- Permite validar datos antes de modificarlos
- Oculta la implementación interna
- Veremos más detalles en próximas clases
{{% /note %}}

---

### Abstracción

**¿Qué es?**
- Modelar objetos complejos de forma simplificada
- Enfocarse en lo importante, ignorar lo no esencial

**En Java se implementa con:**
- Clases abstractas (`abstract class`)
- Interfaces (`interface`)

```java
interface Vehiculo {
    void mover();  // Qué hace, no cómo lo hace
}

class Coche implements Vehiculo {
    public void mover() {
        // Implementación específica
    }
}
```

{{% note %}}
La abstracción:
- Simplifica problemas complejos
- Define qué hace un objeto, no cómo lo hace
- Permite crear modelos más fáciles de entender
- Estudiaremos interfaces y clases abstractas más adelante
{{% /note %}}

---

### Herencia

**¿Qué es?**
- Crear nuevas clases basadas en existentes
- Compartir código entre clases similares

**En Java se implementa con:**
- Palabra clave `extends`
- Herencia simple (una sola clase padre)

```java
class Animal {
    void comer() {
        // Implementación
    }
}

class Perro extends Animal {
    void ladrar() {
        // Implementación específica
    }
}
```

{{% note %}}
La herencia:
- Permite reutilizar código
- Crea jerarquías de clases
- En Java solo se puede heredar de una clase
- Veremos más sobre herencia en próximas sesiones
{{% /note %}}

{{% section %}}
---
### Polimorfismo

**¿Qué es?**
- Diferentes comportamientos para una misma acción
- Tratar objetos diferentes de manera uniforme

**En Java se implementa con:**
1. Sobrescritura (Override) - Polimorfismo de subtipo:
   - Redefinir métodos de la clase padre
   - Usar `@Override`
   - Ocurre en tiempo de ejecución

2. Sobrecarga (Overload) - Polimorfismo ad-hoc:
   - Múltiples versiones del mismo método
   - Diferentes parámetros
   - Ocurre cuando creamos clases

--- 

```java
class Animal {
    void hacerSonido() {
        // Implementación base
    }
}

class Perro extends Animal {
    // Sobrescritura: mismo método, diferente implementación
    @Override
    void hacerSonido() {
        System.out.println("Guau");
    }
    
    // Sobrecarga: mismo nombre, diferentes parámetros
    void hacerSonido(int veces) {
        for(int i = 0; i < veces; i++) {
            hacerSonido();
        }
    }
    
    void hacerSonido(String intensidad) {
        if(intensidad.equals("fuerte")) {
            System.out.println("GUAU!");
        } else {
            System.out.println("guau...");
        }
    }
}
```

{{% note %}}
El polimorfismo tiene dos formas principales:
1. Polimorfismo de subtipo (Override):
   - Permite que una clase hija redefina métodos de la clase padre
   - Útil para especializar comportamiento
   - Se decide en tiempo de ejecución

2. Polimorfismo ad-hoc (Overload):
   - Permite múltiples versiones del mismo método
   - Se diferencia por número o tipo de parámetros
   - Se decide en tiempo de compilación
   - No requiere herencia

Ambos tipos se estudiarán en detalle en próximas clases.
{{% /note %}}

{{% /section %}}

---

{{% section %}}
### Clase vs Objeto

**Clase**:
- Es el plano o plantilla (los planos en papel)
- Define atributos y comportamientos
- Es un concepto abstracto
- Se define una vez

**Objeto**:
- Es una instancia de una clase (la casa)
- Tiene valores específicos
- Es concreto y existe en memoria
- Se pueden crear muchos

---

```java
// Definición de una clase
class Coche {
    String marca;
    String modelo;
    
    void arrancar() {
        System.out.println("El coche arranca");
    }
}

// Creación de objetos
Coche coche1 = new Coche();  // Primer objeto
coche1.marca = "Toyota";
coche1.modelo = "Corolla";

Coche coche2 = new Coche();  // Segundo objeto
coche2.marca = "Honda";
coche2.modelo = "Civic";
```
{{% /section %}}

---

### Tipos de Datos en Java vs Python

{{% fragment class="bullet-point" %}}**Python:** Tipado dinámico, todo es un objeto{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Java:** Tipado estático, diferencia entre primitivos y objetos{{% /fragment %}}

Primitivos en Java:
```java
int numero = 42;        // Similar a Python pero debe declararse
boolean verdad = true;  // En Python es True
char caracter = 'a';    // En Python no existe char
```

{{% note %}}
Diferencias clave:
- Java requiere declarar el tipo de cada variable
- Los tipos no pueden cambiar después de declarados
- Java distingue entre tipos primitivos y objetos
- Python trata todo como objetos
{{% /note %}}

---

### Tipos Primitivos vs Clases Envolturas

{{% fragment class="bullet-point" %}}**Primitivos:** `byte`, `short`, `int`, `long`, `float`, `double`, `boolean`, `char`{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Clases Envolturas:** `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Boolean`, `Character`{{% /fragment %}}
{{% fragment class="bullet-point" %}}Son útiles cuando usamos colecciones{{% /fragment %}}

```java
// Primitivo
int numero = 42;

// Clase envoltura
Integer numeroObjeto = Integer.valueOf(42);
// Permite null
Integer nulo = null; // Válido
int primitivo = null; // ¡Error!
```

{{% note %}}
Diferencias importantes:
- Primitivos son más eficientes en memoria
- Clases envolturas permiten null
- Clases envolturas tienen métodos útiles
- Las colecciones solo aceptan clases envolturas
{{% /note %}}

---

### Collections en Java

**ArrayList**: Lista dinámica de elementos
- Permite elementos duplicados
- Mantiene el orden de inserción
- Acceso rápido por índice (como arrays)
- Puede crecer dinámicamente
- Ideal para: listas ordenadas, acceso frecuente por posición
- Limitación: búsquedas lentas (debe recorrer elementos)

```java
ArrayList<String> nombres = new ArrayList<>();
nombres.add("Ana");     // ["Ana"]
nombres.add("Ana");     // ["Ana", "Ana"] - permite duplicados
nombres.get(0);         // "Ana" - acceso por índice
```

{{% note %}}
ArrayList vs Arrays:
- ArrayList crece automáticamente, los arrays tienen tamaño fijo
- ArrayList solo acepta objetos, no primitivos
- ArrayList tiene métodos útiles como add(), remove(), contains()
- ArrayList ocupa más memoria que un array

ArrayList vs List en Python:
- Similar a las listas de Python en comportamiento
- Debe especificar tipo de datos (<String>, <Integer>, etc.)
- No permite mezclar tipos diferentes
{{% /note %}}

---

### HashSet en Java

**HashSet**: Colección de elementos únicos
- No permite duplicados
- No mantiene orden de inserción
- Búsqueda muy rápida
- Ideal para: eliminar duplicados, verificar existencia de elementos
- Limitación: no hay acceso por índice, no mantiene orden

```java
HashSet<String> nombres = new HashSet<>();
nombres.add("Ana");     // ["Ana"]
nombres.add("Ana");     // ["Ana"] - ignora duplicados
nombres.contains("Ana"); // true - búsqueda rápida
```

{{% note %}}
HashSet vs ArrayList:
- HashSet no permite duplicados, ArrayList sí
- HashSet es más rápido para buscar elementos
- HashSet no mantiene orden, ArrayList sí
- HashSet no permite acceso por índice

HashSet vs Set en Python:
- Comportamiento similar a set() de Python
- Mismas operaciones básicas (add, remove, contains)
- Java requiere especificar tipo de elementos
- No permite operaciones matemáticas de conjuntos directamente como en Python
{{% /note %}}

---

### Estructuras de Control: Diferencias con Python

#### For Loops

En Python:
```python
for i in range(5):
    print(i)

for nombre in nombres:
    print(nombre)
```

En Java:
```java
// Con índice
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}

// For-each (como en Python)
for (String nombre : nombres) {
    System.out.println(nombre);
}
```

{{% note %}}
Tipos de for en Java:
- For tradicional: control preciso de la iteración
- For-each: más simple, similar a Python
- No existe range() como en Python
- Los índices deben manejarse manualmente
{{% /note %}}

---

### While y Do-While

While (existe en ambos):
```java
while (condicion) {
    // código
}
```

Do-While (exclusivo de Java):
```java
do {
    // Se ejecuta al menos una vez
} while (condicion);
```

{{% note %}}
Diferencias con Python:
- While funciona igual en ambos lenguajes
- Do-while no existe en Python
- Do-while garantiza una ejecución
- Útil cuando necesitamos ejecutar código al menos una vez
{{% /note %}}

---

### Switch en Java (No existe en Python)

```java
String dia = "Lunes";
switch (dia) {
    case "Lunes":
        System.out.println("Primer día");
        break;
    case "Martes":
        System.out.println("Segundo día");
        break;
    default:
        System.out.println("Otro día");
}
```

{{% note %}}
Características del switch:
- Alternativa a múltiples if-else
- Requiere break para evitar continuar a otros casos
- Más eficiente que if-else en múltiples casos
- En Python se usa if-elif o diccionarios
{{% /note %}}

---

### Enumeraciones (No existen en Python)

```java
enum DiaSemana {
    LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO, DOMINGO
}

DiaSemana hoy = DiaSemana.LUNES;
```

{{% note %}}
Ventajas de enums:
- Conjunto fijo de valores posibles
- Previene errores de escritura
- Más seguro que usar strings
- Mejor rendimiento que strings
- En Python se usan constantes o la clase Enum
{{% /note %}}

---

### Strings en Java

Los Strings son **inmutables** - cada operación crea un nuevo String:

```java
String nombre = "Juan";
String nombreMayusculas = nombre.toUpperCase(); // Nuevo String
System.out.println(nombre);           // "Juan"
System.out.println(nombreMayusculas); // "JUAN"

// Concatenación crea nuevos objetos
String completo = nombre + " Pérez";  // Nuevo String
```

{{% note %}}
Inmutabilidad de Strings:
- Un String nunca cambia su contenido
- Cada operación crea un nuevo String
- El String original permanece igual
- Esto es similar a Python
- Ventaja: seguridad y consistencia
- Desventaja: puede ser ineficiente con muchas operaciones
{{% /note %}}

---

### Métodos de String

Cada método retorna un **nuevo** String:

```java
String texto = "Hola Mundo";

String mayusculas = texto.toUpperCase();    // "HOLA MUNDO"
String subcadena = texto.substring(0, 4);   // "Hola"
String[] palabras = texto.split(" ");       // ["Hola", "Mundo"]
boolean contiene = texto.contains("Mundo"); // true
int longitud = texto.length();             // 10

// El String original no cambia
System.out.println(texto); // "Hola Mundo"
```

{{% note %}}
Métodos importantes de String:
- toUpperCase()/toLowerCase(): convierte a mayúsculas/minúsculas
- substring(): extrae una porción del String
- split(): divide el String en un array
- contains(): verifica si contiene una subcadena
- length(): obtiene la longitud
- trim(): elimina espacios al inicio y final
- replace(): substituye caracteres o subcadenas

Importante recordar:
- Ninguno modifica el String original
- Siempre guardar el resultado si se necesita
- Similar a los métodos de strings en Python
{{% /note %}}

---

### Igualdad entre Objetos (Introducción)

- Para objetos, el operador `==` evalúa igualdad en referencias en memoria, no contenido
- En datos primitivos, el operador `==` sí funciona como intuitivamente pensaríamos que funciona

```java
String str1 = "Hola";
String str2 = "Hola";
String str3 = new String("Hola");

// NO hacer esto - comportamiento no confiable
System.out.println(str1 == str2);      // ¡No comparar Strings con ==!

// Forma correcta de comparar Strings
System.out.println(str1.equals(str2));  // true
System.out.println(str1.equals(str3));  // true
```

{{% note %}}
Comparación de Strings:
- == compara referencias (direcciones de memoria)
- equals() compara el contenido
- Siempre usar equals() para comparar Strings
- Nunca confiar en == para comparar Strings
- equals() es similar a == en Python para strings

Razones para usar equals():
- Comportamiento consistente
- Compara el contenido real
- Funciona con cualquier String
- Es la forma estándar en Java
{{% /note %}}

---

### Ejercicio Práctico: Sistema de Biblioteca

Crear un sistema simple que demuestre los conceptos vistos:

1. Usar enum para el estado del libro (DISPONIBLE, PRESTADO)
2. Usar ArrayList para gestionar una colección de libros
3. Mantener los datos organizados en una clase

```java
// Estados posibles de un libro
enum EstadoLibro {
    DISPONIBLE, PRESTADO
}

// Clase para representar un libro
class Libro {
    String titulo;
    String autor;
    EstadoLibro estado;

    Libro(String titulo, String autor) {
        this.titulo = titulo;
        this.autor = autor;
        this.estado = EstadoLibro.DISPONIBLE;
    }
}

// Clase para gestionar la biblioteca
class Biblioteca {
    ArrayList<Libro> libros;

    Biblioteca() {
        libros = new ArrayList<>();
    }

    void agregarLibro(Libro libro) {
        libros.add(libro);
    }

    void prestarLibro(Libro libro) {
        libro.estado = EstadoLibro.PRESTADO;
    }
}
```

{{% note %}}
Conceptos utilizados:
- Enums para estados fijos
- ArrayList para colección de libros
- Clases para organizar datos
- Métodos para operaciones
- Los estudiantes deben practicar:
  1. Crear las clases
  2. Instanciar objetos
  3. Usar los métodos
  4. Verificar estados
{{% /note %}}

---

### Uso del Sistema de Biblioteca

```java
public class Main {
    public static void main(String[] args) {
        // Crear una biblioteca
        Biblioteca biblioteca = new Biblioteca();
        
        // Crear algunos libros
        Libro libro1 = new Libro("Don Quijote", "Cervantes");
        Libro libro2 = new Libro("Cien años de soledad", "García Márquez");
        
        // Agregar libros a la biblioteca
        biblioteca.agregarLibro(libro1);
        biblioteca.agregarLibro(libro2);
        
        // Prestar un libro
        biblioteca.prestarLibro(libro1);
    }
}
```

{{% note %}}
Puntos importantes:
- Creación de objetos con new
- Uso de métodos de clase
- Gestión de estados
- Interacción entre objetos
- Este ejemplo integra:
  - Enums
  - ArrayList
  - Clases y objetos
  - Métodos
{{% /note %}}