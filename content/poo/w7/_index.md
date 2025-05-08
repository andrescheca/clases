+++
title = "Patrones de Diseño en Profundidad"
subtitle = "Implementaciones Prácticas y Casos de Uso"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 7: Patrones de Diseño en Práctica

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Profundizar en patrones creacionales: Builder {{% /fragment %}}
{{% fragment class="bullet-point" %}} Explorar patrones estructurales: Decorator y Adapter {{% /fragment %}}
{{% fragment class="bullet-point" %}} Analizar patrones de comportamiento: Observer y Strategy {{% /fragment %}}
{{% fragment class="bullet-point" %}} Caso práctico: Aplicación Swing con múltiples patrones {{% /fragment %}}

---

{{% section %}}

### Patrón Builder vs Factory Method

El patrón Builder nos permite construir objetos complejos paso a paso.

```java
// Producto
class Pizza {
    private String masa;
    private String salsa;
    private String queso;
    private List<String> toppings = new ArrayList<>();
    
    // Getters...
    
    @Override
    public String toString() {
        return "Pizza con masa " + masa + ", salsa " + salsa + 
               ", queso " + queso + " y toppings: " + toppings;
    }
}

// Builder
class PizzaBuilder {
    private Pizza pizza = new Pizza();
    
    public PizzaBuilder setMasa(String masa) {
        pizza.masa = masa;
        return this;
    }
    
    public PizzaBuilder setSalsa(String salsa) {
        pizza.salsa = salsa;
        return this;
    }
    
    public PizzaBuilder setQueso(String queso) {
        pizza.queso = queso;
        return this;
    }
    
    public PizzaBuilder addTopping(String topping) {
        pizza.toppings.add(topping);
        return this;
    }
    
    public Pizza build() {
        return pizza;
    }
}

// Director (opcional)
class PizzaDirector {
    public Pizza construirPizzaMargarita(PizzaBuilder builder) {
        return builder
            .setMasa("delgada")
            .setSalsa("tomate")
            .setQueso("mozzarella")
            .addTopping("albahaca")
            .build();
    }
}

// Uso
public class Main {
    public static void main(String[] args) {
        PizzaBuilder builder = new PizzaBuilder();
        
        // Construcción manual
        Pizza pizzaPersonalizada = builder
            .setMasa("gruesa")
            .setSalsa("BBQ")
            .setQueso("cheddar")
            .addTopping("jamón")
            .addTopping("piña")
            .build();
            
        // Usando director
        PizzaDirector director = new PizzaDirector();
        Pizza pizzaMargarita = director.construirPizzaMargarita(new PizzaBuilder());
    }
}
```

{{% note %}}
Builder vs Factory Method:

Builder:
- Usado cuando un objeto necesita ser construido en varios pasos
- Permite diferentes representaciones del mismo objeto
- Encapsula la construcción compleja
- Proporciona control fino sobre el proceso de construcción
- Útil cuando un objeto requiere muchos parámetros opcionales

Factory Method:
- Crea objetos en un solo paso
- Se centra en crear diferentes tipos de objetos
- No maneja construcción compleja
- Menos flexible en términos de configuración
- Mejor cuando la creación es simple y directa

Casos de uso del Builder:
1. Objetos con muchos parámetros opcionales
2. Objetos que requieren un orden específico de construcción
3. Cuando queremos inmutabilidad en el objeto final
4. Construcción de objetos complejos como documentos o interfaces gráficas

Ejemplos en Java Standard Library:
- StringBuilder
- StringBuffer
- Stream.Builder
- DocumentBuilder
{{% /note %}}

---

### Ejemplo con Factory Method

```java
// Producto (interface)
interface Pizza {
    String getDescription();
}

// Implementaciones concretas
class PizzaMargarita implements Pizza {
    private String masa;
    private String salsa;
    private String queso;
    private List<String> toppings = new ArrayList<>();
    
    public PizzaMargarita() {
        this.masa = "delgada";
        this.salsa = "tomate";
        this.queso = "mozzarella";
        this.toppings.add("albahaca");
    }
    
    @Override
    public String getDescription() {
        return "Pizza Margarita con masa " + masa + ", salsa " + salsa + 
               ", queso " + queso + " y toppings: " + toppings;
    }
}

class PizzaHawaiana implements Pizza {
    private String masa;
    private String salsa;
    private String queso;
    private List<String> toppings = new ArrayList<>();
    
    public PizzaHawaiana() {
        this.masa = "gruesa";
        this.salsa = "BBQ";
        this.queso = "cheddar";
        this.toppings.add("jamón");
        this.toppings.add("piña");
    }
    
    @Override
    public String getDescription() {
        return "Pizza Hawaiana con masa " + masa + ", salsa " + salsa + 
               ", queso " + queso + " y toppings: " + toppings;
    }
}

// Factory Method (interface)
interface PizzaFactory {
    Pizza crearPizza();
}

// Implementaciones concretas de Factory
class PizzaMargaritaFactory implements PizzaFactory {
    @Override
    public Pizza crearPizza() {
        return new PizzaMargarita();
    }
}

class PizzaHawaianaFactory implements PizzaFactory {
    @Override
    public Pizza crearPizza() {
        return new PizzaHawaiana();
    }
}

// Uso
public class Main {
    public static void main(String[] args) {
        // Crear pizzas usando diferentes factories
        PizzaFactory factoryMargarita = new PizzaMargaritaFactory();
        Pizza pizzaMargarita = factoryMargarita.crearPizza();
        System.out.println(pizzaMargarita.getDescription());
        
        PizzaFactory factoryHawaiana = new PizzaHawaianaFactory();
        Pizza pizzaHawaiana = factoryHawaiana.crearPizza();
        System.out.println(pizzaHawaiana.getDescription());
    }
}
```

