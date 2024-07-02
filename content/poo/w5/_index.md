+++
title = "Introducción a Patrones de Diseño en Java"
outputs = ["Reveal"]
+++

## Semana 5

- Introducción a Patrones de Diseño en Java

---

### Métodos de Instancia

{{% fragment class="bullet-point small-text-size" %}}Son métodos asociados a instancias específicas de una clase.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Operan sobre los datos únicos de cada objeto creado a partir de la clase.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Pueden acceder y modificar variables de instancia.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Se definen sin el modificador `static`.{{% /fragment %}}

---

### Ejemplo de Métodos de Instancia

```java
public class Persona {
    private String nombre;
    private int edad;

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    public void saludar() {
        System.out.println("Hola, soy " + nombre);
    }

    public void cumplirAnios() {
        edad++;
    }

    public int getEdad() {
        return edad;
    }
}
```
---

### Métodos y Propiedades de Clase
{{% fragment class="bullet-point small-text-size" %}}Son métodos y propiedades que pertenecen a la clase en sí misma, no a las instancias individuales.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Pueden ser accesibles sin necesidad de crear una instancia de la clase.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Se definen con el modificador static.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Comparten datos entre todas las instancias de la clase.{{% /fragment %}}

---
### Ejemplo de Métodos y Propiedades de Clase

```java
public class Contador {
    private static int contador = 0;

    public Contador() {
        contador++;
    }

    public static int getContador() {
        return contador;
    }
}

// Uso de métodos de clase
public class PruebaContador {
    public static void main(String[] args) {
        Contador c1 = new Contador();
        Contador c2 = new Contador();
        Contador c3 = new Contador();

        System.out.println("Número de instancias creadas: " + Contador.getContador());
    }
}
```
---

### Diferencias Clave

{{% fragment class="bullet-point small-text-size" %}}Los métodos de instancia operan en datos únicos de cada objeto.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Los métodos y propiedades de clase son compartidos entre todas las instancias y pueden ser accesibles sin instancia.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Los métodos de clase pueden modificar variables estáticas compartidas entre todas las instancias.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}El acceso a métodos de clase se realiza a través del nombre de la clase, no de una instancia específica.{{% /fragment %}}

---

### ¿Qué son los Patrones de Diseño?

{{% fragment class="bullet-point small-text-size" %}}Los patrones de diseño son soluciones reutilizables a problemas comunes en el diseño de software.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Proporcionan un vocabulario común para describir y discutir estructuras y procesos de diseño.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Ayudan a mejorar la flexibilidad, la reusabilidad y la mantenibilidad del código.{{% /fragment %}}

---

### Tipos de Patrones de Diseño

{{% fragment class="bullet-point small-text-size" %}}Patrones de creación: Abstrae el proceso de instanciación. Ejemplos: Singleton, Builder.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Patrones estructurales: Se centran en cómo las clases y objetos se componen para formar estructuras más grandes. Ejemplos: Adapter, Decorator.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Patrones de comportamiento: Tratan cómo clases y objetos interactúan y distribuyen responsabilidades. Ejemplos: Observer, Strategy.{{% /fragment %}}

---

### Singleton

{{% fragment class="bullet-point small-text-size" %}}Garantiza que una clase tenga una sola instancia y proporciona un punto de acceso global a ella.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Útil cuando solo se necesita una única instancia de una clase en todo el sistema.{{% /fragment %}}


---

### Ejemplo de Singleton

```java
public class Singleton {
    private static Singleton instance;

    // Constructor privado para evitar instanciación directa
    private Singleton() {
    }

    // Método estático para obtener la única instancia de Singleton
    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }

    // Métodos adicionales de la instancia Singleton (opcional)
    public void realizarAccion() {
        System.out.println("Realizando acción en Singleton");
    }
}

// Uso del Singleton
public class TestSingleton {
    public static void main(String[] args) {
        // No se puede crear una instancia directamente
        // Singleton s = new Singleton(); // Esto daría un error

        // Se obtiene la instancia única a través del método estático getInstance()
        Singleton s1 = Singleton.getInstance();
        Singleton s2 = Singleton.getInstance();

        // s1 y s2 son la misma instancia
        System.out.println(s1 == s2); // Debería imprimir true

        // Uso de métodos de la instancia Singleton
        s1.realizarAccion();
        s2.realizarAccion();
    }
}
```

