+++
title = "Más allá de POO"
subtitle = "Aplicaciones prácticas y conectividad"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 8: Aplicaciones Prácticas y Conectividad

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Gestión de dependencias con Maven {{% /fragment %}}
{{% fragment class="bullet-point" %}} Comunicación cliente-servidor con Sockets {{% /fragment %}}
{{% fragment class="bullet-point" %}} Servidor HTTP simple {{% /fragment %}}
{{% fragment class="bullet-point" %}} Consumo de APIs con HttpClient {{% /fragment %}}
{{% fragment class="bullet-point" %}} Ejercicio de Despedida: App Swing + PokeAPI {{% /fragment %}}

---

{{% section %}}

### Maven: Gestión de Dependencias

Maven es una herramienta de gestión de proyectos basada en el concepto de POM (Project Object Model).

```xml
<!-- Estructura básica de un archivo pom.xml -->
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.ejemplo</groupId>
    <artifactId>mi-proyecto</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- Dependencias del proyecto -->
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
            <version>3.12.0</version>
        </dependency>
    </dependencies>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
    </properties>
</project>
```

{{% note %}}
Maven es una herramienta esencial en el desarrollo Java moderno que ofrece:

1. Gestión automática de dependencias: Descarga automáticamente las bibliotecas necesarias y sus dependencias transitivas.

2. Ciclo de vida de construcción estandarizado: Compile, test, package, install, deploy.

3. Estructura de proyecto consistente: src/main/java, src/test/java, etc.

4. Repositories centrales: Maven Central contiene la mayoría de librerías populares.

El archivo POM (Project Object Model) es el corazón de un proyecto Maven:
- groupId: Identificador de grupo, normalmente el dominio invertido de la organización
- artifactId: Nombre del proyecto
- version: Versión del proyecto
- dependencies: Listado de dependencias
- properties: Configuraciones como versión de Java

Para añadir una dependencia solo necesitas conocer tres elementos:
- groupId de la biblioteca
- artifactId de la biblioteca
- version de la biblioteca

Maven también ofrece plugins que extienden su funcionalidad para tareas como:
- Generación de documentación Javadoc
- Compilación de recursos específicos
- Empaquetado en diferentes formatos (JAR, WAR, EAR)
- Ejecución de aplicaciones
{{% /note %}}

---

### Ejemplo: Añadir Dependencias con Maven

```xml
<dependencies>
    <!-- Para trabajar con JSON -->
    <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
        <version>2.10.1</version>
    </dependency>
    
    <!-- Para realizar peticiones HTTP -->
    <dependency>
        <groupId>org.apache.httpcomponents</groupId>
        <artifactId>httpclient</artifactId>
        <version>4.5.14</version>
    </dependency>
    
    <!-- Para pruebas unitarias -->
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>5.9.3</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```

---

### Ejemplo de Uso de una Dependencia

```java
// Ejemplo de uso de la librería Gson para trabajar con JSON
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class EjemploGson {
    public static void main(String[] args) {
        // Crear un objeto para serializar
        Persona persona = new Persona("Juan", "Pérez", 30);
        
        // Convertir objeto a JSON
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(persona);
        System.out.println("Objeto a JSON:");
        System.out.println(json);
        
        // Convertir JSON a objeto
        String jsonInput = "{\"nombre\":\"María\",\"apellido\":\"López\",\"edad\":25}";
        Persona personaDeJson = gson.fromJson(jsonInput, Persona.class);
        System.out.println("\nJSON a Objeto:");
        System.out.println("Nombre: " + personaDeJson.getNombre());
        System.out.println("Apellido: " + personaDeJson.getApellido());
        System.out.println("Edad: " + personaDeJson.getEdad());
    }
}

class Persona {
    private String nombre;
    private String apellido;
    private int edad;
    
    public Persona(String nombre, String apellido, int edad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    
    // Getters y setters
    public String getNombre() { return nombre; }
    public String getApellido() { return apellido; }
    public int getEdad() { return edad; }
}
```

{{% /section %}}

---

{{% section %}}

### Sockets en Java: Comunicación Cliente-Servidor

Los sockets proporcionan un mecanismo para la comunicación entre procesos a través de la red.

---

### Definición de la Interfaz Común

```java
// Esta interfaz define los servicios que ofrecerá nuestro servidor
public interface ServicioRemoto {
    String saludar(String nombre);
    int sumar(int a, int b);
    void enviarMensaje(String remitente, String mensaje);
}
```

---

### Implementación del Servidor

