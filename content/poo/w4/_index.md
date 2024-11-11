+++
title = "Programación Orientada a Objetos - Semana 4"
subtitle = "Herencia, Polimorfismo, Interfaces y Clases Abstractas"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 4: Herencia, Polimorfismo, Interfaces y Clases Abstractas

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Profundizar en herencia y polimorfismo {{% /fragment %}}
{{% fragment class="bullet-point" %}} Entender interfaces y clases abstractas {{% /fragment %}}
{{% fragment class="bullet-point" %}} Conocer interfaces comunes de Java {{% /fragment %}}
{{% fragment class="bullet-point" %}} Comprender y aplicar genéricos {{% /fragment %}}
{{% fragment class="bullet-point" %}} Aplicar los conceptos en ejercicios prácticos {{% /fragment %}}

---

{{% section %}}

### Herencia vs Interfaces

| Aspecto | Herencia | Interfaces |
|---------|-----------|------------|
| Propósito | Reutilización y extensión de código | Definir contratos de comportamiento |
| Relación | "Es un" (is-a) | "Puede hacer" (can-do) |
| Restricción | Una sola superclase | Múltiples interfaces |
| Implementación | Hereda código | Solo define métodos |

---

#### ¿Cuándo usar cada uno?

**Herencia**:
- Cuando hay una relación clara "es un"
- Cuando quieres reutilizar código
- Cuando las subclases comparten comportamiento común

**Interfaces**:
- Cuando diferentes clases comparten capacidades
- Cuando necesitas múltiples "contratos"
- Cuando quieres desacoplar el comportamiento de la implementación

{{% /section %}}

---

{{% section %}}

### Clases Abstractas vs Clases Base

```java
// Clase base regular
public class Animal {
    protected String nombre;
    
    public void comer() {
        System.out.println("El animal está comiendo");
    }
}

// Clase abstracta
public abstract class FiguraGeometrica {
    protected String color;
    
    // Método abstracto - sin implementación
    public abstract double calcularArea();
    
    // Método concreto - con implementación
    public void setColor(String color) {
        this.color = color;
    }
}
```

---

#### Comparación

| Característica | Clase Base | Clase Abstracta |
|----------------|------------|-----------------|
| Instanciación | Permitida | No permitida |
| Métodos | Todos implementados | Puede tener métodos abstractos |
| Propósito | Reutilización directa | Plantilla para subclases |
| Uso típico | Objetos completos | Jerarquías de clases |

Las clases abstractas son ideales cuando tenemos comportamiento común pero necesitamos forzar a las subclases a implementar ciertos métodos.

{{% /section %}}

---

{{% section %}}

### Polimorfismo en Acción

```java
// Jerarquía de clases
public abstract class Empleado {
    public abstract double calcularSalario();
}

public class EmpleadoTiempoCompleto extends Empleado {
    private double salarioMensual;
    
    public EmpleadoTiempoCompleto(double salarioMensual) {
        this.salarioMensual = salarioMensual;
    }
    
    @Override
    public double calcularSalario() {
        return salarioMensual;
    }
}

public class EmpleadoPorHoras extends Empleado {
    private double tarifaPorHora;
    private int horasTrabajadas;
    
    public EmpleadoPorHoras(double tarifaPorHora, int horasTrabajadas) {
        this.tarifaPorHora = tarifaPorHora;
        this.horasTrabajadas = horasTrabajadas;
    }
    
    @Override
    public double calcularSalario() {
        return tarifaPorHora * horasTrabajadas;
    }
}

// Uso del polimorfismo
public class Nomina {
    private List<Empleado> empleados;
    
    public Nomina() {
        this.empleados = new ArrayList<>();
    }
    
    public void agregarEmpleado(Empleado empleado) {
        empleados.add(empleado);
    }
    
    public double calcularTotalNomina() {
        double total = 0;
        for (Empleado emp : empleados) {
            total += emp.calcularSalario();
        }
        return total;
    }
}
```

---

#### Beneficios del Polimorfismo

1. **Extensibilidad**
   - Fácil agregar nuevos tipos
   - Sin modificar código existente

2. **Mantenibilidad**
   - Código más limpio y organizado
   - Menor duplicación

3. **Flexibilidad**
   - Tratamiento uniforme de objetos
   - Comportamiento dinámico

{{% /section %}}

---

{{% section %}}

### Trabajando con Referencias Base

