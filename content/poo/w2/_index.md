+++
title = "Programación Orientada a Objetos - Sintaxis básica en Java"
outputs = ["Reveal"]
+++

## Semana 2

- Introducción a la sintaxis de Java
- Conceptos básicos de orientación a objetos.

---

### Declaración de Variables en Java

{{% fragment class="bullet-point" %}}Declarar una variable significa asignarle un tipo y, opcionalmente, un valor inicial.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Sintaxis: <br>`tipo nombreVariable = valor;`{{% /fragment %}}
{{% fragment class="bullet-point" %}}Ejemplos: <br>`int edad = 30;`, <br/>`String nombre = "Ana";`{{% /fragment %}}

---

### Estructuras Condicionales

{{% fragment class="bullet-point" %}}Permiten ejecutar diferentes bloques de código según una condición.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`if`, `else if`, `else` son las estructuras básicas.{{% /fragment %}}

---

### Estructuras Condicionales (2)
Ejemplo: 

```java
if (edad > 18){ 
    System.out.println("Mayor de edad"); 
}else{ 
    System.out.println("Menor de edad"); 
}
```


--- 

### Lazos en Java

{{% fragment class="bullet-point" %}}`for`, `while`, y `do-while` son los principales tipos de lazos.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`for` es útil para ciclos con un número determinado de iteraciones.{{% /fragment %}}

---

### Lazos en Java (2)

- El lazo `for-each` es usado para recorrer elementos en una colección 

```java
for(String nombre : nombres){ 
    System.out.println(nombre); 
}
```

---

### Clases Comunes en la Librería Standard de Java

{{% fragment class="bullet-point" %}}`String` para cadenas de texto.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`Math` para operaciones matemáticas.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`ArrayList` y `HashMap` para estructuras de datos dinámicas.{{% /fragment %}}

---

### Diferencia entre int e Integer

{{% fragment class="bullet-point" %}}`int` es un tipo primitivo y `Integer` es una clase envoltura.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`Integer` permite usar métodos y aceptar `null` como valor.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Autoboxing y unboxing convierten entre `int` e `Integer` automáticamente.{{% /fragment %}}

---

### Ejercicio en Clase: Manipulación de Strings

{{% fragment class="bullet-point small-text-size" %}} Crea una clase `ManipulacionString`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}} Dentro de esta clase, escribe un método que acepte un string como parámetro y devuelva el mismo string pero con todas las vocales convertidas a mayúsculas.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}En el método `main`, prueba tu método con diferentes strings y muestra los resultados.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Ejemplo de Salida:<br> Entrada: `"Hola Mundo"`<br> Salida: `"HOlA MUndO"`{{% /fragment %}}

---

### Clases vs Programación Estructurada

