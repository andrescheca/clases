+++
title = "Excepciones y Patrones de Diseño en Java"
subtitle = "Manejo de Errores y Fundamentos de Patrones"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 6: Excepciones y Patrones de Diseño

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Comprender el sistema de excepciones en Java {{% /fragment %}}
{{% fragment class="bullet-point" %}} Practicar con excepciones verificadas y no verificadas {{% /fragment %}}
{{% fragment class="bullet-point" %}} Crear excepciones personalizadas {{% /fragment %}}
{{% fragment class="bullet-point" %}} Introducción a los patrones de diseño {{% /fragment %}}
{{% fragment class="bullet-point" %}} Categorización y ejemplos de patrones {{% /fragment %}}

---

{{% section %}}

### Jerarquía de Excepciones en Java

```java
Throwable
├── Error
│   ├── OutOfMemoryError
│   ├── StackOverflowError
│   └── ...
└── Exception
    ├── IOException (checked)
    │   ├── FileNotFoundException
    │   └── EOFException
    ├── SQLException (checked)
    └── RuntimeException (unchecked)
        ├── NullPointerException
        ├── ArrayIndexOutOfBoundsException
        └── ArithmeticException
```

{{% note %}}
Puntos clave de la jerarquía:
- Throwable es la raíz de todas las excepciones
- Error representa problemas serios que la aplicación no debería intentar manejar
- Exception es la clase base para excepciones que podemos manejar
- RuntimeException y sus subclases son unchecked (no requieren try-catch)
- Las demás excepciones son checked (requieren try-catch o throws)
{{% /note %}}

---

### Excepciones Verificadas (Checked)

```java
public class FileProcessor {
    public void readFile(String path) throws IOException {
        File file = new File(path);
        if (!file.exists()) {
            throw new FileNotFoundException("Archivo no encontrado: " + path);
        }
        
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line = reader.readLine(); // Puede lanzar IOException
        
        if (line == null) {
            throw new IOException("El archivo está vacío");
        }
    }
}
```

{{% note %}}
Características de excepciones verificadas:
- El compilador obliga a manejarlas
- Representan condiciones recuperables
- Comunes en operaciones I/O, base de datos, red
- Deben declararse en la firma del método con throws
- Se usan para condiciones externas al programa
- Ejemplos: FileNotFoundException, SQLException, IOException
{{% /note %}}

---

### Excepciones No Verificadas (Unchecked)

```java
public class VariousTasks {
    public double divide(int a, int b) {
        // ArithmeticException si b es 0
        return a / b;
    }
    
    public String processText(String text) {
        // NullPointerException si text es null
        return text.toUpperCase();
    }
    
    public int getElement(int[] array, int index) {
        // ArrayIndexOutOfBoundsException si index >= array.length
        return array[index];
    }
}
```

{{% note %}}
Características de excepciones no verificadas:
- Heredan de RuntimeException
- No requieren ser declaradas o manejadas
- Representan errores de programación
- Se pueden prevenir con buenas prácticas
- Ejemplos comunes:
  * NullPointerException: Acceso a objeto null
  * ArrayIndexOutOfBoundsException: Índice inválido
  * ArithmeticException: División por cero
  * IllegalArgumentException: Argumentos inválidos
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Creando Excepciones Personalizadas

```java
// Excepción verificada personalizada
public class InsufficientFundsException extends Exception {
    private final double amount;
    private final double balance;
    
    public InsufficientFundsException(String message, double amount, double balance) {
        super(message);
        this.amount = amount;
        this.balance = balance;
    }
    
    public double getAmount() { return amount; }
    public double getBalance() { return balance; }
}

// Excepción no verificada personalizada
public class InvalidProductCodeException extends RuntimeException {
    private final String productCode;
    
    public InvalidProductCodeException(String message, String productCode) {
        super(message);
        this.productCode = productCode;
    }
    
    public String getProductCode() { return productCode; }
}
```

{{% note %}}
Buenas prácticas para excepciones personalizadas:
- Heredar de Exception para checked, RuntimeException para unchecked
- Incluir campos relevantes al error
- Proporcionar constructores con mensaje descriptivo
- Agregar métodos getter para acceder a detalles del error
- Usar nombres descriptivos que terminen en "Exception"
- Documentar bien la excepción y sus casos de uso
{{% /note %}}

---

### Uso de Excepciones Personalizadas