```java
public class EjemploReferencias {
    public static void main(String[] args) {
        // Referencias base apuntando a objetos derivados
        Empleado emp1 = new EmpleadoTiempoCompleto(2000);
        Empleado emp2 = new EmpleadoPorHoras(15, 160);
        
        // Lista polimórfica
        List<Empleado> empleados = new ArrayList<>();
        empleados.add(emp1);
        empleados.add(emp2);
        
        // Procesamiento uniforme
        for (Empleado emp : empleados) {
            System.out.println("Salario: $" + emp.calcularSalario());
        }
    }
}
```

---

#### Verificación de Tipos

```java
public class EjemploVerificacionTipos {
    public static void mostrarTipoEmpleado(Empleado emp) {
        // Usando instanceof
        if (emp instanceof EmpleadoTiempoCompleto) {
            System.out.println("Empleado tiempo completo");
        }
        
        // Usando getClass
        System.out.println("Tipo: " + emp.getClass().getSimpleName());
        
        // Pattern Matching (Java 16+)
        if (emp instanceof EmpleadoPorHoras horas) {
            System.out.println("Tarifa por hora: $" + horas.getTarifaPorHora());
        }
    }
}
```

`instanceof` es útil para lógica condicional, mientras que `getClass()` es mejor para logging o debugging.

{{% /section %}}

---

{{% section %}}

### Interfaces Comunes en Java

#### Comparable: Ordenamiento Natural
```java
public class Producto implements Comparable<Producto> {
    private String nombre;
    private double precio;
    private int stock;
    
    public Producto(String nombre, double precio, int stock) {
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
    }
    
    // Getters
    public String getNombre() { return nombre; }
    public double getPrecio() { return precio; }
    public int getStock() { return stock; }
    
    @Override
    public int compareTo(Producto otro) {
        return Double.compare(this.precio, otro.precio);
    }
    
    @Override
    public String toString() {
        return String.format("%s - $%.2f (Stock: %d)", nombre, precio, stock);
    }
}

public class Tienda {
    private List<Producto> productos;
    
    public Tienda() {
        productos = new ArrayList<>();
    }
    
    public void agregarProducto(Producto p) {
        productos.add(p);
    }
    
    public List<Producto> obtenerProductosMasBaratos(int cantidad) {
        // Creamos una copia para no modificar la lista original
        List<Producto> ordenados = new ArrayList<>(productos);
        Collections.sort(ordenados);
        
        // Devolvemos los primeros 'cantidad' productos
        List<Producto> resultado = new ArrayList<>();
        for (int i = 0; i < Math.min(cantidad, ordenados.size()); i++) {
            resultado.add(ordenados.get(i));
        }
        return resultado;
    }
}
```

---

#### Comparator: Múltiples Criterios de Ordenamiento
```java
public class ComparadorPorNombre implements Comparator<Producto> {
    @Override
    public int compare(Producto p1, Producto p2) {
        return p1.getNombre().compareTo(p2.getNombre());
    }
}

public class ComparadorPorStock implements Comparator<Producto> {
    @Override
    public int compare(Producto p1, Producto p2) {
        return Integer.compare(p1.getStock(), p2.getStock());
    }
}

public class GestionInventario {
    private List<Producto> productos;
    
    public GestionInventario() {
        this.productos = new ArrayList<>();
    }
    
    public void agregarProducto(Producto p) {
        productos.add(p);
    }
    
    public void mostrarCatalogoOrdenado() {
        // Ordenar por nombre
        List<Producto> porNombre = new ArrayList<>(productos);
        Collections.sort(porNombre, new ComparadorPorNombre());
        
        System.out.println("Catálogo ordenado por nombre:");
        for (Producto p : porNombre) {
            System.out.println(p);
        }
        
        // Ordenar por stock
        List<Producto> porStock = new ArrayList<>(productos);
        Collections.sort(porStock, new ComparadorPorStock());
        
        System.out.println("\nProductos ordenados por stock:");
        for (Producto p : porStock) {
            System.out.println(p);
        }
    }
    
    // Método main de ejemplo
    public static void main(String[] args) {
        GestionInventario inventario = new GestionInventario();
        
        inventario.agregarProducto(new Producto("Laptop", 999.99, 5));
        inventario.agregarProducto(new Producto("Mouse", 19.99, 50));
        inventario.agregarProducto(new Producto("Teclado", 49.99, 30));
        
        inventario.mostrarCatalogoOrdenado();
    }
}
```

---