{{% note %}}
Propósito:

Builder: Construye objetos complejos paso a paso con control preciso sobre cada componente
Factory Method: Crea objetos donde el tipo exacto se determina en tiempo de ejecución, ocultando los detalles de implementación


Flexibilidad:

Builder: Permite crear diferentes representaciones del mismo objeto variando la configuración de los componentes
Factory Method: Crea objetos diferentes pero relacionados dentro de una interfaz/abstracción común


Implementación:

Builder: Utiliza encadenamiento de métodos (return this) para construir un solo objeto de forma incremental
Factory Method: Utiliza herencia y polimorfismo para devolver objetos completamente construidos de diferentes tipos


Código Cliente:

Builder: El cliente especifica exactamente cómo debe configurarse el objeto
Factory Method: El cliente solo conoce la interfaz abstracta, no los detalles de implementación concretos


Extensibilidad:

Builder: Para añadir nuevos componentes, modificas la clase builder existente
Factory Method: Para añadir nuevos tipos de productos, creas nuevas clases concretas sin cambiar el código existente

{{% /note %}}

---

### Ejemplo con Abstract Factory

```java
// Product interfaces
interface Pizza {
    String getDescription();
}

interface Bebida {
    String getDescription();
}

// Pizza implementations
class PizzaMargaritaItaliana implements Pizza {
    @Override
    public String getDescription() {
        return "Pizza Margarita Italiana con masa fina, salsa de tomate casera, mozzarella fresca y albahaca";
    }
}

class PizzaHawaianaItaliana implements Pizza {
    @Override
    public String getDescription() {
        return "Pizza Hawaiana Italiana con masa fina, salsa de tomate, mozzarella, jamón y piña";
    }
}

class PizzaMargaritaAmericana implements Pizza {
    @Override
    public String getDescription() {
        return "Pizza Margarita Americana con masa gruesa, salsa de tomate, queso mozzarella y orégano";
    }
}

class PizzaHawaianaAmericana implements Pizza {
    @Override
    public String getDescription() {
        return "Pizza Hawaiana Americana con masa gruesa, salsa BBQ, queso cheddar, jamón y piña";
    }
}

// Bebida implementations
class BebidaItaliana implements Bebida {
    @Override
    public String getDescription() {
        return "Vino tinto italiano";
    }
}

class BebidaAmericana implements Bebida {
    @Override
    public String getDescription() {
        return "Refresco de cola grande";
    }
}

// Abstract Factory interface
interface PizzaRestaurantFactory {
    Pizza crearPizza(String tipo);
    Bebida crearBebida();
}

// Concrete Factories
class PizzeriaItaliana implements PizzaRestaurantFactory {
    @Override
    public Pizza crearPizza(String tipo) {
        if (tipo.equals("margarita")) {
            return new PizzaMargaritaItaliana();
        } else if (tipo.equals("hawaiana")) {
            return new PizzaHawaianaItaliana();
        }
        throw new IllegalArgumentException("Tipo de pizza no disponible");
    }
    
    @Override
    public Bebida crearBebida() {
        return new BebidaItaliana();
    }
}

class PizzeriaAmericana implements PizzaRestaurantFactory {
    @Override
    public Pizza crearPizza(String tipo) {
        if (tipo.equals("margarita")) {
            return new PizzaMargaritaAmericana();
        } else if (tipo.equals("hawaiana")) {
            return new PizzaHawaianaAmericana();
        }
        throw new IllegalArgumentException("Tipo de pizza no disponible");
    }
    
    @Override
    public Bebida crearBebida() {
        return new BebidaAmericana();
    }
}

// Client code
public class Main {
    public static void main(String[] args) {
        // Crear un pedido italiano
        PizzaRestaurantFactory pizzeriaItaliana = new PizzeriaItaliana();
        Pizza pizzaItalianaMargarita = pizzeriaItaliana.crearPizza("margarita");
        Bebida bebidaItaliana = pizzeriaItaliana.crearBebida();
        
        System.out.println("Pedido italiano:");
        System.out.println(pizzaItalianaMargarita.getDescription());
        System.out.println(bebidaItaliana.getDescription());
        
        // Crear un pedido americano
        PizzaRestaurantFactory pizzeriaAmericana = new PizzeriaAmericana();
        Pizza pizzaAmericanaHawaiana = pizzeriaAmericana.crearPizza("hawaiana");
        Bebida bebidaAmericana = pizzeriaAmericana.crearBebida();
        
        System.out.println("\nPedido americano:");
        System.out.println(pizzaAmericanaHawaiana.getDescription());
        System.out.println(bebidaAmericana.getDescription());
    }
}
```