```java
import java.io.*;
import java.net.*;

public class Servidor implements ServicioRemoto {
    private static final int PUERTO = 5000;
    
    public static void main(String[] args) {
        new Servidor().iniciar();
    }
    
    public void iniciar() {
        try (ServerSocket serverSocket = new ServerSocket(PUERTO)) {
            System.out.println("Servidor iniciado en puerto " + PUERTO);
            
            while (true) {
                Socket clienteSocket = serverSocket.accept();
                System.out.println("Cliente conectado: " + clienteSocket.getInetAddress());
                
                // Crear hilo para manejar cliente
                Thread clienteHandler = new Thread(new ManejadorCliente(clienteSocket, this));
                clienteHandler.start();
            }
        } catch (IOException e) {
            System.out.println("Error en el servidor: " + e.getMessage());
        }
    }
    
    @Override
    public String saludar(String nombre) {
        return "¡Hola, " + nombre + "!";
    }
    
    @Override
    public int sumar(int a, int b) {
        return a + b;
    }
    
    @Override
    public void enviarMensaje(String remitente, String mensaje) {
        System.out.println("[" + remitente + "]: " + mensaje);
    }
}

class ManejadorCliente implements Runnable {
    private Socket clienteSocket;
    private ServicioRemoto servicio;
    
    public ManejadorCliente(Socket socket, ServicioRemoto servicio) {
        this.clienteSocket = socket;
        this.servicio = servicio;
    }
    
    @Override
    public void run() {
        try (
            BufferedReader entrada = new BufferedReader(
                new InputStreamReader(clienteSocket.getInputStream()));
            PrintWriter salida = new PrintWriter(
                clienteSocket.getOutputStream(), true)
        ) {
            String lineaEntrada;
            while ((lineaEntrada = entrada.readLine()) != null) {
                // Procesar comandos del cliente
                if (lineaEntrada.startsWith("SALUDAR:")) {
                    String nombre = lineaEntrada.substring(8);
                    salida.println(servicio.saludar(nombre));
                } else if (lineaEntrada.startsWith("SUMAR:")) {
                    String[] numeros = lineaEntrada.substring(6).split(",");
                    int a = Integer.parseInt(numeros[0]);
                    int b = Integer.parseInt(numeros[1]);
                    salida.println(servicio.sumar(a, b));
                } else if (lineaEntrada.startsWith("MENSAJE:")) {
                    String[] partes = lineaEntrada.substring(8).split(":");
                    servicio.enviarMensaje(partes[0], partes[1]);
                    salida.println("Mensaje recibido");
                } else if (lineaEntrada.equals("SALIR")) {
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error con cliente: " + e.getMessage());
        } finally {
            try {
                clienteSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
```

{{% note %}}
Los sockets son una interfaz de programación para comunicaciones en red:

1. TCP vs UDP:
   - TCP (Socket): Conexión orientada, confiable, ordenada
   - UDP (DatagramSocket): Sin conexión, no confiable, más rápido

2. Funcionamiento básico:
   - ServerSocket: Escucha conexiones entrantes en un puerto específico
   - Socket: Representa una conexión entre cliente y servidor
   - accept(): Bloquea hasta que llega una conexión
   - getInputStream()/getOutputStream(): Obtiene los flujos de comunicación

3. Manejo de conexiones múltiples:
   - Cada conexión se maneja en un hilo separado
   - Permite servir a múltiples clientes simultáneamente

4. Protocolos de comunicación:
   - Es importante definir un protocolo claro (comandos y formatos)
   - En nuestro ejemplo usamos comandos de texto simples:
     * SALUDAR:nombre
     * SUMAR:a,b
     * MENSAJE:remitente:contenido

5. Consideraciones de rendimiento:
   - Para aplicaciones de alto rendimiento, considerar NIO (Non-blocking I/O)
   - ThreadPools para limitar el número de hilos
   - Timeout para conexiones inactivas

La interfaz ServicioRemoto actúa como un contrato entre cliente y servidor, similar a RMI (Remote Method Invocation) pero implementado manualmente. Esta capa de abstracción hace que sea más fácil entender qué operaciones están disponibles.
{{% /note %}}

---

### Implementación del Cliente