#### Serializable: Persistencia de Objetos
```java
public class Cliente implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String id;
    private String nombre;
    private List<String> historialCompras;
    private transient String passwordHash;
    
    public Cliente(String id, String nombre) {
        this.id = id;
        this.nombre = nombre;
        this.historialCompras = new ArrayList<>();
    }
    
    public void agregarCompra(String compra) {
        historialCompras.add(compra);
    }
    
    public void guardarEstado(String archivo) {
        try (ObjectOutputStream out = new ObjectOutputStream(
                new FileOutputStream(archivo))) {
            out.writeObject(this);
        } catch (IOException e) {
            System.err.println("Error al guardar: " + e.getMessage());
        }
    }
    
    public static Cliente cargarEstado(String archivo) {
        try (ObjectInputStream in = new ObjectInputStream(
                new FileInputStream(archivo))) {
            return (Cliente) in.readObject();
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("Error al cargar: " + e.getMessage());
            return null;
        }
    }
    
    // Método main de ejemplo
    public static void main(String[] args) {
        // Crear y guardar
        Cliente cliente = new Cliente("001", "Juan Pérez");
        cliente.agregarCompra("Laptop - 2024-01-15");
        cliente.agregarCompra("Mouse - 2024-01-20");
        
        cliente.guardarEstado("cliente001.dat");
        
        // Cargar y verificar
        Cliente clienteCargado = Cliente.cargarEstado("cliente001.dat");
        if (clienteCargado != null) {
            System.out.println("Cliente cargado: " + clienteCargado.nombre);
            System.out.println("Historial de compras:");
            for (String compra : clienteCargado.historialCompras) {
                System.out.println(compra);
            }
        }
    }
}
```

---

#### Cloneable: Copias Profundas de Objetos
```java
public class Configuracion implements Cloneable {
    private Map<String, String> propiedades;
    private List<String> hosts;
    
    public Configuracion() {
        propiedades = new HashMap<>();
        hosts = new ArrayList<>();
    }
    
    public void setPropiedades(String clave, String valor) {
        propiedades.put(clave, valor);
    }
    
    public void agregarHost(String host) {
        hosts.add(host);
    }
    
    @Override
    public Configuracion clone() throws CloneNotSupportedException {
        Configuracion clon = (Configuracion) super.clone();
        // Deep copy de colecciones
        clon.propiedades = new HashMap<>(this.propiedades);
        clon.hosts = new ArrayList<>(this.hosts);
        return clon;
    }
    
    @Override
    public String toString() {
        return "Configuracion{" +
               "propiedades=" + propiedades +
               ", hosts=" + hosts +
               '}';
    }
    
    // Método main de ejemplo
    public static void main(String[] args) {
        try {
            // Crear configuración base
            Configuracion configBase = new Configuracion();
            configBase.setPropiedades("database", "mysql");
            configBase.setPropiedades("puerto", "3306");
            configBase.agregarHost("localhost");
            
            // Clonar para desarrollo
            Configuracion configDev = configBase.clone();
            configDev.setPropiedades("ambiente", "desarrollo");
            
            // Clonar para producción
            Configuracion configProd = configBase.clone();
            configProd.setPropiedades("ambiente", "produccion");
            configProd.agregarHost("prod.example.com");
            
            // Mostrar las diferentes configuraciones
            System.out.println("Config Base: " + configBase);
            System.out.println("Config Dev: " + configDev);
            System.out.println("Config Prod: " + configProd);
            
        } catch (CloneNotSupportedException e) {
            System.err.println("Error al clonar: " + e.getMessage());
        }
    }
}
```

---

#### Iterable: Colecciones Personalizadas
```java
public class CarritoCompras implements Iterable<Producto> {
    private List<Producto> items;
    private double totalCompra;
    
    public CarritoCompras() {
        this.items = new ArrayList<>();
        this.totalCompra = 0;
    }
    
    public void agregarProducto(Producto p) {
        items.add(p);
        totalCompra += p.getPrecio();
    }
    
    public void quitarProducto(Producto p) {
        if (items.remove(p)) {
            totalCompra -= p.getPrecio();
        }
    }
    
    public double getTotal() {
        return totalCompra;
    }
    
    @Override
    public Iterator<Producto> iterator() {
        return items.iterator();
    }
    
    // Método main de ejemplo
    public static void main(String[] args) {
        CarritoCompras carrito = new CarritoCompras();
        
        // Agregar productos al carrito
        carrito.agregarProducto(new Producto("Laptop", 999.99, 1));
        carrito.agregarProducto(new Producto("Mouse", 19.99, 1));
        carrito.agregarProducto(new Producto("Teclado", 49.99, 1));
        
        // Usar el iterador para mostrar productos
        System.out.println("Productos en el carrito:");
        for (Producto item : carrito) {
            System.out.println(item);
        }
        
        System.out.printf("Total de la compra: $%.2f%n", carrito.getTotal());
    }
}
```