{{% note %}}
Propósito:

Abstract Factory: Crea familias de objetos relacionados sin especificar sus clases concretas
Factory Method: Crea un solo producto
Builder: Construye un objeto complejo paso a paso


Alcance:

Abstract Factory: Maneja múltiples tipos de productos (Pizza Y Bebida)
Factory Method: Se centra en una sola jerarquía de productos (solo Pizza)
Builder: Se centra en diferentes configuraciones de un solo objeto


Estructura:

Abstract Factory: Contiene múltiples métodos factory para crear productos relacionados
Factory Method: Contiene un único método de creación
Builder: Contiene múltiples métodos setter para configurar un objeto


Aplicabilidad:

Abstract Factory: Úsalo cuando tu sistema necesite trabajar con múltiples familias de productos
Factory Method: Úsalo cuando necesites un solo producto con subclases que se seleccionan en tiempo de ejecución
Builder: Úsalo cuando necesites crear objetos complejos con muchos parámetros opcionales


Característica Clave:

Abstract Factory: Asegura la compatibilidad entre los productos creados (las pizzas italianas van con bebidas italianas)
Factory Method: Desacopla la creación del producto de su uso
Builder: Proporciona un control preciso sobre la construcción de objetos
{{% /note %}}

---
### Casos Prácticos: Builder
* Sistema de pedidos de restaurante (Subway, Chipotle)
* Generador de documentos PDF (iText, PDFBox)
* Configuración de conexiones a bases de datos (Hibernate)
* Frameworks UI fluidos (SwiftUI, Flutter)
* Constructores de consultas SQL (JPA Criteria API)
{{% note %}} 
**Sistema de pedidos de restaurante**: Un cliente selecciona paso a paso los ingredientes de su comida. Cada método del builder añade un componente (pan, proteína, vegetales, salsas) y al final se llama a build() para crear el producto final validado.

**Generador de documentos PDF**: Las librerías como iText permiten crear documentos complejos paso a paso, configurando márgenes, orientación, fuentes y añadiendo elementos secuencialmente antes de generar el archivo PDF final.

**Configuración de bases de datos**: Hibernate utiliza patrones tipo builder para configurar SessionFactory con decenas de parámetros opcionales como cache, dialect, pool size, etc.: `new Configuration().setProperty("hibernate.dialect", "...").setProperty("hibernate.connection.url", "...").buildSessionFactory();`

**Frameworks UI**: En SwiftUI o Flutter, construyes interfaces encadenando modificadores: `Text("Hola").font(.title).foregroundColor(.blue).padding()`

**Constructores de consultas**: JPA Criteria API permite construir consultas SQL dinámicas y tipadas: `criteriaBuilder.createQuery().select().where().orderBy().build()`
{{% /note %}} 

---
### Casos Prácticos: Factory Method
* Drivers de bases de datos (JDBC)
* Procesadores de pago (tarjeta, PayPal, transferencia)
* Logística y transporte (camión, barco, avión)
* Parsers de diferentes formatos de archivo (PDF, DOC, XML)
* Renderizadores de gráficos (según capacidades hardware)
{{% note %}} 
**Drivers de bases de datos**: JDBC es el ejemplo clásico - `DriverManager.getConnection(url)` determina en tiempo de ejecución qué implementación de Connection crear (MySQL, Oracle, PostgreSQL) según la URL proporcionada. El código cliente trabaja solo con la interfaz Connection sin importar el motor de base de datos.

**Procesadores de pago**: Un e-commerce puede implementar `PaymentProcessor processor = PaymentProcessorFactory.createProcessor("creditcard")` que devuelve diferentes implementaciones según el método de pago seleccionado. Cada implementación maneja la lógica específica de cada pasarela de pago pero comparte la misma interfaz.

**Logística y transporte**: Una aplicación de envíos como DHL o Fedex podría usar `Transporte vehiculo = TransporteFactory.createTransport("express")` que devuelve diferentes tipos de transporte con diferentes algoritmos de ruta, capacidades y costos.

**Parsers de archivo**: Microsoft Office o Adobe podría implementar `DocumentParser parser = ParserFactory.createParser(filename)` que devuelve el parser adecuado según la extensión del archivo (.docx, .pdf, .xlsx).