```java
public class BankAccount {
    private double balance;
    
    public void withdraw(double amount) throws InsufficientFundsException {
        if (amount > balance) {
            throw new InsufficientFundsException(
                "No hay suficiente saldo para retirar " + amount,
                amount,
                balance
            );
        }
        balance -= amount;
    }
}

public class ProductService {
    public Product findByCode(String code) {
        if (!code.matches("[A-Z]{2}\\d{4}")) {
            throw new InvalidProductCodeException(
                "Código de producto inválido: debe ser 2 letras y 4 números",
                code
            );
        }
        // Buscar producto...
        return product;
    }
}
```

{{% note %}}
Cuándo usar excepciones personalizadas:
- Para errores específicos del dominio de negocio
- Cuando necesitas incluir información adicional del error
- Para distinguir entre diferentes tipos de errores
- Para mejorar la legibilidad y mantenibilidad
- Cuando las excepciones estándar no son suficientes
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Introducción a Patrones de Diseño

Los patrones de diseño son soluciones probadas a problemas comunes en el desarrollo de software.

{{% note %}}
Características de los patrones:
- Son soluciones reutilizables
- No son diseños completos
- No son código terminado
- Son plantillas para resolver problemas
- Facilitan la comunicación entre desarrolladores
- Proveen un vocabulario común
{{% /note %}}

---

### Categorías de Patrones

1. **Patrones Creacionales**
   - Controlan la creación de objetos
   - Singleton, Factory Method, Abstract Factory, Builder, Prototype

2. **Patrones Estructurales**
   - Composición de clases y objetos
   - Adapter, Bridge, Composite, Decorator, Facade, Flyweight, Proxy

3. **Patrones de Comportamiento**
   - Comunicación entre objetos
   - Observer, Strategy, Command, State, Template Method, Iterator, Visitor

{{% note %}}
Definición detallada de cada patrón:

Patrones Creacionales:
- Singleton: Garantiza una única instancia de una clase en toda la aplicación
- Factory Method: Define una interfaz para crear objetos, pero permite a las subclases decidir qué clase instanciar
- Abstract Factory: Proporciona una interfaz para crear familias de objetos relacionados sin especificar sus clases concretas
- Builder: Separa la construcción de un objeto complejo de su representación
- Prototype: Crea nuevos objetos clonando un objeto prototipo

Patrones Estructurales:
- Adapter: Convierte la interfaz de una clase en otra interfaz que los clientes esperan
- Bridge: Separa una abstracción de su implementación para que ambas puedan variar independientemente
- Composite: Compone objetos en estructuras de árbol para representar jerarquías parte-todo
- Decorator: Añade responsabilidades adicionales a un objeto dinámicamente
- Facade: Proporciona una interfaz unificada para un conjunto de interfaces en un subsistema
- Flyweight: Usa compartición para soportar grandes cantidades de objetos de granularidad fina
- Proxy: Proporciona un sustituto o marcador de posición para otro objeto

Patrones de Comportamiento:
- Observer: Define una dependencia uno-a-muchos entre objetos
- Strategy: Define una familia de algoritmos y los hace intercambiables
- Command: Encapsula una petición como un objeto
- State: Permite que un objeto altere su comportamiento cuando su estado interno cambia
- Template Method: Define el esqueleto de un algoritmo, delegando algunos pasos a las subclases
- Iterator: Proporciona una forma de acceder secuencialmente a los elementos de una colección
- Visitor: Representa una operación a realizar sobre los elementos de una estructura de objetos
{{% /note %}}

---

### Simple Factory Pattern

```java
// Producto base
interface Furniture {
    void assemble();
    void deliver();
}

// Productos concretos
class Chair implements Furniture {
    public void assemble() { 
        System.out.println("Ensamblando silla..."); 
    }
    public void deliver() {
        System.out.println("Entregando silla...");
    }
}

class Table implements Furniture {
    public void assemble() { 
        System.out.println("Ensamblando mesa..."); 
    }
    public void deliver() {
        System.out.println("Entregando mesa...");
    }
}

// Simple Factory
public class FurnitureSimpleFactory {
    public static Furniture createFurniture(String type) {
        if (type == null) {
            throw new IllegalArgumentException("El tipo no puede ser null");
        }
        
        switch (type.toLowerCase()) {
            case "chair":
                return new Chair();
            case "table":
                return new Table();
            default:
                throw new IllegalArgumentException(
                    "Tipo de mueble no soportado: " + type
                );
        }
    }
}

// Uso
public class Client {
    public static void main(String[] args) {
        Furniture chair = FurnitureSimpleFactory.createFurniture("chair");
        chair.assemble();
        chair.deliver();
    }
}
```