---

### Builder

{{% fragment class="bullet-point small-text-size" %}}Separar la construcción de un objeto complejo de su representación.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Permite crear diferentes tipos y representaciones de un objeto utilizando el mismo proceso de construcción.{{% /fragment %}}

---

### Ejemplo de Builder

```java
// Producto que se va a construir
public class Pizza {
    private String masa;
    private String salsa;
    private String topping;

    public Pizza(String masa, String salsa, String topping) {
        this.masa = masa;
        this.salsa = salsa;
        this.topping = topping;
    }

    @Override
    public String toString() {
        return "Pizza: Masa=" + masa + ", Salsa=" + salsa + ", Topping=" + topping;
    }
}

// Builder abstracto
public abstract class PizzaBuilder {
    protected String masa;
    protected String salsa;
    protected String topping;

    public abstract Pizza build();

    public PizzaBuilder setMasa(String masa) {
        this.masa = masa;
        return this;
    }

    public PizzaBuilder setSalsa(String salsa) {
        this.salsa = salsa;
        return this;
    }

    public PizzaBuilder setTopping(String topping) {
        this.topping = topping;
        return this;
    }
}

// Concrete Builder
public class HawaiianPizzaBuilder extends PizzaBuilder {
    @Override
    public Pizza build() {
        return new Pizza(masa, salsa, "Jamón y piña");
    }
}

// Director que maneja el builder
public class Cocina {
    private PizzaBuilder builder;

    public void setBuilder(PizzaBuilder builder) {
        this.builder = builder;
    }

    public Pizza getPizza() {
        return builder.build();
    }
}

// Ejemplo de uso del Builder
public class Cliente {
    public static void main(String[] args) {
        Cocina cocina = new Cocina();
        PizzaBuilder builder = new HawaiianPizzaBuilder();

        cocina.setBuilder(builder);
        Pizza pizza = cocina.getPizza();

        System.out.println(pizza);
    }
}
```

---

### Adapter

{{% fragment class="bullet-point small-text-size" %}}Permite que interfaces incompatibles trabajen juntas.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Convierte la interfaz de una clase en otra interfaz que un cliente espera.{{% /fragment %}}

---

### Ejemplo de Adapter

```java
// Interfaz MediaPlayer
public interface MediaPlayer {
    void play(String tipo, String archivo);
}

// Clase AudioPlayer implementando MediaPlayer
public class AudioPlayer implements MediaPlayer {
    @Override
    public void play(String tipo, String archivo) {
        if (tipo.equalsIgnoreCase("mp3")) {
            System.out.println("Reproduciendo archivo MP3: " + archivo);
        } else if (tipo.equalsIgnoreCase("mp4") || tipo.equalsIgnoreCase("vlc")) {
            MediaAdapter adapter = new MediaAdapter(tipo);
            adapter.play(tipo, archivo);
        } else {
            System.out.println("Formato no soportado: " + tipo);
        }
    }
}

// Interfaz AdvancedMediaPlayer
public interface AdvancedMediaPlayer {
    void playVlc(String archivo);
    void playMp4(String archivo);
}

// Clase concreta que implementa AdvancedMediaPlayer
public class VlcPlayer implements AdvancedMediaPlayer {
    @Override
    public void playVlc(String archivo) {
        System.out.println("Reproduciendo archivo VLC: " + archivo);
    }

    @Override
    public void playMp4(String archivo) {
        // No hace nada
    }
}

// Otra clase concreta que implementa AdvancedMediaPlayer
public class Mp4Player implements AdvancedMediaPlayer {
    @Override
    public void playVlc(String archivo) {
        // No hace nada
    }

    @Override
    public void playMp4(String archivo) {
        System.out.println("Reproduciendo archivo MP4: " + archivo);
    }
}

// Adaptador MediaAdapter que implementa MediaPlayer
public class MediaAdapter implements MediaPlayer {
    private AdvancedMediaPlayer advancedMediaPlayer;

    public MediaAdapter(String tipo) {
        if (tipo.equalsIgnoreCase("vlc")) {
            advancedMediaPlayer = new VlcPlayer();
        } else if (tipo.equalsIgnoreCase("mp4")) {
            advancedMediaPlayer = new Mp4Player();
        }
    }

    @Override
    public void play(String tipo, String archivo) {
        if (tipo.equalsIgnoreCase("vlc")) {
            advancedMediaPlayer.playVlc(archivo);
        } else if (tipo.equalsIgnoreCase("mp4")) {
            advancedMediaPlayer.playMp4(archivo);
        }
    }
}

// Ejemplo de uso del Adapter
public class Cliente {
    public static void main(String[] args) {
        AudioPlayer audioPlayer = new AudioPlayer();

        audioPlayer.play("mp3", "cancion.mp3");
        audioPlayer.play("mp4", "pelicula.mp4");
        audioPlayer.play("vlc", "serie.vlc");
        audioPlayer.play("avi", "video.avi"); // Este formato no está soportado
    }
}
```

