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

    // Constructor privado para forzar el uso del Builder
    private Pizza() {}

    @Override
    public String toString() {
        return "Pizza: Masa=" + masa + ", Salsa=" + salsa + ", Topping=" + topping;
    }

    // Builder abstracto
    public static abstract class PizzaBuilder {
        protected Pizza pizza = new Pizza();

        public abstract Pizza build();

        public PizzaBuilder setMasa(String masa) {
            pizza.masa = masa;
            return this;
        }

        public PizzaBuilder setSalsa(String salsa) {
            pizza.salsa = salsa;
            return this;
        }

        public PizzaBuilder setTopping(String topping) {
            pizza.topping = topping;
            return this;
        }
    }
}

// Constructor concreto
public class HawaiianPizzaBuilder extends Pizza.PizzaBuilder {
    @Override
    public Pizza build() {
        super.setTopping("Jamón y piña");  // Asegura que la pizza hawaiana tenga su topping característico
        return pizza;
    }
}

// Director que maneja el builder
public class Cocina {
    private Pizza.PizzaBuilder builder;

    public void setBuilder(Pizza.PizzaBuilder builder) {
        this.builder = builder;
    }

    public Pizza getPizza() {
        //builder.setMasa("suave").setSalsa("dulce");  // Si quisiéramos, la cocina podría tener valores por defecto
        return builder.build();
    }
}

// Ejemplo de uso del Builder
public class Cliente {
    public static void main(String[] args) {
        Cocina cocina = new Cocina();
        Pizza.PizzaBuilder builder = new HawaiianPizzaBuilder();

        cocina.setBuilder(builder);
        cocina.setBuilder(builder.setMasa("crispy").setSalsa("ligera")); // Estableciendo propiedades
        Pizza pizza = cocina.getPizza();

        System.out.println(pizza);
    }
}
```

---

### Factory

{{% fragment class="bullet-point small-text-size" %}}Encapsula la creación de objetos, escondiendo la lógica de instanciación de los usuarios.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Permite introducir nuevos tipos de objetos siguiendo el mismo protocolo de creación sin alterar el código cliente.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Facilita la codificación para interfaces en lugar de implementaciones, fomentando un bajo acoplamiento.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Simplifica la adición de nuevas variantes de productos sin afectar el código existente, adheriéndose al principio de abierto/cerrado.{{% /fragment %}}

---

### Ejemplo de Builder con Factory

```java
// Clase Documento que será construida por el Builder
public class Document {
    private String title;
    private String header;
    private String content;

    // Métodos setter omitidos por brevedad
    public void setTitle(String title) { this.title = title; }
    public void setHeader(String header) { this.header = header; }
    public void setContent(String content) { this.content = content; }

    // Método para imprimir los detalles del documento
    public void printDetails() {
        System.out.println("Title: " + title);
        System.out.println("Header: " + header);
        System.out.println("Content: " + content);
    }
}

// Builder abstracto para construir objetos Document
public abstract class DocumentBuilder {
    protected Document document;

    public DocumentBuilder() {
        document = new Document();
    }

    public DocumentBuilder setTitle(String title) {
        document.setTitle(title);
        return this;
    }

    public DocumentBuilder setHeader(String header) {
        document.setHeader(header);
        return this;
    }

    public DocumentBuilder setContent(String content) {
        document.setContent(content);
        return this;
    }

    public abstract Document build();
}

// Builder concreto para Informes de Negocio
public class BusinessReportBuilder extends DocumentBuilder {
    @Override
    public Document build() {
        // Configuraciones específicas para un informe de negocio
        document.setHeader("Confidential Business Report Header");
        return document;
    }
}

// Builder concreto para Currículums
public class ResumeBuilder extends DocumentBßuilder {
    @Override
    public Document build() {
        // Configuraciones específicas para un currículum
        document.setHeader("Curriculum Vitae");
        return document;
    }
}

// Fábrica que utiliza los builders para crear tipos específicos de documentos
public class DocumentFactory {

    public static Document createBusinessReport(String title, String content) {
        return new BusinessReportBuilder()
                .setTitle(title)
                .setContent(content)
                .build();
    }

    public static Document createResume(String name, String content) {
        return new ResumeBuilder()
                .setTitle("Resume - " + name)
                .setContent(content)
                .build();
    }
}