{{% /section %}}

---

{{% section %}}

### ¿Por qué Genéricos?

Hasta ahora hemos visto:
- Interfaces que definen contratos
- Clases abstractas que comparten implementación
- Polimorfismo para manejar diferentes tipos

---

### ¿Qué son los Genéricos?

Los genéricos son un mecanismo que permite que las clases y métodos puedan operar con diferentes tipos de datos mientras mantienen la seguridad de tipos.

Se pueden usar con:
- Clases: `class MiClase<T> { ... }`
- Interfaces: `interface MiInterfaz<T> { ... }`
- Métodos: `public <T> T miMetodo(T valor) { ... }`

```java
// Sin genéricos - no seguro
ArrayList lista = new ArrayList();
lista.add("texto");
lista.add(42);       // Mezclamos tipos sin control
String texto = (String) lista.get(0); // Casting necesario
Integer num = (Integer) lista.get(0); // Error en tiempo de ejecución!

// Con genéricos - seguro
ArrayList<String> lista = new ArrayList<>();
lista.add("texto");
lista.add(42);       // Error en tiempo de compilación!
String texto = lista.get(0); // No necesita casting
```

---

### ¿Qué nos permiten hacer?

- Reutilizar código para diferentes tipos de datos
- Mantener la seguridad de tipos en tiempo de compilación
- Eliminar casteos explícitos
- Crear estructuras de datos y algoritmos genéricos
- Los genéricos son fundamentales en las colecciones de Java que hemos estado usando, como ArrayList<Producto> o List<Empleado>

---

### ¿Cómo se usan?

```java
// Con clases
public class Contenedor<T> {
    private T valor;
    public T obtener() { return valor; }
    public void guardar(T valor) { this.valor = valor; }
}

// Con interfaces
public interface Procesable<T> {
    void procesar(T dato);
    T obtenerResultado();
}

// Con métodos
public class Utilidades {
    public static <T> void intercambiar(T[] array, int i, int j) {
        T temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}
```

---

### Limitando Tipos Genéricos

- Podemos restringir qué tipos se pueden usar mediante `extends`:
- Los límites nos permiten usar los métodos y propiedades del tipo base o las interfaces especificadas.

```java
// Solo tipos numéricos
public class Calculadora<T extends Number> {
    private T valor;
    
    public double obtenerDoble() {
        return valor.doubleValue(); // Podemos usar métodos de Number
    }
}

// Solo tipos que implementen una interfaz
public class Ordenador<T extends Comparable<T>> {
    public void ordenar(List<T> lista) {
        Collections.sort(lista); // Podemos usar compareTo()
    }
}

// Múltiples límites
public class Editor<T extends Serializable & Cloneable> {
    // T debe implementar ambas interfaces
}

// Con clases e interfaces
public class Procesador<T extends Animal & Comparable<T>> {
    // T debe extender Animal e implementar Comparable
}
```

{{% /section %}}

---

{{% section %}}

### Ejemplo de Genéricos en Java

Los genéricos son esenciales en las colecciones de Java:

```java
// ArrayList usa genéricos internamente
public class ArrayList<E> {
    private Object[] elementData;
    private int size;
    
    public E get(int index) {
        return (E) elementData[index];
    }
    
    public boolean add(E element) {
        elementData[size++] = element;
        return true;
    }
}

// Uso seguro con tipo específico
ArrayList<String> nombres = new ArrayList<>();
nombres.add("Juan");     // Correcto
nombres.add(123);       // Error de compilación
```

---

### Creando una Estructura de Datos Genérica