```java
import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Cliente {
    private static final String HOST = "localhost";
    private static final int PUERTO = 5000;
    
    private Socket socket;
    private PrintWriter salida;
    private BufferedReader entrada;
    private String nombreUsuario;
    
    public static void main(String[] args) {
        new Cliente().iniciar();
    }
    
    public void iniciar() {
        try {
            // Conectar al servidor
            socket = new Socket(HOST, PUERTO);
            salida = new PrintWriter(socket.getOutputStream(), true);
            entrada = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            
            Scanner scanner = new Scanner(System.in);
            
            // Solicitar nombre de usuario
            System.out.print("Ingrese su nombre de usuario: ");
            nombreUsuario = scanner.nextLine();
            
            // Iniciar hilo para recibir mensajes del servidor
            Thread hiloLectura = new Thread(this::leerMensajes);
            hiloLectura.start();
            
            // Procesar comandos del usuario
            boolean ejecutando = true;
            while (ejecutando) {
                System.out.println("\nComandos disponibles:");
                System.out.println("1. Saludar");
                System.out.println("2. Sumar dos números");
                System.out.println("3. Enviar mensaje");
                System.out.println("4. Salir");
                System.out.print("Ingrese una opción: ");
                
                int opcion = Integer.parseInt(scanner.nextLine());
                
                switch (opcion) {
                    case 1:
                        System.out.print("Ingrese nombre para saludar: ");
                        String nombre = scanner.nextLine();
                        salida.println("SALUDAR:" + nombre);
                        break;
                    case 2:
                        System.out.print("Ingrese primer número: ");
                        int a = Integer.parseInt(scanner.nextLine());
                        System.out.print("Ingrese segundo número: ");
                        int b = Integer.parseInt(scanner.nextLine());
                        salida.println("SUMAR:" + a + "," + b);
                        break;
                    case 3:
                        System.out.print("Mensaje: ");
                        String mensaje = scanner.nextLine();
                        salida.println("MENSAJE:" + nombreUsuario + ":" + mensaje);
                        break;
                    case 4:
                        ejecutando = false;
                        salida.println("SALIR");
                        break;
                    default:
                        System.out.println("Opción no válida");
                }
            }
            
            // Cerrar recursos
            socket.close();
            scanner.close();
            
        } catch (IOException e) {
            System.out.println("Error en el cliente: " + e.getMessage());
        }
    }
    
    private void leerMensajes() {
        try {
            String mensajeServidor;
            while ((mensajeServidor = entrada.readLine()) != null) {
                System.out.println("\nRespuesta del servidor: " + mensajeServidor);
                System.out.print("Ingrese una opción: ");
            }
        } catch (IOException e) {
            if (!socket.isClosed()) {
                System.out.println("Error leyendo del servidor: " + e.getMessage());
            }
        }
    }
}
```

{{% /section %}}

---

{{% section %}}

### Servidor HTTP Simple

Un servidor que responde peticiones HTTP básicas visible desde un navegador.

```java
import java.io.*;
import java.net.*;

public class ServidorHTTP {
    private static final int PUERTO = 8080;
    
    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(PUERTO)) {
            System.out.println("Servidor HTTP iniciado en puerto " + PUERTO);
            System.out.println("Abra su navegador y vaya a http://localhost:" + PUERTO);
            
            while (true) {
                Socket clienteSocket = serverSocket.accept();
                Thread hiloCliente = new Thread(() -> manejarConexion(clienteSocket));
                hiloCliente.start();
            }
        } catch (IOException e) {
            System.out.println("Error en el servidor: " + e.getMessage());
        }
    }
    
    private static void manejarConexion(Socket clienteSocket) {
        try (
            BufferedReader entrada = new BufferedReader(
                new InputStreamReader(clienteSocket.getInputStream()));
            PrintWriter salida = new PrintWriter(
                clienteSocket.getOutputStream(), true)
        ) {
            // Leer la solicitud
            String lineaEntrada;
            while ((lineaEntrada = entrada.readLine()) != null) {
                if (lineaEntrada.isEmpty()) {
                    break;  // La solicitud HTTP termina con una línea vacía
                }
                System.out.println(lineaEntrada);
            }
            
            // Enviar respuesta
            String html = "<!DOCTYPE html>" +
                          "<html>" +
                          "<head>" +
                          "    <title>Servidor HTTP Simple</title>" +
                          "    <style>" +
                          "        body { font-family: Arial, sans-serif; margin: 40px; }" +
                          "        h1 { color: #2c3e50; }" +
                          "        .container { background-color: #ecf0f1; padding: 20px; " +
                          "                      border-radius: 5px; max-width: 600px; }" +
                          "        .highlight { color: #e74c3c; font-weight: bold; }" +
                          "    </style>" +
                          "</head>" +
                          "<body>" +
                          "    <div class='container'>" +
                          "        <h1>¡Hola desde mi Servidor HTTP!</h1>" +
                          "        <p>Este es un servidor HTTP simple implementado en Java.</p>" +
                          "        <p>Hora actual: <span class='highlight'>" + 
                                    java.time.LocalDateTime.now() + "</span></p>" +
                          "    </div>" +
                          "</body>" +
                          "</html>";
            
            // Cabeceras HTTP
            salida.println("HTTP/1.1 200 OK");
            salida.println("Content-Type: text/html; charset=UTF-8");
            salida.println("Content-Length: " + html.length());
            salida.println();  // Línea vacía entre cabeceras y cuerpo
            salida.println(html);
            
        } catch (IOException e) {
            System.out.println("Error con cliente: " + e.getMessage());
        } finally {
            try {
                clienteSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
```