**Renderizadores gráficos**: Un motor de videojuegos podría usar `Renderer renderer = RendererFactory.createRenderer(deviceCapabilities)` para crear el renderizador óptimo según las capacidades gráficas (DirectX, OpenGL, software) detectadas en tiempo de ejecución.
{{% /note %}} 

---
### Casos Prácticos: Abstract Factory
* Interfaces UI multiplataforma (Windows, macOS, Linux)
* Temas visuales en videojuegos (medieval, futurista, actual)
* Conectores a múltiples bases de datos con sus herramientas
* Sistemas de reservas de viaje (económico, business, premium)
* Suites de producción multimedia (diferentes formatos)
{{% note %}} 
**Interfaces UI multiplataforma**: Frameworks como JavaFX o Qt implementan `UIFactory factory = UIFactoryProvider.getFactory("windows")` para crear familias completas de controles nativos: `Button button = factory.createButton(); Menu menu = factory.createMenu();` Esto garantiza que todos los componentes tengan un aspecto coherente según la plataforma.

**Temas visuales en videojuegos**: Juegos como Civilization crean familias de elementos según la era: `EraFactory medieval = new MedievalEraFactory(); Building castle = medieval.createMilitaryBuilding(); Unit knight = medieval.createMilitaryUnit();` Cada factory crea componentes temáticamente coherentes (edificios, unidades, música, efectos visuales).

**Conectores a bases de datos**: Un ORM podría implementar `DatabaseFactory mysqlFactory = new MySQLFactory(); Connection conn = mysqlFactory.createConnection(); QueryBuilder builder = mysqlFactory.createQueryBuilder(); Transaction tx = mysqlFactory.createTransaction();` garantizando que todos estos componentes sean compatibles con el mismo motor de base de datos.

**Sistemas de reservas**: Booking.com podría usar `TravelFactory luxury = new LuxuryTravelFactory(); Flight businessClass = luxury.createFlight(); Hotel fiveStars = luxury.createAccommodation(); Insurance fullCoverage = luxury.createInsurance();` donde cada factory crea una familia de servicios de nivel similar.

**Suites multimedia**: Adobe podría implementar `MediaFactory mp4Factory = new MP4Factory(); VideoCodec h264 = mp4Factory.createVideoCodec(); AudioCodec aac = mp4Factory.createAudioCodec(); Container container = mp4Factory.createContainer();` donde cada factory crea componentes compatibles para un formato específico.
{{% /note %}} 

---

### Patrón Decorator

Permite añadir funcionalidades a objetos existentes dinámicamente.

```java
// Componente base
interface Coffee {
    String getDescription();
    double getCost();
}

// Componente concreto
class SimpleCoffee implements Coffee {
    public String getDescription() {
        return "Café simple";
    }
    
    public double getCost() {
        return 1.0;
    }
}

// Decorator base
abstract class CoffeeDecorator implements Coffee {
    protected Coffee decoratedCoffee;
    
    public CoffeeDecorator(Coffee coffee) {
        this.decoratedCoffee = coffee;
    }
    
    public String getDescription() {
        return decoratedCoffee.getDescription();
    }
    
    public double getCost() {
        return decoratedCoffee.getCost();
    }
}

// Decoradores concretos
class MilkDecorator extends CoffeeDecorator {
    public MilkDecorator(Coffee coffee) {
        super(coffee);
    }
    
    public String getDescription() {
        return decoratedCoffee.getDescription() + ", con leche";
    }
    
    public double getCost() {
        return decoratedCoffee.getCost() + 0.5;
    }
}

class SugarDecorator extends CoffeeDecorator {
    public SugarDecorator(Coffee coffee) {
        super(coffee);
    }
    
    public String getDescription() {
        return decoratedCoffee.getDescription() + ", con azúcar";
    }
    
    public double getCost() {
        return decoratedCoffee.getCost() + 0.2;
    }
}

// Uso
public class CoffeeShop {
    public static void main(String[] args) {
        Coffee coffee = new SimpleCoffee();
        coffee = new MilkDecorator(coffee);
        coffee = new SugarDecorator(coffee);
        
        System.out.println("Descripción: " + coffee.getDescription());
        System.out.println("Costo: $" + coffee.getCost());
    }
}
```

{{% note %}}
Características del Decorator:
- Añade funcionalidad a objetos sin alterar su estructura
- Alternativa flexible a la herencia para extender funcionalidad
- Sigue el principio Open/Closed
- Permite combinar comportamientos dinámicamente

Casos de uso:
1. Streams de E/S en Java (FileInputStream, BufferedInputStream, etc.)
2. Interfaces gráficas (añadir bordes, scrollbars, etc.)
3. Middleware en aplicaciones web
4. Filtros y procesadores de datos

Ventajas:
- Mayor flexibilidad que la herencia estática
- Evita clases sobrecargadas de funcionalidad
- Permite combinar comportamientos
- Respeta el principio de responsabilidad única

Desventajas:
- Puede resultar en muchas clases pequeñas
- Puede complicar el código si se usa en exceso
- El orden de los decoradores puede ser importante