```java
// Una pila simple que puede contener cualquier tipo
public class Pila<T> {
    private List<T> elementos;
    
    public Pila() {
        this.elementos = new ArrayList<>();
    }
    
    public void push(T elemento) {
        elementos.add(elemento);
    }
    
    public T pop() {
        if (elementos.isEmpty()) {
            throw new EmptyStackException();
        }
        return elementos.remove(elementos.size() - 1);
    }
    
    public T peek() {
        if (elementos.isEmpty()) {
            throw new EmptyStackException();
        }
        return elementos.get(elementos.size() - 1);
    }
    
    public boolean isEmpty() {
        return elementos.isEmpty();
    }
}

// Ejemplo de uso
public class EjemploPila {
    public static void main(String[] args) {
        // Pila de Strings
        Pila<String> pilaTextos = new Pila<>();
        pilaTextos.push("Primero");
        pilaTextos.push("Segundo");
        System.out.println(pilaTextos.pop()); // Imprime: Segundo
        
        // Pila de Integers
        Pila<Integer> pilaNumeros = new Pila<>();
        pilaNumeros.push(1);
        pilaNumeros.push(2);
        System.out.println(pilaNumeros.pop()); // Imprime: 2
    }
}
```

---

### Restricciones de Tipo con Genéricos

```java
// Clase base para elementos procesables
public abstract class ElementoProcesable {
    protected String id;
    protected LocalDateTime fechaCreacion;
    
    public ElementoProcesable(String id) {
        this.id = id;
        this.fechaCreacion = LocalDateTime.now();
    }
    
    public abstract void procesar();
}

// Procesador genérico que solo acepta ElementoProcesable y sus subclases
public class Procesador<T extends ElementoProcesable> {
    private List<T> elementos;
    
    public Procesador() {
        this.elementos = new ArrayList<>();
    }
    
    public void agregar(T elemento) {
        elementos.add(elemento);
    }
    
    public void procesarTodo() {
        for (T elemento : elementos) {
            System.out.println("Procesando elemento ID: " + elemento.id);
            elemento.procesar();
        }
    }
}

// Ejemplos de uso
public class Documento extends ElementoProcesable {
    private String contenido;
    
    public Documento(String id, String contenido) {
        super(id);
        this.contenido = contenido;
    }
    
    @Override
    public void procesar() {
        System.out.println("Procesando documento: " + contenido);
    }
}

public class Email extends ElementoProcesable {
    private String asunto;
    
    public Email(String id, String asunto) {
        super(id);
        this.asunto = asunto;
    }
    
    @Override
    public void procesar() {
        System.out.println("Enviando email: " + asunto);
    }
}

// Demostración del sistema
public class DemoSistemaProcesamiento {
    public static void main(String[] args) {
        // Procesador específico para documentos
        Procesador<Documento> procesadorDocs = new Procesador<>();
        procesadorDocs.agregar(new Documento("DOC1", "Informe Mensual"));
        procesadorDocs.agregar(new Documento("DOC2", "Presupuesto 2024"));
        
        System.out.println("Procesando documentos:");
        procesadorDocs.procesarTodo();
        
        // Procesador específico para emails
        Procesador<Email> procesadorEmails = new Procesador<>();
        procesadorEmails.agregar(new Email("EMAIL1", "Reunión Semanal"));
        procesadorEmails.agregar(new Email("EMAIL2", "Entrega de Proyecto"));
        
        System.out.println("\nProcesando emails:");
        procesadorEmails.procesarTodo();
        
        // Este código no compilaría:
        // Procesador<String> procesadorInvalido = new Procesador<>(); // Error
    }
}
```

{{% /section %}}

---

### Ejercicio Guiado: Sistema de Formas

```java
public interface Dibujable {
    void dibujar();
    String obtenerTipo();
}

public class Punto {
    private int x, y;
    
    public Punto(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    @Override
    public String toString() {
        return "(" + x + ", " + y + ")";
    }
}

public abstract class Forma implements Dibujable, Comparable<Forma> {
    protected String color;
    protected Punto posicion;
    
    public Forma(String color, Punto posicion) {
        this.color = color;
        this.posicion = posicion;
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    
    @Override
    public String obtenerTipo() {
        return this.getClass().getSimpleName();
    }
    
    @Override
    public int compareTo(Forma otra) {
        return Double.compare(this.calcularArea(), otra.calcularArea());
    }
}

public class Circulo extends Forma {
    private double radio;
    
    public Circulo(String color, Punto centro, double radio) {
        super(color, centro);
        this.radio = radio;
    }
    
    @Override
    public double calcularArea() {
        return Math.PI * radio * radio;
    }
    
    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
    
    @Override
    public void dibujar() {
        System.out.printf("Dibujando círculo %s de radio %.2f en %s%n", 
            color, radio, posicion);
    }
}

public class Rectangulo extends Forma {
    private double base;
    private double altura;
    
    public Rectangulo(String color, Punto esquina, double base, double altura) {
        super(color, esquina);
        this.base = base;
        this.altura = altura;
    }
    
    @Override
    public double calcularArea() {
        return base * altura;
    }
    
    @Override
    public double calcularPerimetro() {
        return 2 * (base + altura);
    }
    
    @Override
    public void dibujar() {
        System.out.printf("Dibujando rectángulo %s de %fx%f en %s%n", 
            color, base, altura, posicion);
    }
}
```