{{% note %}}
Un servidor HTTP básico es sorprendentemente simple de implementar en Java:

1. Protocolo HTTP:
   - Es un protocolo basado en texto de solicitud-respuesta
   - Las solicitudes contienen método, ruta, versión y cabeceras
   - Las respuestas contienen código de estado, cabeceras y cuerpo

2. Componentes básicos:
   - ServerSocket para escuchar en un puerto (normalmente 80 o 8080)
   - Cada conexión se maneja en un hilo separado
   - Leer la solicitud entrante línea por línea
   - Enviar respuesta con el formato HTTP adecuado

3. Estructura de una respuesta HTTP:
   - Línea de estado: "HTTP/1.1 200 OK"
   - Cabeceras: Content-Type, Content-Length, etc.
   - Línea en blanco que separa cabeceras y cuerpo
   - Cuerpo de la respuesta (HTML, JSON, etc.)

4. Consideraciones de seguridad:
   - Validación de entradas para evitar inyecciones
   - Límites en el tamaño de solicitudes
   - Control de acceso y autenticación
   - Escape de caracteres especiales en respuestas

5. Servidores HTTP reales:
   - Implementan muchas más funcionalidades: cookies, sesiones, compresión, caché, etc.
   - Soporte para métodos HTTP (GET, POST, PUT, DELETE, etc.)
   - Mapeo de rutas a controladores o manejadores
   - Soporte para contenido estático y dinámico

Este ejemplo es útil para entender los fundamentos, pero para aplicaciones reales se recomienda usar servidores como Tomcat, Jetty o frameworks como Spring Boot.
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Consumo de APIs con HttpClient

Usando Apache HttpClient para hacer peticiones a APIs externas.

```java
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class ConsumirAPI {
    
    public static void main(String[] args) {
        // Crear el cliente HTTP
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // Definir la URL de la API
            String url = "https://pokeapi.co/api/v2/pokemon/pikachu";
            
            // Crear la solicitud GET
            HttpGet request = new HttpGet(url);
            
            // Ejecutar la solicitud
            try (CloseableHttpResponse response = httpClient.execute(request)) {
                // Obtener el código de estado
                int statusCode = response.getStatusLine().getStatusCode();
                System.out.println("Código de estado: " + statusCode);
                
                // Obtener el cuerpo de la respuesta
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    String result = EntityUtils.toString(entity);
                    
                    // Parsear el JSON con Gson
                    Gson gson = new Gson();
                    JsonObject jsonObject = gson.fromJson(result, JsonObject.class);
                    
                    // Extraer información relevante
                    String nombre = jsonObject.get("name").getAsString();
                    int altura = jsonObject.get("height").getAsInt();
                    int peso = jsonObject.get("weight").getAsInt();
                    int id = jsonObject.get("id").getAsInt();
                    
                    // Mostrar la información
                    System.out.println("Información del Pokémon:");
                    System.out.println("ID: " + id);
                    System.out.println("Nombre: " + nombre);
                    System.out.println("Altura: " + altura/10.0 + " m");
                    System.out.println("Peso: " + peso/10.0 + " kg");
                    
                    // Obtener tipos
                    System.out.println("Tipos:");
                    jsonObject.getAsJsonArray("types").forEach(element -> {
                        String tipo = element.getAsJsonObject()
                                            .getAsJsonObject("type")
                                            .get("name").getAsString();
                        System.out.println("- " + tipo);
                    });
                    
                    // Obtener URL de la imagen frontal
                    String urlImagen = jsonObject.getAsJsonObject("sprites")
                                                .get("front_default").getAsString();
                    System.out.println("URL de la imagen: " + urlImagen);
                }
            }
        } catch (Exception e) {
            System.out.println("Error al consumir la API: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
```