Ejemplos en Java Standard Library:
- java.io.BufferedReader(new FileReader())
- java.io.BufferedInputStream(new FileInputStream())
- javax.swing.border.BorderFactory
{{% /note %}}

---
### Casos Prácticos: Decorator
* Streams de Java (FileInputStream, BufferedInputStream)
* Sistemas de notificación (email, SMS, push)
* Renderizadores de texto (negrita, cursiva, subrayado)
* Sistemas de autorización y seguridad (filtros, validaciones)
* Bebidas personalizables en cafeterías (extras y modificadores)
{{% note %}} 
**Streams de Java**: La biblioteca de I/O de Java es el ejemplo por excelencia del patrón Decorator. Puedes encadenar decoradores para añadir funcionalidades:
```java
// InputStream básico
InputStream fileStream = new FileInputStream("datos.txt");
// Decorador para mejorar rendimiento
InputStream bufferedStream = new BufferedInputStream(fileStream);
// Decorador para descompresión
InputStream gzipStream = new GZIPInputStream(bufferedStream);
// Lees desde gzipStream, pero realmente hay 3 capas operando en secuencia
```
Cada decorador añade una responsabilidad específica (buffering, descompresión) manteniendo la misma interfaz.

**Sistemas de notificación**: Un sistema de notificaciones puede usar decoradores para combinar múltiples canales:
```java
Notificador notificador = new NotificadorEmail(new Usuario("ana@ejemplo.com"));
notificador = new NotificadorSMS(notificador, "+34612345678");
notificador = new NotificadorPush(notificador, "token123");
// Enviará por email, SMS y push con una sola llamada
notificador.enviar("Recordatorio de cita");
```
Cada decorador mantiene la interfaz Notificador y delega al componente envuelto tras añadir su propia funcionalidad.

**Renderizadores de texto**: Editores de texto como Word o Google Docs utilizan decoradores para aplicar formatos múltiples:
```java
TextoComponente texto = new TextoBase("Hola mundo");
texto = new DecoradorNegrita(texto);
texto = new DecoradorItalica(texto);
texto = new DecoradorSubrayado(texto);
String resultado = texto.renderizar(); // "<u><i><b>Hola mundo</b></i></u>"
```
Esta estructura permite aplicar formatos en cualquier orden y combinación.

**Autorización y seguridad**: En frameworks web, puedes decorar controladores con capas de seguridad:
```java
Handler paginaAdmin = new PaginaAdminHandler();
paginaAdmin = new DecoradorAutenticacion(paginaAdmin);
paginaAdmin = new DecoradorAutorizacionAdmin(paginaAdmin);
paginaAdmin = new DecoradorRegistroAuditoria(paginaAdmin);
paginaAdmin = new DecoradorRateLimiter(paginaAdmin);
// La solicitud pasa por múltiples comprobaciones antes de llegar al handler real
paginaAdmin.manejarSolicitud(request, response);
```
Cada decorador puede rechazar la solicitud o modificarla antes de pasarla al siguiente.

**Cafeterías (Starbucks)**: El ejemplo clásico que utiliza Starbucks en sus sistemas de pedidos:
```java
Bebida bebida = new Espresso();
bebida = new DecoradorLeche(bebida);
bebida = new DecoradorCaramelo(bebida);
bebida = new DecoradorCrema(bebida);
// Calculamos precio sumando base + extras
double precio = bebida.calcularPrecio();
// Generamos descripción completa
String descripcion = bebida.getDescripcion(); // "Espresso con leche, caramelo y crema"
```
Cada decorador añade precio e ingrediente, y el sistema puede componerse dinámicamente según las preferencias del cliente.

Los decoradores son extremadamente útiles cuando necesitas añadir responsabilidades a objetos de forma dinámica y transparente, especialmente cuando tienes muchas combinaciones posibles que serían imprácticas de implementar mediante subclases.
{{% /note %}} 

---

### Patrón Adapter

Permite que interfaces incompatibles trabajen juntas.