// Ejemplo de uso del patrón Factory y Builder
public class Cliente {
    public static void main(String[] args) {
        Document businessReport = DocumentFactory.createBusinessReport("Annual Report 2024", "Annual financial performance.");
        Document resume = DocumentFactory.createResume("John Doe", "Experienced software developer.");

        businessReport.printDetails();
        resume.printDetails();
    }
}
```

---

### Introducción a HTTP

{{% fragment class="bullet-point" %}}HTTP (Hypertext Transfer Protocol) es el protocolo de comunicación utilizado en la web para la transferencia de información entre clientes y servidores.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Es un protocolo sin estado, lo que significa que cada solicitud y respuesta es independiente de las anteriores.{{% /fragment %}}
{{% fragment class="bullet-point" %}}HTTP define varios métodos de solicitud que indican la acción que el cliente desea realizar en el servidor.{{% /fragment %}}

---

### Métodos de Solicitud HTTP

{{% fragment class="bullet-point" %}}Los métodos más comunes son GET y POST.{{% /fragment %}}
{{% fragment class="bullet-point" %}}GET: Solicita datos de un servidor.{{% /fragment %}}
{{% fragment class="bullet-point" %}}POST: Envía datos al servidor para ser procesados.{{% /fragment %}}

---

### Método GET

{{% fragment class="bullet-point" %}}Se utiliza para solicitar datos de un recurso específico en el servidor.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Los datos solicitados se pasan a través de la URL.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Es idempotente, lo que significa que múltiples solicitudes idénticas tendrán el mismo efecto.{{% /fragment %}}

---

### Ejemplo de Solicitud GET

```java
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class GetRequestExample {
    public static void main(String[] args) throws Exception {
        String url = "http://ifconfig.me/all.json";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");
        
        int responseCode = con.getResponseCode();
        System.out.println("GET Response Code :: " + responseCode);

        if (responseCode == HttpURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            System.out.println(response.toString());
        } else {
            System.out.println("Hubo un error, codigo de respuesta " +  responseCode);
        }
    }
}
```
---

### Método POST

{{% fragment class="bullet-point" %}}Se utiliza para enviar datos al servidor para crear o actualizar un recurso.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Los datos se envían en el cuerpo de la solicitud.{{% /fragment %}}
{{% fragment class="bullet-point" %}}No es idempotente, múltiples solicitudes idénticas pueden tener efectos diferentes.{{% /fragment %}}

---

### Ejemplo de Solicitud Post

```java
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class PostRequestExample {
    public static void main(String[] args) throws Exception {
        String url = "https://dev.jorge.moran.com.ec/ejemplo_post.php";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        
        String jsonInputString = "{\"name\": \"John\", \"age\": 30}";
        
        con.setDoOutput(true);
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);           
        }

        int responseCode = con.getResponseCode();
        System.out.println("POST Response Code :: " + responseCode);

        if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            System.out.println(response.toString());
        } else {
            System.out.println("Hubo un error, codigo de respuesta " +  responseCode);
        }
    }
}
```
---
### WebHooks

{{% fragment class="bullet-point" %}}Un webhook es una manera de que una aplicación proporcione información en tiempo real a otras aplicaciones.{{% /fragment %}}
{{% fragment class="bullet-point" %}}En lugar de que la aplicación consulte la información, la información se envía automáticamente cuando ocurre un evento.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Se utiliza comúnmente para notificaciones y eventos en tiempo real.{{% /fragment %}}

---

### Ejercicio de WebHooks - Notificación de Estado de Pedido (1/3)

{{% fragment class="bullet-point small-text-size" %}}Simula el cambio de estado de un pedido en una tienda online desde "Pendiente" a "Enviado".{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Crea un programa Java que genere un ID de pedido aleatorio y asigne estos estados al pedido (podemos usar la clase Random){{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Prepara el payload para enviar al webhook con los detalles del pedido, incluyendo ID y estados.{{% /fragment %}}

---

### Ejercicio de WebHooks - Notificación de Estado de Pedido (2/3)

{{% fragment class="bullet-point small-text-size" %}}Utiliza `HttpURLConnection` para hacer una solicitud POST al webhook con el payload.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Asegúrate de configurar correctamente los headers y el cuerpo de la solicitud.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Implementa la lectura de la respuesta del servidor y muestra el código de respuesta en la consola.{{% /fragment %}}

---
### Ejercicio de WebHooks - Notificación de Estado de Pedido (3/3)

{{% fragment class="bullet-point small-text-size" %}}La ruta del servidor es: `https://dev.jorge.moran.com.ec/ejercicio_webhooks.php`{{% /fragment %}}

```
{
    "orderId": 123,
    "previousStatus": "Pendiente",
    "newStatus": "Enviado"
}
```
{{% note %}}
```
curl -X POST https://dev.jorge.moran.com.ec/ejercicio_webhooks.php -H "Content-Type: application/json" -d '{"orderId": 123, "previousStatus": "Pendiente", "newStatus": "Enviado"}'
```
{{% /note %}}


---

### Uniendo conceptos

{{% fragment class="bullet-point small-text-size" %}}Vamos a crear una fábrica de notificaciones{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}La fábrica usará builders de varios tipos (PushBullet y Telegram){{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Desde el Main enviaremos notificaciones a ambos canales{{% /fragment %}}

---

### Adapter

{{% fragment class="bullet-point small-text-size" %}}Permite que interfaces incompatibles trabajen juntas.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Convierte la interfaz de una clase en otra interfaz que un cliente espera.{{% /fragment %}}

---

### Ejemplo de Adapter

```java
// Interfaz MediaPlayer para reproducir archivos de medios
public interface MediaPlayer {
    void play(String tipo, String archivo);
}

// Clase AudioPlayer que implementa MediaPlayer
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

// Interfaz AdvancedMediaPlayer para reproductores de medios avanzados
public interface AdvancedMediaPlayer {
    void playVlc(String archivo);
    void playMp4(String archivo);
}

// Clase VlcPlayer que implementa AdvancedMediaPlayer para archivos VLC
public class VlcPlayer implements AdvancedMediaPlayer {
    @Override
    public void playVlc(String archivo) {
        System.out.println("Reproduciendo archivo VLC: " + archivo);
    }

    @Override
    public void playMp4(String archivo) {
        // No implementado aquí
    }
}

// Clase Mp4Player que implementa AdvancedMediaPlayer para archivos MP4
public class Mp4Player implements AdvancedMediaPlayer {
    @Override
    public void playVlc(String archivo) {
        // No implementado aquí
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
        switch (tipo.toLowerCase()) {
            case "vlc":
                advancedMediaPlayer = new VlcPlayer();
                break;
            case "mp4":
                advancedMediaPlayer = new Mp4Player();
                break;
            default:
                throw new IllegalArgumentException("Formato no soportado: " + tipo);
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