{{% note %}}
Apache HttpClient es una biblioteca robusta para realizar peticiones HTTP:

1. Ventajas sobre HttpURLConnection (nativo de Java):
   - API más intuitiva y completa
   - Soporte para características avanzadas como pooling de conexiones
   - Mejor manejo de cookies, redirecciones y autenticación
   - Soporte para conexiones persistentes y operaciones asíncronas

2. Componentes principales:
   - CloseableHttpClient: Cliente HTTP que maneja las conexiones
   - HttpGet, HttpPost, etc.: Clases para diferentes métodos HTTP
   - CloseableHttpResponse: Contiene la respuesta del servidor
   - HttpEntity: Representa el cuerpo de la solicitud o respuesta

3. Trabajando con JSON:
   - Gson convierte strings JSON a objetos Java y viceversa
   - JsonObject permite acceso directo a propiedades sin crear clases POJO
   - También se puede mapear a clases Java específicas para mayor tipado

4. Consideraciones al consumir APIs:
   - Rate limiting: Muchas APIs limitan el número de peticiones
   - Autenticación: Tokens, API keys, OAuth, etc.
   - Manejo de errores: Códigos HTTP, respuestas de error específicas
   - Caché: Almacenar respuestas frecuentes para reducir peticiones

5. PokeAPI:
   - API gratuita con información sobre Pokémon
   - No requiere autenticación
   - Documentación completa: https://pokeapi.co/docs/v2
   - Estructura JSON bien definida

Se puede crear una clase Pokemon para mapear directamente la respuesta JSON, pero para mantener el ejemplo simple usamos JsonObject para acceso directo.
{{% /note %}}

---

### Ejemplo: Modelo Pokemon

```java
// Clase POJO para mapear los datos de un Pokémon
public class Pokemon {
    private int id;
    private String name;
    private int height;
    private int weight;
    private List<PokemonType> types;
    private Sprites sprites;
    private List<Stat> stats;
    
    // Getters (se omiten setters si se usa solo para deserialización)
    public int getId() { return id; }
    public String getName() { return name; }
    public int getHeight() { return height; }
    public int getWeight() { return weight; }
    public List<PokemonType> getTypes() { return types; }
    public Sprites getSprites() { return sprites; }
    public List<Stat> getStats() { return stats; }
    
    // Clases internas para la estructura anidada
    public static class PokemonType {
        private int slot;
        private Type type;
        
        public int getSlot() { return slot; }
        public Type getType() { return type; }
    }
    
    public static class Type {
        private String name;
        private String url;
        
        public String getName() { return name; }
        public String getUrl() { return url; }
    }
    
    public static class Sprites {
        private String front_default;
        private String back_default;
        
        public String getFrontDefault() { return front_default; }
        public String getBackDefault() { return back_default; }
    }
    
    public static class Stat {
        private int base_stat;
        private int effort;
        private StatInfo stat;
        
        public int getBaseStat() { return base_stat; }
        public int getEffort() { return effort; }
        public StatInfo getStat() { return stat; }
    }
    
    public static class StatInfo {
        private String name;
        private String url;
        
        public String getName() { return name; }
        public String getUrl() { return url; }
    }
    
    @Override
    public String toString() {
        return "Pokemon{" +
               "id=" + id +
               ", name='" + name + '\'' +
               ", height=" + height +
               ", weight=" + weight +
               '}';
    }
}
```

---

### Ejemplo: Servicio Pokemon

```java
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;

import java.io.IOException;

public class PokemonService {
    private static final String API_BASE_URL = "https://pokeapi.co/api/v2/";
    private final CloseableHttpClient httpClient;
    private final Gson gson;
    
    public PokemonService() {
        this.httpClient = HttpClients.createDefault();
        this.gson = new Gson();
    }
    
    public Pokemon getPokemonByName(String name) throws IOException {
        String url = API_BASE_URL + "pokemon/" + name.toLowerCase();
        return executeRequest(url, Pokemon.class);
    }
    
    public Pokemon getPokemonById(int id) throws IOException {
        String url = API_BASE_URL + "pokemon/" + id;
        return executeRequest(url, Pokemon.class);
    }
    
    private <T> T executeRequest(String url, Class<T> responseType) throws IOException {
        HttpGet request = new HttpGet(url);
        
        try (CloseableHttpResponse response = httpClient.execute(request)) {
            int statusCode = response.getStatusLine().getStatusCode();
            
            if (statusCode >= 200 && statusCode < 300) {
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    String result = EntityUtils.toString(entity);
                    return gson.fromJson(result, responseType);
                }
            }
            
            throw new IOException("Request failed with status code: " + statusCode);
        }
    }
    
    // Es importante cerrar el cliente HTTP cuando ya no se necesita
    public void close() throws IOException {
        if (httpClient != null) {
            httpClient.close();
        }
    }
    
    // Ejemplo de uso
    public static void main(String[] args) {
        try (PokemonService service = new PokemonService()) {
            Pokemon pokemon = service.getPokemonByName("charizard");
            System.out.println(pokemon);
            System.out.println("Altura: " + pokemon.getHeight()/10.0 + " m");
            System.out.println("Peso: " + pokemon.getWeight()/10.0 + " kg");
            System.out.println("Tipos:");
            pokemon.getTypes().forEach(type -> {
                System.out.println("- " + type.getType().getName());
            });
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
```