```java
// Interface objetivo
interface MediaPlayer {
    void play(String fileName);
}

// Interface incompatible
interface AdvancedMediaPlayer {
    void playMp4(String fileName);
    void playAvi(String fileName);
}

// Implementación de la interface incompatible
class AdvancedMediaPlayerImpl implements AdvancedMediaPlayer {
    public void playMp4(String fileName) {
        System.out.println("Reproduciendo MP4: " + fileName);
    }
    
    public void playAvi(String fileName) {
        System.out.println("Reproduciendo AVI: " + fileName);
    }
}

// Adapter
class MediaAdapter implements MediaPlayer {
    private AdvancedMediaPlayer advancedPlayer;
    
    public MediaAdapter() {
        this.advancedPlayer = new AdvancedMediaPlayerImpl();
    }
    
    public void play(String fileName) {
        if(fileName.endsWith(".mp4")) {
            advancedPlayer.playMp4(fileName);
        } else if(fileName.endsWith(".avi")) {
            advancedPlayer.playAvi(fileName);
        } else {
            System.out.println("Formato no soportado");
        }
    }
}

// Cliente que usa el adapter
class AudioPlayer implements MediaPlayer {
    private MediaAdapter mediaAdapter;
    
    public AudioPlayer() {
        this.mediaAdapter = new MediaAdapter();
    }
    
    public void play(String fileName) {
        if(fileName.endsWith(".mp3")) {
            System.out.println("Reproduciendo MP3: " + fileName);
        } else {
            mediaAdapter.play(fileName);
        }
    }
}

// Uso
public class MusicApp {
    public static void main(String[] args) {
        AudioPlayer player = new AudioPlayer();
        
        player.play("cancion.mp3");  // Reproducción nativa
        player.play("video.mp4");    // Usa adapter
        player.play("pelicula.avi"); // Usa adapter
    }
}
```

{{% note %}}
Características del Adapter:
- Convierte la interface de una clase en otra que el cliente espera
- Permite que clases incompatibles trabajen juntas
- Puede ser de clase (herencia) o de objeto (composición)
- Muy útil para integrar sistemas legacy o bibliotecas de terceros

Tipos de Adapter:
1. Adapter de Clase:
   - Usa herencia múltiple (donde está disponible)
   - Más rígido pero más directo
   - No puede adaptar subclases

2. Adapter de Objeto:
   - Usa composición
   - Más flexible
   - Puede adaptar cualquier subclase
   - Preferido en la mayoría de los casos

Casos de uso:
1. Integración de bibliotecas externas
2. Compatibilidad con sistemas legacy
3. Reutilización de código existente
4. APIs incompatibles

Ejemplos en Java Standard Library:
- Arrays.asList()
- InputStreamReader/OutputStreamWriter
- Collections.list()/Collections.enumeration()
{{% /note %}}

---
### Casos Prácticos: Adapter
* Frameworks de lecturas de datos legacy (JDBC-ODBC Bridge)
* Integración de APIs de terceros (redes sociales, pagos)
* Wrappers de librerías gráficas (JavaFX con Swing)
* Adaptadores de formatos de archivo (XML a JSON)
* Conectores entre sistemas incompatibles (antiguos y modernos)
{{% note %}} 
**JDBC-ODBC Bridge**: Un ejemplo clásico es el puente JDBC-ODBC que permitía a aplicaciones Java acceder a bases de datos a través de ODBC. El puente adaptaba la interfaz JDBC que esperaban las aplicaciones Java a la interfaz ODBC del sistema operativo: `Connection conn = DriverManager.getConnection("jdbc:odbc:miDSN")`. Este adaptador permitió que el código Java funcionara sin cambios con sistemas legacy.

**APIs de terceros**: Cuando integramos múltiples pasarelas de pago (PayPal, Stripe, MercadoPago), podemos crear adaptadores para unificar su uso:
```java
public interface PasarelaPago {
    boolean procesar(double monto, DatosTarjeta tarjeta);
}

public class AdaptadorPayPal implements PasarelaPago {
    private PayPalAPI paypal = new PayPalAPI();
    
    @Override
    public boolean procesar(double monto, DatosTarjeta tarjeta) {
        // Convierte nuestro formato a lo que espera PayPal
        PayPalCreditCard ppTarjeta = new PayPalCreditCard(
            tarjeta.getNumero(), tarjeta.getTitular(), 
            tarjeta.getExpiracion(), tarjeta.getCvv());
        return paypal.makePayment(monto, ppTarjeta);
    }
}
```

**Wrappers de librerías gráficas**: JavaFX proporciona adaptadores para componentes Swing con SwingNode, permitiendo incrustar componentes Swing en aplicaciones JavaFX modernas:
```java
SwingNode swingNode = new SwingNode();
swingNode.setContent(antiguoComponenteSwing);
panelJavaFX.getChildren().add(swingNode);
```
Esto facilita la migración gradual de aplicaciones antiguas a frameworks modernos.

**Adaptadores de formato**: Un adaptador XML-JSON permite que sistemas que trabajan con diferentes formatos puedan comunicarse:
```java
public class XMLToJSONAdapter implements JSONProcessor {
    private XMLProcessor xmlProcessor;
    
    @Override
    public JSONObject process(JSONObject json) {
        // Convierte JSON a XML, procesa, y vuelve a convertir
        String xml = JSONToXMLConverter.convert(json);
        String processedXML = xmlProcessor.process(xml);
        return XMLToJSONConverter.convert(processedXML);
    }
}
```