{{% note %}}
Simple Factory:
- Es un método estático que crea objetos
- No es un patrón GoF oficial, pero es muy utilizado
- Muy común en Java: Integer.valueOf(), LocalDate.of()
- Ventajas:
  * Encapsula la lógica de creación
  * Centraliza la creación de objetos
  * Fácil de usar y entender
  * No requiere crear instancias de fábrica
- Desventajas:
  * No es extensible por herencia
  * Viola Open/Closed Principle al agregar nuevos tipos
  * Toda la lógica en una sola clase

Ejemplos en Java Standard Library:
```java
// Ejemplos de Simple Factory en Java
Integer number = Integer.valueOf("123");
LocalDate date = LocalDate.of(2024, 3, 25);
List<String> list = Collections.unmodifiableList(originalList);
Path path = Paths.get("file.txt");
```
{{% /note %}}

---

### Ejemplo Conceptual: Patrón Factory Method

```java
// Producto
interface Furniture { void assemble(); }

// Productos concretos
class Chair implements Furniture {
    public void assemble() { 
        System.out.println("Ensamblando silla: patas + asiento + respaldo"); 
    }
}
class Table implements Furniture {
    public void assemble() { 
        System.out.println("Ensamblando mesa: patas + superficie"); 
    }
}

// Creador
abstract class FurnitureFactory {
    abstract Furniture createFurniture();
    
    // Método que utiliza el factory
    public void deliverFurniture() {
        Furniture furniture = createFurniture();
        furniture.assemble();
        System.out.println("Empaquetando para envío...");
        System.out.println("Enviando al cliente...");
    }
}

// Creadores concretos
class ChairFactory extends FurnitureFactory {
    Furniture createFurniture() { return new Chair(); }
}
class TableFactory extends FurnitureFactory {
    Furniture createFurniture() { return new Table(); }
}

// Uso
public class Client {
    public static void main(String[] args) {
        FurnitureFactory factory = new ChairFactory();
        factory.deliverFurniture();  // Crea y entrega una silla
    }
}
```

{{% note %}}
Factory Method vs Abstract Factory:

Factory Method:
- Crea un único tipo de objeto
- Usa herencia y subclases para decidir qué objeto crear
- En nuestro ejemplo, cada fábrica crea un solo tipo de mueble

Abstract Factory:
- Crea familias de objetos relacionados
- Usa composición para delegar la creación
- Ejemplo extendido para muebles:

```java
// Abstract Factory para familia de muebles
interface FurnitureFactory {
    Chair createChair();
    Table createTable();
}

// Fábrica de muebles modernos
class ModernFurnitureFactory implements FurnitureFactory {
    public Chair createChair() { return new ModernChair(); }
    public Table createTable() { return new ModernTable(); }
}

// Fábrica de muebles clásicos
class ClassicFurnitureFactory implements FurnitureFactory {
    public Chair createChair() { return new ClassicChair(); }
    public Table createTable() { return new ClassicTable(); }
}
```

Diferencias clave:
1. Factory Method crea un objeto, Abstract Factory crea familias
2. Factory Method usa herencia, Abstract Factory usa composición
3. Factory Method es más simple, Abstract Factory maneja relaciones complejas
4. Factory Method es extensible por subclases, Abstract Factory por nuevas interfaces
5. Factory Method se enfoca en un tipo, Abstract Factory en una familia de tipos
{{% /note %}}

---

### Ejemplo Conceptual: Patrón Observer

```java
// Observable
interface Subject {
    void attach(Observer observer);
    void detach(Observer observer);
    void notifyObservers();
}

// Observer
interface Observer {
    void update(String message);
}

// Implementación concreta
class NewsAgency implements Subject {
    private List<Observer> observers = new ArrayList<>();
    
    public void attach(Observer observer) {
        observers.add(observer);
    }
    
    public void detach(Observer observer) {
        observers.remove(observer);
    }
    
    public void notifyObservers(String news) {
        for(Observer observer : observers) {
            observer.update(news);
        }
    }
}
```

{{% note %}}
Observer Pattern:
- Define dependencia uno a muchos
- Cuando cambia el estado de un objeto, se notifica a todos sus dependientes
- Utilizado en eventos UI (como vimos en Swing)
- Promueve el bajo acoplamiento
- Base para programación reactiva
- Común en arquitecturas basadas en eventos
{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?