{{% /section %}}

---

{{% section %}}

### Ejercicio de Despedida: App Swing + PokeAPI

Vamos a desarrollar una aplicación de escritorio simple que nos permita buscar y mostrar información de Pokémon.

---

### Estructura del Proyecto

```
src/
  ├── main/
  │     ├── java/
  │     │     ├── com/
  │     │     │     └── ejemplo/
  │     │     │           ├── pokeapp/
  │     │     │           │     ├── model/
  │     │     │           │     │     └── Pokemon.java (y clases relacionadas)
  │     │     │           │     ├── service/
  │     │     │           │     │     └── PokemonService.java
  │     │     │           │     └── ui/
  │     │     │           │           └── PokemonApp.java
```

---

### Configuración del pom.xml

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.ejemplo</groupId>
    <artifactId>poke-app</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- Para realizar peticiones HTTP -->
        <dependency>
            <groupId>org.apache.httpcomponents</groupId>
            <artifactId>httpclient</artifactId>
            <version>4.5.14</version>
        </dependency>
        
        <!-- Para trabajar con JSON -->
        <dependency>
            <groupId>com.google.code.gson</groupId>
            <artifactId>gson</artifactId>
            <version>2.10.1</version>
        </dependency>
    </dependencies>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
</project>
```

---

### Modelo: Pokemon.java

```java
package com.ejemplo.pokeapp.model;

import java.util.List;

public class Pokemon {
    private int id;
    private String name;
    private int height;
    private int weight;
    private List<PokemonType> types;
    private Sprites sprites;
    private List<Stat> stats;
    
    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public int getHeight() { return height; }
    public int getWeight() { return weight; }
    public List<PokemonType> getTypes() { return types; }
    public Sprites getSprites() { return sprites; }
    public List<Stat> getStats() { return stats; }
    
    // Clases internas para la estructura anidada
    public static class PokemonType {
        private int slot;
        private Type type;
        
        public int getSlot() { return slot; }
        public Type getType() { return type; }
    }
    
    public static class Type {
        private String name;
        private String url;
        
        public String getName() { return name; }
        public String getUrl() { return url; }
    }
    
    public static class Sprites {
        private String front_default;
        private String back_default;
        
        public String getFrontDefault() { return front_default; }
        public String getBackDefault() { return back_default; }
    }
    
    public static class Stat {
        private int base_stat;
        private int effort;
        private StatInfo stat;
        
        public int getBaseStat() { return base_stat; }
        public int getEffort() { return effort; }
        public StatInfo getStat() { return stat; }
    }
    
    public static class StatInfo {
        private String name;
        private String url;
        
        public String getName() { return name; }
        public String getUrl() { return url; }
    }
}
```

---

### Servicio: PokemonService.java

```java
package com.ejemplo.pokeapp.service;

import com.ejemplo.pokeapp.model.Pokemon;
import com.google.gson.Gson;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class PokemonService implements AutoCloseable {
    private static final String API_BASE_URL = "https://pokeapi.co/api/v2/";
    private final CloseableHttpClient httpClient;
    private final Gson gson;
    
    public PokemonService() {
        this.httpClient = HttpClients.createDefault();
        this.gson = new Gson();
    }
    
    public Pokemon getPokemonByName(String name) throws IOException {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre no puede estar vacío");
        }
        
        String url = API_BASE_URL + "pokemon/" + name.toLowerCase().trim();
        return executeRequest(url, Pokemon.class);
    }
    
    public Pokemon getPokemonById(int id) throws IOException {
        if (id <= 0) {
            throw new IllegalArgumentException("El ID debe ser un número positivo");
        }
        
        String url = API_BASE_URL + "pokemon/" + id;
        return executeRequest(url, Pokemon.class);
    }
    
    private <T> T executeRequest(String url, Class<T> responseType) throws IOException {
        HttpGet request = new HttpGet(url);
        
        try (CloseableHttpResponse response = httpClient.execute(request)) {
            int statusCode = response.getStatusLine().getStatusCode();
            
            if (statusCode >= 200 && statusCode < 300) {
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    String result = EntityUtils.toString(entity);
                    return gson.fromJson(result, responseType);
                }
            }
            
            throw new IOException("La petición falló con código: " + statusCode);
        }
    }
    
    @Override
    public void close() throws Exception {
        if (httpClient != null) {
            httpClient.close();
        }
    }
}
```

---

### UI: PokemonApp.java (Parte 1)

```java
package com.ejemplo.pokeapp.ui;

