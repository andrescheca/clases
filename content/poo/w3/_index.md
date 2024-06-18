+++
title = "Programación Orientada a Objetos - Encapsulamiento y Modificadores de Acceso"
outputs = ["Reveal"]
+++

## Semana 3

- Encapsulamiento y Modificadores de Acceso

---

### Encapsulamiento

{{% fragment class="bullet-point" %}}El encapsulamiento es uno de los cuatro principios fundamentales de la programación orientada a objetos.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Consiste en ocultar los datos (atributos) de un objeto de acceso directo desde fuera de la clase.{{% /fragment %}}

---

### Beneficios del Encapsulamiento

{{% fragment class="bullet-point" %}}Protege la integridad de los datos dentro de la clase.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Permite modificar una parte del código sin afectar otras partes del programa.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Facilita la mantenibilidad y la escalabilidad del software.{{% /fragment %}}

---

### Modificadores de Acceso

{{% fragment class="bullet-point" %}}Java proporciona varios modificadores de acceso para controlar la visibilidad de las clases, métodos y variables.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Los principales son: `private`, `public`, `protected`, y sin modificador (default).{{% /fragment %}}

---

### Modificador `private`

{{% fragment class="bullet-point" %}}El nivel de acceso más restrictivo.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Solo los métodos dentro de la misma clase pueden acceder a miembros privados.{{% /fragment %}}

---

### Modificador `public`

{{% fragment class="bullet-point" %}}Los miembros declarados como `public` son accesibles desde cualquier otra clase.{{% /fragment %}}

---

### Modificador `protected`

{{% fragment class="bullet-point" %}}Los miembros `protected` son accesibles dentro de la misma clase, en clases derivadas, y en el mismo paquete.{{% /fragment %}}

---

### Sin Modificador (Default)

{{% fragment class="bullet-point" %}}Si no se especifica un modificador de acceso, se aplica el acceso por defecto.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Visible solo dentro del paquete en el que se declara la clase.{{% /fragment %}}

---

### Ejemplo con un grupo de clases

```java
// Archivo: Animal.java
public class Animal {
    // Campo con modificador default (visible solo dentro del paquete)
    String name;

    // Campo con modificador protected
    protected int age;

    // Campo con modificador public
    public boolean isDomestic;

    // Constructor
    public Animal(String name, int age, boolean isDomestic) {
        this.name = name;
        this.age = age;
        this.isDomestic = isDomestic;
    }

    // Método con modificador default
    void displayInfo() {
        System.out.println("Nombre: " + name + ", Edad: " + age + ", Doméstico: " + isDomestic);
    }
}

// Archivo: Dog.java (en el mismo paquete)
public class Dog extends Animal {

    // Constructor
    public Dog(String name, int age, boolean isDomestic) {
        super(name, age, isDomestic);
    }

    // Método para acceder a campos protected y default desde una subclase
    public void printDetails() {
        System.out.println("Perro - Nombre: " + name + ", Edad: " + age);
        displayInfo();
    }
}

// Archivo: TestAnimals.java (en el mismo paquete)
public class TestAnimals {
    public static void main(String[] args) {
        Animal myAnimal = new Animal("Leo", 3, true);
        Dog myDog = new Dog("Rex", 5, true);

        // Acceso directo a miembros public
        System.out.println("Es doméstico: " + myDog.isDomestic);

        // Acceso a métodos default
        myAnimal.displayInfo();

        // Acceso a métodos y campos a través de la subclase
        myDog.printDetails();
    }
}
```

---

### Ejercicio en clase (1/2)

***Encapsulamiento y Modificadores de Acceso con Clases de Vehículos***
{{% fragment class="bullet-point small-text-size" %}}Crea una clase base llamada `Vehiculo` con propiedades como `marca` (public), `modelo` (protected) y un método para mostrar detalles (default).{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Deriva dos clases de `Vehiculo`: `Coche` y `Motocicleta`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Añade a `Coche` una propiedad `numPuertas` (public) y a `Motocicleta` una propiedad `tipo` (public) que indique si es de carretera o montaña.{{% /fragment %}}

---

### Ejercicio en clase (2/2)

{{% fragment class="bullet-point small-text-size" %}}Implementa en ambas clases un método `arrancar()` que sea public y que muestre un mensaje indicando que el vehículo está arrancando, incluyendo el modelo y el tipo de vehículo.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}En cada clase derivada, incluye un constructor que inicialice todas las propiedades, incluyendo las de la clase base.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Crea una clase `PruebaVehiculos` donde se inicialicen instancias de `Coche` y `Motocicleta`, mostrando sus detalles y utilizando el método `arrancar` para demostrar el efecto de los diferentes modificadores de acceso.{{% /fragment %}}