**Conectores entre sistemas**: En migraciones empresariales, los adaptadores permiten que sistemas nuevos se comuniquen con legacy hasta completar la transición:
```java
public class SistemaLegacyAdapter implements NuevaInterfazCliente {
    private SistemaAntiguo legacySystem;
    
    @Override
    public ClienteDTO obtenerCliente(String id) {
        // Convierte el formato antiguo al nuevo
        RegistroCliente registro = legacySystem.buscarRegistro("CLI", id);
        return new ClienteDTO(
            registro.getCampo("ID"),
            registro.getCampo("NOMBRE"),
            registro.getCampo("DIRECCION")
        );
    }
}
```
Este enfoque permite modernizar gradualmente sin interrumpir operaciones.
{{% /note %}} 

{{% /section %}}

---

{{% section %}}

### Patrón Strategy

Permite definir una familia de algoritmos intercambiables.

```java
// Strategy interface
interface SortStrategy {
    void sort(int[] array);
}

// Estrategias concretas
class BubbleSort implements SortStrategy {
    public void sort(int[] array) {
        System.out.println("Ordenando con Bubble Sort");
        // Implementación del bubble sort
    }
}

class QuickSort implements SortStrategy {
    public void sort(int[] array) {
        System.out.println("Ordenando con Quick Sort");
        // Implementación del quick sort
    }
}

class MergeSort implements SortStrategy {
    public void sort(int[] array) {
        System.out.println("Ordenando con Merge Sort");
        // Implementación del merge sort
    }
}

// Contexto
class Sorter {
    private SortStrategy strategy;
    
    public void setStrategy(SortStrategy strategy) {
        this.strategy = strategy;
    }
    
    public void sort(int[] array) {
        if(strategy == null) {
            throw new IllegalStateException("Estrategia no definida");
        }
        strategy.sort(array);
    }
}

// Uso
public class SortingApp {
    public static void main(String[] args) {
        int[] array = {64, 34, 25, 12, 22, 11, 90};
        Sorter sorter = new Sorter();
        
        // Usando diferentes estrategias
        sorter.setStrategy(new BubbleSort());
        sorter.sort(array);  // Ordenamiento con bubble sort
        
        sorter.setStrategy(new QuickSort());
        sorter.sort(array);  // Ordenamiento con quick sort
    }
}
```

{{% note %}}
Características del Strategy:
- Define una familia de algoritmos encapsulados
- Hace los algoritmos intercambiables
- Permite cambiar el algoritmo en tiempo de ejecución
- Separa el algoritmo de su uso

Casos de uso:
1. Diferentes métodos de ordenamiento
2. Diferentes algoritmos de compresión
3. Diferentes estrategias de validación
4. Diferentes métodos de pago en un e-commerce

Beneficios:
- Evita condicionales complejos
- Facilita la adición de nuevos algoritmos
- Permite cambiar comportamiento en runtime
- Promueve el principio Open/Closed

Ejemplos en Java Standard Library:
- Comparator interface
- javax.servlet.http.HttpServlet
- Collections.sort() con Comparator
{{% /note %}}

---

### Patrón Observer (Repaso y Profundización)

```java
// Interface Observable (Subject)
interface WeatherStation {
    void registerObserver(WeatherObserver observer);
    void removeObserver(WeatherObserver observer);
    void notifyObservers();
}

// Interface Observer
interface WeatherObserver {
    void update(float temperature, float humidity, float pressure);
}

// Implementación Concreta del Observable
class WeatherData implements WeatherStation {
    private List<WeatherObserver> observers = new ArrayList<>();
    private float temperature;
    private float humidity;
    private float pressure;
    
    public void registerObserver(WeatherObserver observer) {
        observers.add(observer);
    }
    
    public void removeObserver(WeatherObserver observer) {
        observers.remove(observer);
    }
    
    public void notifyObservers() {
        for(WeatherObserver observer : observers) {
            observer.update(temperature, humidity, pressure);
        }
    }
    
    public void setMeasurements(float temperature, float humidity, float pressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.pressure = pressure;
        notifyObservers();
    }
}

// Implementaciones Concretas de Observers
class CurrentConditionsDisplay implements WeatherObserver {
    public void update(float temperature, float humidity, float pressure) {
        System.out.println("Condiciones actuales:");
        System.out.println("Temperatura: " + temperature + "°C");
        System.out.println("Humedad: " + humidity + "%");
    }
}

class StatisticsDisplay implements WeatherObserver {
    private List<Float> temperatures = new ArrayList<>();
    
    public void update(float temperature, float humidity, float pressure) {
        temperatures.add(temperature);
        displayStats();
    }
    
    private void displayStats() {
        float avg = temperatures.stream()
            .reduce(0f, Float::sum) / temperatures.size();
        float max = Collections.max(temperatures);
        float min = Collections.min(temperatures);
        
        System.out.println("\nEstadísticas de Temperatura:");
        System.out.println("Promedio: " + avg + "°C");
        System.out.println("Máxima: " + max + "°C");
        System.out.println("Mínima: " + min + "°C");
    }
}

// Uso
public class WeatherStation {
    public static void main(String[] args) {
        WeatherData weatherData = new WeatherData();
        
        CurrentConditionsDisplay currentDisplay = new CurrentConditionsDisplay();
        StatisticsDisplay statsDisplay = new StatisticsDisplay();
        
        weatherData.registerObserver(currentDisplay);
        weatherData.registerObserver(statsDisplay);
        
        // Simulando cambios en el clima
        weatherData.setMeasurements(25.5f, 65.0f, 1013.1f);
        weatherData.setMeasurements(26.7f, 70.0f, 1014.2f);
    }
}
```