---

### Decorator

{{% fragment class="bullet-point small-text-size" %}}Añade funcionalidad a objetos existentes dinámicamente.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Es flexible ya que permite añadir funcionalidades sin modificar clases existentes.{{% /fragment %}}

---

### Ejemplo de Decorator

```java
// Interfaz Componente
public interface Cafe {
    String descripcion();
    double precio();
}

// Clase concreta Componente
public class CafeSimple implements Cafe {
    @Override
    public String descripcion() {
        return "Café simple";
    }

    @Override
    public double precio() {
        return 1.0;
    }
}

// Decorador abstracto
public abstract class DecoradorCafe implements Cafe {
    protected Cafe cafeDecorado;

    public DecoradorCafe(Cafe cafeDecorado) {
        this.cafeDecorado = cafeDecorado;
    }

    @Override
    public String descripcion() {
        return cafeDecorado.descripcion();
    }

    @Override
    public double precio() {
        return cafeDecorado.precio();
    }
}

// Decoradores concretos
public class Leche extends DecoradorCafe {
    public Leche(Cafe cafeDecorado) {
        super(cafeDecorado);
    }

    @Override
    public String descripcion() {
        return cafeDecorado.descripcion() + ", Leche";
    }

    @Override
    public double precio() {
        return cafeDecorado.precio() + 0.5;
    }
}

public class Chocolate extends DecoradorCafe {
    public Chocolate(Cafe cafeDecorado) {
        super(cafeDecorado);
    }

    @Override
    public String descripcion() {
        return cafeDecorado.descripcion() + ", Chocolate";
    }

    @Override
    public double precio() {
        return cafeDecorado.precio() + 0.7;
    }
}

// Cliente
public class Cliente {
    public static void main(String[] args) {
        // Café simple
        Cafe cafeSimple = new CafeSimple();
        System.out.println("Descripción: " + cafeSimple.descripcion());
        System.out.println("Precio: $" + cafeSimple.precio());

        // Café con leche
        Cafe cafeConLeche = new Leche(new CafeSimple());
        System.out.println("Descripción: " + cafeConLeche.descripcion());
        System.out.println("Precio: $" + cafeConLeche.precio());

        // Café con leche y chocolate
        Cafe cafeConLecheYChocolate = new Chocolate(new Leche(new CafeSimple()));
        System.out.println("Descripción: " + cafeConLecheYChocolate.descripcion());
        System.out.println("Precio: $" + cafeConLecheYChocolate.precio());
    }
}
```

---

### Observer

{{% fragment class="bullet-point small-text-size" %}}Define una dependencia uno a muchos entre objetos.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Cuando un objeto cambia de estado, todos los objetos que dependen de él son notificados y actualizados automáticamente.{{% /fragment %}}

---