import com.ejemplo.pokeapp.model.Pokemon;
import com.ejemplo.pokeapp.service.PokemonService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.URL;
import java.util.stream.Collectors;

public class PokemonApp extends JFrame {
    
    private final PokemonService pokemonService;
    
    private JTextField searchField;
    private JButton searchButton;
    private JLabel nameLabel;
    private JLabel idLabel;
    private JLabel heightLabel;
    private JLabel weightLabel;
    private JLabel typesLabel;
    private JLabel imageLabel;
    private JPanel statsPanel;
    
    public PokemonApp() {
        pokemonService = new PokemonService();
        
        setupUI();
        
        // Cerrar recursos al cerrar la ventana
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                try {
                    pokemonService.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });
    }
    
    private void setupUI() {
        setTitle("PokeApp");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(600, 400);
        setLocationRelativeTo(null);
        
        // Panel principal con BorderLayout
        JPanel mainPanel = new JPanel(new BorderLayout(10, 10));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        // Panel de búsqueda en la parte superior
        JPanel searchPanel = new JPanel(new BorderLayout(5, 0));
        searchField = new JTextField();
        searchButton = new JButton("Buscar");
        searchPanel.add(new JLabel("Nombre o ID: "), BorderLayout.WEST);
        searchPanel.add(searchField, BorderLayout.CENTER);
        searchPanel.add(searchButton, BorderLayout.EAST);
        
        // Panel de información a la izquierda
        JPanel infoPanel = new JPanel(new GridLayout(5, 1, 5, 5));
        nameLabel = new JLabel("Nombre: ");
        idLabel = new JLabel("ID: ");
        heightLabel = new JLabel("Altura: ");
        weightLabel = new JLabel("Peso: ");
        typesLabel = new JLabel("Tipos: ");
        infoPanel.add(nameLabel);
        infoPanel.add(idLabel);
        infoPanel.add(heightLabel);
        infoPanel.add(weightLabel);
        infoPanel.add(typesLabel);
        
        // Panel para la imagen a la derecha
        JPanel imagePanel = new JPanel(new BorderLayout());
        imageLabel = new JLabel("", SwingConstants.CENTER);
        imagePanel.add(imageLabel, BorderLayout.CENTER);
        
        // Panel para las estadísticas abajo
        statsPanel = new JPanel(new GridLayout(1, 6, 5, 0));
        statsPanel.setBorder(BorderFactory.createTitledBorder("Estadísticas"));
        
        // Añadir componentes al panel principal
        mainPanel.add(searchPanel, BorderLayout.NORTH);
        mainPanel.add(infoPanel, BorderLayout.WEST);
        mainPanel.add(imagePanel, BorderLayout.CENTER);
        mainPanel.add(statsPanel, BorderLayout.SOUTH);
        
        // Configurar acción de búsqueda
        searchButton.addActionListener(this::searchPokemon);
        searchField.addActionListener(this::searchPokemon);  // Buscar al presionar Enter
        
        // Añadir panel principal al frame
        add(mainPanel);
    }