---

#### Usando el Sistema de Formas

```java
public class SistemaFormas {
    private List<Forma> formas;
    
    public SistemaFormas() {
        this.formas = new ArrayList<>();
    }
    
    public void agregarForma(Forma forma) {
        formas.add(forma);
    }
    
    public void dibujarTodo() {
        for (Forma forma : formas) {
            forma.dibujar();
            System.out.printf("Área: %.2f, Perímetro: %.2f%n", 
                forma.calcularArea(), forma.calcularPerimetro());
        }
    }
    
    public void ordenarPorArea() {
        Collections.sort(formas);
    }
    
    public static void main(String[] args) {
        SistemaFormas sistema = new SistemaFormas();
        
        sistema.agregarForma(new Circulo("rojo", new Punto(0, 0), 5));
        sistema.agregarForma(new Rectangulo("azul", new Punto(10, 10), 4, 6));
        sistema.agregarForma(new Circulo("verde", new Punto(5, 5), 3));
        
        System.out.println("Formas sin ordenar:");
        sistema.dibujarTodo();
        
        System.out.println("\nFormas ordenadas por área:");
        sistema.ordenarPorArea();
        sistema.dibujarTodo();
    }
}
```

---

### Ejercicio para Estudiantes: Sistema de Biblioteca

Crear un sistema de gestión de biblioteca con:

1. Interface `Prestable`
```java
public interface Prestable {
    boolean prestar();
    boolean devolver();
    boolean estaDisponible();
}
```

2. Clase abstracta `MaterialBiblioteca`
```java
public abstract class MaterialBiblioteca implements Prestable, Comparable<MaterialBiblioteca> {
    protected String codigo;
    protected String titulo;
    protected boolean prestado;
    
    public abstract String obtenerTipoMaterial();
    
    @Override
    public int compareTo(MaterialBiblioteca otro) {
        return this.titulo.compareTo(otro.titulo);
    }
}
```

3. Implementar las siguientes clases:
   - `Libro`
   - `Revista`
   - `DVD`

---

### Requisitos Adicionales

1. Crear una clase `Biblioteca` que maneje una colección de materiales
2. Implementar búsqueda por tipo usando `instanceof`
3. Agregar `Serializable` para persistencia
4. Crear comparadores adicionales (por código, tipo)
5. Implementar un método que muestre estadísticas por tipo

Entregables:
- Código fuente comentado
- Diagrama de clases
- Ejemplos de uso

---

{{% section %}}

### Conclusiones (1/2)

1. **Herencia vs Interfaces**: La herencia debe usarse cuando existe una relación "es-un" verdadera y necesitamos compartir implementación, mientras que las interfaces son ideales para definir comportamientos comunes sin forzar una jerarquía de clases.

2. **Clases Abstractas**: Las clases abstractas nos permiten combinar la reutilización de código de la herencia con la definición de contratos de las interfaces, siendo especialmente útiles cuando tenemos un grupo de clases relacionadas que comparten comportamiento pero necesitan implementaciones específicas de ciertos métodos.

3. **Polimorfismo**: La capacidad de tratar objetos de diferentes clases a través de una interfaz común nos permite escribir código que funciona con cualquier clase que cumpla con ese contrato, facilitando la extensión del sistema sin modificar el código existente.

---

### Conclusiones (2/2)

4. **Interfaces Estándar**: Java proporciona interfaces como Comparable, Serializable, y Cloneable que resuelven problemas comunes como ordenamiento, persistencia y clonación de objetos, permitiéndonos integrar nuestras clases con las funcionalidades existentes del lenguaje.

5. **Verificación de Tipos**: Aunque `instanceof` y `getClass` son útiles para casos específicos como serialización o logging, su uso excesivo puede indicar problemas en el diseño de clases ya que podrían dificultar la lectura.

6. **Genéricos**: Los genéricos proporcionan una forma de crear código reutilizable que funciona con diferentes tipos manteniendo la seguridad de tipos en tiempo de compilación, siendo fundamentales para el desarrollo de estructuras de datos y algoritmos flexibles.

{{% /section %}}

---

### ¿Preguntas?