{{% fragment class="bullet-point" %}}Programación Estructurada: Centrada en funciones y procedimientos que operan sobre datos.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Programación Orientada a Objetos: Centrada en objetos que contienen tanto datos (atributos) como funciones (métodos).{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Ventajas de POO:** Abstracción, Encapsulación, Herencia, y Polimorfismo facilitan la reutilización y mantenimiento del código.{{% /fragment %}}

---

### Fundamentos de Clases en Java

{{% fragment class="bullet-point" %}}**Definición:** Una clase en Java define las propiedades y métodos que tendrán los objetos creados a partir de ella.{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Propiedades:** Variables que almacenan el estado de un objeto.{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Métodos:** Funciones o procedimientos que definen las acciones que puede realizar un objeto.{{% /fragment %}}

---

### ¿Qué es un Constructor?

{{% fragment class="bullet-point" %}}Un constructor es un método especial de una clase que se llama automáticamente al crear un objeto.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Su nombre debe ser igual al de la clase y no tiene tipo de retorno.{{% /fragment %}}

---

### Sobrecarga de Constructores

{{% fragment class="bullet-point" %}}La sobrecarga permite definir múltiples constructores con diferentes listas de parámetros.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Facilita la creación de objetos en diferentes estados o con diferentes inicializaciones.{{% /fragment %}}

---

### Clase Persona en Java

{{% note %}}
javac Persona.java Main.java
java Main
{{% /note %}}

```java
// Persona.java
public class Persona {
    private String nombre;
    private int edad;

    // Constructor sin parámetros
    public Persona() {
        this.nombre = "Desconocido";
        this.edad = 0;
    }

    // Constructor con un parámetro
    public Persona(String nombre) {
        this.nombre = nombre;
        this.edad = 0;
    }

    // Constructor con dos parámetros
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    // Método para mostrar datos de la persona
    public void mostrarInfo() {
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
    }
}

// Demostración en el método main (Main.java)
public class Main {
    public static void main(String[] args) {
        Persona persona1 = new Persona();
        Persona persona2 = new Persona("Ana");
        Persona persona3 = new Persona("Carlos", 25);

        persona1.mostrarInfo();
        persona2.mostrarInfo();
        persona3.mostrarInfo();
    }
}
```

---

### Introducción a Paquetes y Clases en Java

{{% fragment class="bullet-point" %}}Los paquetes organizan clases e interfaces en grupos lógicos.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`package com.midominio;` al inicio del archivo de clase.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Permiten evitar conflictos de nombres y controlar el acceso.{{% /fragment %}}

---

### Diferencia entre Clase y Objeto

{{% fragment class="bullet-point" %}}Clase: es el molde o plantilla para crear objetos.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Objeto: es una instancia de una clase.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Ejemplo: <br> `Persona p = new Persona();` donde <br> `Persona` es la clase y `p` es el objeto.{{% /fragment %}}

---

### Punto de Entrada a una Clase y a un Jar

{{% fragment class="bullet-point" %}}El método `public static void main(String[] args)` es el punto de entrada.{{% /fragment %}}
{{% fragment class="bullet-point" %}}`java MiClase` para ejecutar el `.class`,<br> `java -jar MiArchivo.jar` para ejecutar el JAR.{{% /fragment %}}

---

### Conceptos Clave en Poo

{{% fragment class="bullet-point" %}}**Abstracción**: Simplificar complejidades reales modelando clases apropiadas a la problemática.{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Encapsulación**: Ocultar los detalles internos del funcionamiento de una clase, exponiendo solo lo necesario al exterior.{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Herencia**: Mecanismo por el cual una clase (hija) puede heredar características (atributos y métodos) de otra clase (padre).{{% /fragment %}}
{{% fragment class="bullet-point" %}}**Polimorfismo**: Capacidad de un método para hacer cosas diferentes basadas en el objeto que lo está ejecutando.{{% /fragment %}}

---

### Conceptos Clave en POO 

{{% note %}}
Abstracción: La clase Vehiculo es abstracta y no se puede instanciar directamente, lo que permite abstraer el concepto general de un vehículo.
Encapsulación: Los detalles específicos de cada vehículo, como la marca y el número de puertas en el caso del coche, están ocultos y protegidos dentro de la clase. Se proporcionan métodos públicos para acceder a estos datos de forma controlada.
Herencia: Coche y Motocicleta heredan de Vehiculo y pueden utilizar sus métodos y propiedades, además de añadir los suyos propios.
Polimorfismo: Coche y Motocicleta tienen diferentes implementaciones del método mover, demostrando que un método puede realizar acciones distintas dependiendo de la instancia de clase que lo invoque.
{{% /note %}}

```java
// Abstracción: Clase abstracta Vehiculo (Vehiculo.java)
abstract class Vehiculo {
    private String marca; // Encapsulación: campo privado

    public Vehiculo(String marca) { // Constructor
        this.marca = marca;
    }

    public String getMarca() { // Encapsulación: método público para acceder a la marca
        return marca;
    }

    // Método abstracto que deben implementar las subclases
    public abstract void mover();
}

// Herencia: Clase Coche hereda de Vehiculo (Coche.java)
class Coche extends Vehiculo {
    private int numeroDePuertas;

    public Coche(String marca, int numeroDePuertas) {
        super(marca);
        this.numeroDePuertas = numeroDePuertas;
    }

    // Implementación del método abstracto, mostrando Polimorfismo
    @Override
    public void mover() {
        System.out.println("El coche " + getMarca() + " está en movimiento.");
    }
}

// Herencia: Clase Motocicleta hereda de Vehiculo (Motocicileta.java)
class Motocicleta extends Vehiculo {
    public Motocicleta(String marca) {
        super(marca);
    }

    // Implementación del método abstracto, mostrando Polimorfismo
    @Override
    public void mover() {
        System.out.println("La motocicleta " + getMarca() + " está en movimiento.");
    }
}

// Demostración (Main.java)
public class Main {
    public static void main(String[] args) {
        Vehiculo miCoche = new Coche("Toyota", 4);
        Vehiculo miMoto = new Motocicleta("Harley Davidson");

        miCoche.mover(); // Polimorfismo en acción
        miMoto.mover(); // Polimorfismo en acción
    }
}
```
---

### Ejercicio en Clase: 
***Uso de Constructores y Herencia con Clases de Animales***
{{% fragment class="bullet-point small-text-size" %}}Crea una clase base llamada `Animal` con propiedades comunes como `nombre` y `edad`, y un constructor para inicializarlas.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Deriva dos clases de `Animal`: `Perro` y `Gato`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Añade propiedades específicas a cada clase derivada, como `raza` para `Perro` y `color` para `Gato`, y usa constructores para inicializar todas las propiedades.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size"%}}Implementa un método `emitirSonido()` en ambas clases que muestre un mensaje diferente dependiendo del animal.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}En el método `main`, crea instancias de `Perro` y `Gato` y muestra sus detalles y el sonido que emiten.{{% /fragment %}}

---

### Correr una Aplicación con el .class y Generar un .jar

{{% fragment class="bullet-point" %}}Compilar con `javac MiClase.java` para obtener `MiClase.class`.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Ejecutar con `java MiClase`.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Empaquetar en JAR con `jar cvf MiArchivo.jar MiClase.class`.{{% /fragment %}}