```

---

### UI: PokemonApp.java (Parte 2)

```java    
    private void searchPokemon(ActionEvent e) {
        String query = searchField.getText().trim();
        if (query.isEmpty()) {
            JOptionPane.showMessageDialog(this, 
                "Por favor ingrese un nombre o ID de Pokémon", 
                "Campo vacío", JOptionPane.WARNING_MESSAGE);
            return;
        }
        
        try {
            Pokemon pokemon;
            // Determinar si la búsqueda es por ID o por nombre
            if (query.matches("\\d+")) {
                int id = Integer.parseInt(query);
                pokemon = pokemonService.getPokemonById(id);
            } else {
                pokemon = pokemonService.getPokemonByName(query);
            }
            
            displayPokemon(pokemon);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, 
                "Error al buscar el Pokémon: " + ex.getMessage(), 
                "Error", JOptionPane.ERROR_MESSAGE);
            ex.printStackTrace();
        }
    }
    
    private void displayPokemon(Pokemon pokemon) {
        // Actualizar etiquetas de información
        nameLabel.setText("Nombre: " + capitalizarPrimeraLetra(pokemon.getName()));
        idLabel.setText("ID: " + pokemon.getId());
        heightLabel.setText("Altura: " + (pokemon.getHeight() / 10.0) + " m");
        weightLabel.setText("Peso: " + (pokemon.getWeight() / 10.0) + " kg");
        
        // Mostrar tipos
        String tipos = pokemon.getTypes().stream()
                .map(type -> capitalizarPrimeraLetra(type.getType().getName()))
                .collect(Collectors.joining(", "));
        typesLabel.setText("Tipos: " + tipos);
        
        // Mostrar imagen
        try {
            String imageUrl = pokemon.getSprites().getFrontDefault();
            if (imageUrl != null && !imageUrl.isEmpty()) {
                ImageIcon icon = new ImageIcon(new URL(imageUrl));
                imageLabel.setIcon(icon);
            } else {
                imageLabel.setIcon(null);
                imageLabel.setText("Imagen no disponible");
            }
        } catch (Exception e) {
            imageLabel.setIcon(null);
            imageLabel.setText("Error al cargar imagen");
            e.printStackTrace();
        }
        
        // Actualizar panel de estadísticas
        statsPanel.removeAll();
        if (pokemon.getStats() != null) {
            for (Pokemon.Stat stat : pokemon.getStats()) {
                String statName = stat.getStat().getName();
                int value = stat.getBaseStat();
                
                // Simplificar nombres de estadísticas
                String displayName = switch (statName) {
                    case "hp" -> "HP";
                    case "attack" -> "ATK";
                    case "defense" -> "DEF";
                    case "special-attack" -> "SP.ATK";
                    case "special-defense" -> "SP.DEF";
                    case "speed" -> "SPD";
                    default -> statName;
                };
                
                JPanel statPanel = new JPanel(new BorderLayout(0, 5));
                JLabel nameLabel = new JLabel(displayName, SwingConstants.CENTER);
                JLabel valueLabel = new JLabel(String.valueOf(value), SwingConstants.CENTER);
                JProgressBar bar = new JProgressBar(0, 255);
                bar.setValue(value);
                bar.setStringPainted(true);
                bar.setString(String.valueOf(value));
                
                statPanel.add(nameLabel, BorderLayout.NORTH);
                statPanel.add(bar, BorderLayout.CENTER);
                statsPanel.add(statPanel);
            }
        }
        
        // Repintar
        statsPanel.revalidate();
        statsPanel.repaint();
    }
    
    private String capitalizarPrimeraLetra(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            PokemonApp app = new PokemonApp();
            app.setVisible(true);
        });
    }
}
```

---

### Ejecutando la Aplicación

La aplicación final permite:

1. Buscar un Pokémon por nombre o ID
2. Ver su información básica (nombre, altura, peso, tipos)
3. Ver su imagen
4. Ver sus estadísticas en gráficos de barras

{{% note %}}
Esta aplicación Swing combinada con PokeAPI ilustra varios conceptos importantes:

1. Arquitectura en capas:
   - Capa de modelo (Pokemon.java): Representa los datos
   - Capa de servicio (PokemonService.java): Maneja la comunicación con la API
   - Capa de presentación (PokemonApp.java): Interfaz de usuario

2. Patrones de diseño:
   - Observer: Los componentes Swing usan este patrón para manejar eventos
   - MVC (Model-View-Controller): Separación de datos, presentación y lógica
   - Strategy: La búsqueda puede ser por nombre o ID (diferentes estrategias)

3. Buenas prácticas:
   - Manejo adecuado de recursos (implementación de AutoCloseable)
   - Tratamiento de errores y excepciones
   - Validación de entradas
   - Código organizado por responsabilidades

4. Conocimientos aplicados:
   - Maven para gestión de dependencias
   - HTTP para comunicación con API
   - JSON para procesamiento de datos
   - Swing para interfaces gráficas
   - Programación orientada a objetos

Esta aplicación sirve como un excelente proyecto de cierre que integra muchos conceptos vistos a lo largo del curso, demostrando cómo se pueden combinar para crear una aplicación funcional.
{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?