{{% note %}}
Características del Observer:
- Establece relaciones uno-a-muchos entre objetos
- Los observadores son notificados automáticamente
- Desacopla sujetos de observadores
- Soporta comunicación broadcast

Casos de uso:
1. Interfaces de usuario (eventos)
2. Monitoreo de sistemas
3. Publicación-suscripción de eventos
4. Actualización de vistas en MVC

Implementación en Java:
- Observable/Observer (obsoleto desde Java 9)
- PropertyChangeListener/PropertyChangeSupport
- EventListener en Swing
- Reactive Streams (Flow API)

Patrones relacionados:
- Mediator: coordina la comunicación entre objetos
- Singleton: el sujeto suele ser singleton
- Strategy: los observadores pueden usar diferentes estrategias
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Caso Práctico: Convertidor de Unidades

Implementaremos un convertidor de unidades usando Swing y varios patrones de diseño.

```java
// Strategy para diferentes tipos de conversión
interface ConversionStrategy {
    double convert(double value);
    String getFromUnit();
    String getToUnit();
}

class CelsiusToFahrenheitStrategy implements ConversionStrategy {
    public double convert(double celsius) {
        return (celsius * 9/5) + 32;
    }
    public String getFromUnit() { return "Celsius"; }
    public String getToUnit() { return "Fahrenheit"; }
}

class KilometersToMilesStrategy implements ConversionStrategy {
    public double convert(double km) {
        return km * 0.621371;
    }
    public String getFromUnit() { return "Kilómetros"; }
    public String getToUnit() { return "Millas"; }
}

// Observer para actualizar la interfaz
interface ConversionObserver {
    void onConversionPerformed(double result);
}

// La ventana principal implementa el observer
public class UnitConverterGUI extends JFrame implements ConversionObserver {
    private JTextField inputField;
    private JLabel resultLabel;
    private JComboBox<String> conversionType;
    private Map<String, ConversionStrategy> strategies;
    
    public UnitConverterGUI() {
        setupStrategies();
        setupGUI();
    }
    
    private void setupStrategies() {
        strategies = new HashMap<>();
        strategies.put("Temperatura", new CelsiusToFahrenheitStrategy());
        strategies.put("Distancia", new KilometersToMilesStrategy());
    }
    
    private void setupGUI() {
        setTitle("Convertidor de Unidades");
        setLayout(new GridLayout(4, 1, 10, 10));
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        conversionType = new JComboBox<>(strategies.keySet().toArray(new String[0]));
        inputField = new JTextField();
        JButton convertButton = new JButton("Convertir");
        resultLabel = new JLabel("Resultado: ", SwingConstants.CENTER);
        
        convertButton.addActionListener(e -> performConversion());
        
        add(conversionType);
        add(inputField);
        add(convertButton);
        add(resultLabel);
        
        pack();
        setSize(300, 200);
        setLocationRelativeTo(null);
    }
    
    private void performConversion() {
        try {
            String selected = (String) conversionType.getSelectedItem();
            ConversionStrategy strategy = strategies.get(selected);
            double value = Double.parseDouble(inputField.getText());
            double result = strategy.convert(value);
            onConversionPerformed(result);
        } catch (NumberFormatException ex) {
            resultLabel.setText("Error: Ingrese un número válido");
        }
    }
    
    @Override
    public void onConversionPerformed(double result) {
        String selected = (String) conversionType.getSelectedItem();
        ConversionStrategy strategy = strategies.get(selected);
        resultLabel.setText(String.format("%.2f %s = %.2f %s", 
            Double.parseDouble(inputField.getText()),
            strategy.getFromUnit(),
            result,
            strategy.getToUnit()));
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new UnitConverterGUI().setVisible(true);
        });
    }
}
```

{{% note %}}
Patrones utilizados en el convertidor:

1. Strategy:
   - ConversionStrategy define la interfaz para diferentes tipos de conversión
   - Cada estrategia implementa un tipo específico de conversión
   - Permite agregar nuevas conversiones fácilmente

2. Observer:
   - ConversionObserver define la interfaz para actualizar la UI
   - La ventana principal observa los resultados de conversión
   - Desacopla la lógica de conversión de la actualización de UI

3. Factory Method (implícito):
   - setupStrategies() actúa como factory para crear estrategias
   - Centraliza la creación de estrategias
   - Facilita la adición de nuevas estrategias

4. Singleton (implícito):
   - La ventana principal es efectivamente un singleton
   - Solo existe una instancia del convertidor

{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?