### Ejemplo de Observer

```java
import java.util.ArrayList;
import java.util.List;

// Interfaz Observable (Subject)
interface Observable {
    void addObserver(Observer observer);
    void removeObserver(Observer observer);
    void notifyObservers();
}

// Interfaz Observer
interface Observer {
    void update(String message);
}

// Clase concreta Observable (Subject)
class WeatherStation implements Observable {
    private List<Observer> observers = new ArrayList<>();
    private String weatherMessage;

    public void setWeatherMessage(String weatherMessage) {
        this.weatherMessage = weatherMessage;
        notifyObservers();
    }

    @Override
    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(weatherMessage);
        }
    }
}

// Clase concreta Observer (ConcreteObserver)
class WeatherObserver implements Observer {
    private String observerName;

    public WeatherObserver(String observerName) {
        this.observerName = observerName;
    }

    @Override
    public void update(String message) {
        System.out.println(observerName + " ha recibido el siguiente mensaje del clima: " + message);
    }
}

// Ejemplo de uso del patrón Observer
public class Main {
    public static void main(String[] args) {
        WeatherStation weatherStation = new WeatherStation();

        // Crear observadores
        WeatherObserver observer1 = new WeatherObserver("Observer 1");
        WeatherObserver observer2 = new WeatherObserver("Observer 2");

        // Agregar observadores a la estación meteorológica
        weatherStation.addObserver(observer1);
        weatherStation.addObserver(observer2);

        // Cambiar el estado del tiempo y notificar a los observadores
        weatherStation.setWeatherMessage("Hoy será un día soleado.");

        // Remover un observador (observer2)
        weatherStation.removeObserver(observer2);

        // Cambiar el estado del tiempo nuevamente
        weatherStation.setWeatherMessage("Se esperan lluvias mañana.");
    }
}
```
---

### Ejercicio 1: Implementación del Patrón Singleton
{{% fragment class="bullet-point small-text-size" %}}Implementa una clase `Configuracion` que utilice el patrón Singleton. Esta clase debe tener una única instancia y almacenar configuraciones del sistema como URL de la base de datos y el nombre de la aplicación.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}La clase debe tener métodos para obtener y modificar estas configuraciones.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Crea una clase `TestConfiguracion` para demostrar que solo se puede crear una instancia de `Configuracion`.{{% /fragment %}}

---

### Ejercicio 2: Implementación del Patrón Builder (1/2)

{{% fragment class="bullet-point small-text-size" %}}Implementa una clase `Computadora` con los siguientes atributos: `procesador`, `ram`, `almacenamiento` y `tarjetaGrafica`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Utiliza el patrón Builder para crear instancias de `Computadora`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}La clase `ComputadoraBuilder` debe permitir la construcción paso a paso de una instancia de `Computadora`.{{% /fragment %}}


---

### Ejercicio 2: Implementación del Patrón Builder (2/2)

{{% fragment class="bullet-point small-text-size" %}}Crea una clase `TestComputadora` para construir y mostrar diferentes configuraciones de computadoras usando el patrón Builder.{{% /fragment %}}

---

### Ejercicio 3: Implementación del Patrón Decorator (1/2) 

{{% fragment class="bullet-point small-text-size" %}}Implementa una clase `Pizza` con los siguientes atributos: `descripcion` y `precio`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Crea una interfaz `Pizza` con los métodos `getDescripcion` y `getPrecio`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Implementa una clase concreta `PizzaBasica` que represente una pizza simple.{{% /fragment %}}

--- 

### Ejercicio 3: Implementación del Patrón Decorator (2/2)
{{% fragment class="bullet-point small-text-size" %}}Crea un decorador abstracto `PizzaDecorator` que implemente la interfaz `Pizza` y tenga un campo de tipo `Pizza`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Implementa decoradores concretos como `QuesoExtra`, `Tomate` y `Jamon`, que añadan funcionalidad a la pizza básica.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Crea una clase `TestPizza` para demostrar la creación de una pizza con diferentes ingredientes utilizando los decoradores.{{% /fragment %}}