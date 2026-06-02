+++
title = "Programación Orientada a Objetos - Semana 8"
subtitle = "Maven, red, HTTP y APIs"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 8</div>
  <h1 class="deck-cover__title">POO fuera del aula: dependencias, red y datos reales.</h1>
  <p class="deck-cover__subtitle">La última semana conecta objetos Java con herramientas y sistemas externos: Maven, sockets, HTTP, JSON y una aplicación Swing que consume una API real.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Maven</span>
    <span class="deck-cover__chip">HTTP</span>
    <span class="deck-cover__chip">PokeAPI</span>
  </div>
</div>

{{% note %}}
Objetivos:
- Entender Maven como herramienta de gestión de proyecto y dependencias.
- Conocer la idea básica de comunicación cliente-servidor.
- Diferenciar sockets de HTTP.
- Consumir una API externa y transformar JSON en objetos Java.
- Integrar el curso en una app Swing pequeña.
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Proyecto</strong>
      <span>Maven organiza código y dependencias.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Comunicación</strong>
      <span>Sockets y HTTP conectan procesos.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Datos</strong>
      <span>JSON viaja entre sistemas.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>App final</strong>
      <span>Swing + servicio + modelo + API externa.</span>
    </div>
  </div>
</div>

{{% note %}}
Presentar la semana como salida al mundo real:
hasta ahora diseñamos objetos dentro de una aplicación.
Hoy esos objetos conversan con librerías, red, APIs y usuarios.
La semana 8 perdió mucho código visible de la app final.
La solución es usar una fase de laboratorio más explícita, no llenar la explicación inicial con todos los archivos.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Cierre del curso</div>
  <div class="statement">Un objeto útil casi siempre colabora con algo externo.</div>
  <p class="statement-note">Archivos, librerías, servidores, APIs y usuarios obligan a diseñar límites claros.</p>
</div>

{{% note %}}
Explicar que los límites importan más cuando hay dependencias externas.
Si la API cambia o falla, no queremos que toda la interfaz gráfica dependa de esos detalles.
{{% /note %}}

---

### Maven: el contrato del proyecto

```xml
<project>
  <modelVersion>4.0.0</modelVersion>

  <groupId>edu.uees</groupId>
  <artifactId>pokemon-app</artifactId>
  <version>1.0.0</version>

  <dependencies>
    <dependency>
      <groupId>com.google.code.gson</groupId>
      <artifactId>gson</artifactId>
      <version>2.10.1</version>
    </dependency>
  </dependencies>
</project>
```

{{% note %}}
Maven ofrece:
- Gestión automática de dependencias y transitivas.
- Ciclo de vida estandarizado: compile, test, package, install, deploy.
- Estructura de proyecto consistente.
- Acceso a repositorios como Maven Central.
El POM define identidad del proyecto y dependencias.
{{% /note %}}

---

### Qué resuelve Maven

<div class="big-word-grid">
  <div class="big-word">
    <strong>Dependencias</strong>
    <span>Descarga librerías y sus dependencias transitivas.</span>
  </div>
  <div class="big-word">
    <strong>Estructura</strong>
    <span>Ordena código en <code>src/main/java</code> y <code>src/test/java</code>.</span>
  </div>
  <div class="big-word">
    <strong>Ciclo de vida</strong>
    <span><code>compile</code>, <code>test</code>, <code>package</code>, <code>install</code>.</span>
  </div>
</div>

{{% note %}}
Comparar con descargar jars manualmente:
Maven evita copiar archivos a mano, documenta versiones y permite reconstruir el proyecto en otra máquina.
Resaltar groupId, artifactId y version como coordenadas de una dependencia.
{{% /note %}}

---

### Sockets: hablar con otro proceso

<div class="concept-map">
  <div class="concept-node">
    <strong>Cliente</strong>
    <span>Abre conexión a host y puerto.</span>
  </div>
  <div class="concept-arrow">↓ bytes</div>
  <div class="concept-node">
    <strong>Socket</strong>
    <span>Canal de entrada y salida.</span>
  </div>
  <div class="concept-arrow">↓ respuesta</div>
  <div class="concept-node">
    <strong>Servidor</strong>
    <span>Escucha, procesa y responde.</span>
  </div>
</div>

{{% note %}}
Sockets:
- ServerSocket escucha en un puerto.
- Socket representa una conexión entre cliente y servidor.
- getInputStream y getOutputStream permiten leer y escribir.
- TCP es confiable y ordenado; UDP sacrifica garantías por velocidad.
{{% /note %}}

---

### Servidor mínimo

```java
try (ServerSocket server = new ServerSocket(8080)) {
    Socket cliente = server.accept();

    BufferedReader in = new BufferedReader(
        new InputStreamReader(cliente.getInputStream())
    );

    PrintWriter out = new PrintWriter(cliente.getOutputStream(), true);
    out.println("Hola " + in.readLine());
}
```

<div class="takeaway">
  <strong>Lectura</strong>
  Socket es bajo nivel. Enseña el mecanismo, pero en aplicaciones modernas normalmente usamos HTTP.
</div>

{{% note %}}
Este ejemplo es intencionalmente simple.
Mencionar que un servidor real debe manejar múltiples clientes, timeouts, errores y cierre de recursos.
La utilidad de verlo es entender qué hay debajo de protocolos más altos.
{{% /note %}}

---

### HTTP: protocolo sobre la red

<div class="case-strip">
  <div class="case-tile">
    <strong>GET</strong>
    <span>Consultar recurso.</span>
  </div>
  <div class="case-tile">
    <strong>POST</strong>
    <span>Crear o enviar datos.</span>
  </div>
  <div class="case-tile">
    <strong>Status</strong>
    <span>200, 404, 500 comunican resultado.</span>
  </div>
  <div class="case-tile">
    <strong>JSON</strong>
    <span>Formato común para intercambiar datos.</span>
  </div>
</div>

{{% note %}}
HTTP:
- Es texto estructurado de solicitud-respuesta.
- Tiene método, ruta, cabeceras y cuerpo.
- El status code comunica resultado.
- JSON suele viajar como cuerpo en APIs modernas.
Conectar con servidores reales como Tomcat, Jetty o Spring Boot.
{{% /note %}}

---

### HttpClient en Java

```java
HttpClient client = HttpClient.newHttpClient();

HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://pokeapi.co/api/v2/pokemon/pikachu"))
    .GET()
    .build();

HttpResponse<String> response =
    client.send(request, HttpResponse.BodyHandlers.ofString());

String json = response.body();
```

{{% note %}}
Explicar el flujo:
1. Crear cliente.
2. Construir request.
3. Enviar request.
4. Recibir response.
5. Revisar status y body.
Mencionar que en producción hay que manejar errores, timeouts y rate limiting.
{{% /note %}}

---

### Modelo: convertir JSON en objeto

```java
public class Pokemon {
    private String name;
    private int height;
    private int weight;

    public String getName() {
        return name;
    }
}
```

```java
Gson gson = new Gson();
Pokemon pokemon = gson.fromJson(json, Pokemon.class);
```

<div class="takeaway">
  <strong>Diseño</strong>
  La API entrega texto. El modelo Java recupera significado para el resto del programa.
</div>

{{% note %}}
Gson puede trabajar de dos formas:
- JsonObject para explorar respuestas sin clases.
- POJOs como Pokemon para tener tipado y mejor diseño.
Para una app mantenible, preferimos modelo explícito.
{{% /note %}}

---

### Servicio: aislar la API

```java
public class PokemonService {
    private final HttpClient client = HttpClient.newHttpClient();
    private final Gson gson = new Gson();

    public Pokemon buscar(String nombre) throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://pokeapi.co/api/v2/pokemon/" + nombre))
            .GET()
            .build();

        String json = client.send(request, BodyHandlers.ofString()).body();
        return gson.fromJson(json, Pokemon.class);
    }
}
```

{{% note %}}
PokemonService actúa como frontera:
- La UI no sabe de URLs.
- La UI no sabe de JSON.
- La UI recibe objetos o errores claros.
Esto facilita pruebas y cambios si la API cambia.
{{% /note %}}

---

### Arquitectura de la app final

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Swing UI</strong>
      <span>Lee nombre y muestra resultado.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>PokemonService</strong>
      <span>Hace HTTP y transforma JSON.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Pokemon</strong>
      <span>Modelo del dominio que usa la app.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Errores</strong>
      <span>Red, 404 y parsing deben manejarse claramente.</span>
    </div>
  </div>
</div>

{{% note %}}
Reforzar separación:
- Swing UI captura evento y muestra salida.
- Servicio hace comunicación y parsing.
- Modelo representa datos.
- Errores se traducen a mensajes para usuario.
Esta arquitectura resume varias semanas del curso.
{{% /note %}}

---

### Errores reales que debe manejar

<div class="big-word-grid">
  <div class="big-word">
    <strong>Nombre vacío</strong>
    <span>Validación antes de llamar la API.</span>
  </div>
  <div class="big-word">
    <strong>404</strong>
    <span>Pokemon no encontrado.</span>
  </div>
  <div class="big-word">
    <strong>Red</strong>
    <span>Sin internet, timeout o API no disponible.</span>
  </div>
</div>

{{% note %}}
No permitir que la app falle con stack trace en pantalla.
Casos mínimos:
- Texto vacío.
- Pokemon no existe.
- No hay internet.
- La API tarda o responde error.
Esto conecta excepciones con UX.
{{% /note %}}

---

### Estructura del proyecto final

```text
pokemon-app/
  pom.xml
  src/main/java/edu/uees/poo/
    model/Pokemon.java
    service/PokemonService.java
    ui/PokemonApp.java
    Main.java
```

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Regla de diseño</span>
    <p>La UI no construye URLs ni parsea JSON. Solo pide datos al servicio.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Regla de entrega</span>
    <p>Debe ejecutar con <code>mvn package</code> o desde IntelliJ sin pasos manuales ocultos.</p>
  </div>
</div>

{{% note %}}
Esto recupera la estructura detallada de la versión anterior.
Si el grupo necesita más guía, crear los paquetes en vivo antes de implementar cada clase.
La separación model/service/ui es la idea central de POO aplicada a una app real.
{{% /note %}}

---

### UI: conectar Swing con el servicio

```java
public class PokemonApp extends JFrame {
    private final PokemonService service = new PokemonService();
    private final JTextField input = new JTextField(16);
    private final JLabel resultado = new JLabel("Busca un Pokemon");

    public PokemonApp() {
        JButton buscar = new JButton("Buscar");
        JPanel panel = new JPanel(new FlowLayout());

        buscar.addActionListener(event -> {
            try {
                Pokemon pokemon = service.buscar(input.getText().trim());
                resultado.setText(pokemon.getName());
            } catch (Exception ex) {
                resultado.setText("No se pudo consultar la API");
            }
        });

        panel.add(input);
        panel.add(buscar);
        panel.add(resultado);
        add(panel);
        pack();
    }
}
```

<div class="takeaway">
  <strong>Separación</strong>
  La UI captura el evento. El servicio conoce HTTP. El modelo representa el resultado.
</div>

{{% note %}}
Esta slide recupera parte del código visible de PokemonApp de la versión anterior, pero sin saturar la clase.
Completar en vivo:
- Agregar componentes a un JPanel.
- Mostrar nombre, altura y peso.
- Manejar texto vacío antes de llamar al servicio.
- Mejorar el mensaje de error para 404 y red.
{{% /note %}}

---

### Ejercicio de cierre

<ol class="step-list">
  <li><div><strong>Crear proyecto Maven</strong><br>Configurar <code>pom.xml</code> con Gson.</div></li>
  <li><div><strong>Modelo</strong><br>Crear <code>Pokemon</code> con campos mínimos.</div></li>
  <li><div><strong>Servicio</strong><br>Crear <code>PokemonService.buscar(nombre)</code>.</div></li>
  <li><div><strong>Interfaz</strong><br>Crear Swing UI con campo, botón y área de resultado.</div></li>
  <li><div><strong>Errores</strong><br>Mostrar mensajes claros, no stack traces al usuario.</div></li>
</ol>

{{% note %}}
Dinámica sugerida:
- Dar estructura Maven base.
- Implementar primero PokemonService y probarlo en consola.
- Luego conectar Swing.
- Si hay tiempo, mostrar imagen o tipos del Pokemon.
- Evaluar separación entre UI, servicio y modelo.
{{% /note %}}

---

### Cierre del semestre

<div class="statement-slide">
  <div class="eyebrow">POO en práctica</div>
  <div class="statement">Diseñar objetos es diseñar colaboración.</div>
  <p class="statement-note">Cuando una app habla con usuarios, archivos, librerías y APIs, la calidad del diseño se nota en dónde quedan los límites.</p>
</div>

{{% note %}}
Cierre del curso:
- POO no termina en clases y objetos básicos.
- Sirve para aislar cambios, errores y dependencias externas.
- Preguntar: qué límite del diseño les parece más importante en la app final?
{{% /note %}}

---

### Material de respaldo: `pom.xml` completo

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0">
  <modelVersion>4.0.0</modelVersion>
  <groupId>edu.uees</groupId>
  <artifactId>pokemon-app</artifactId>
  <version>1.0.0</version>

  <properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
  </properties>

  <dependencies>
    <dependency>
      <groupId>com.google.code.gson</groupId>
      <artifactId>gson</artifactId>
      <version>2.10.1</version>
    </dependency>
  </dependencies>
</project>
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Maven: el contrato del proyecto".
Usarla si el grupo necesita copiar una base completa de Maven para el ejercicio final.
{{% /note %}}

---

### Material de respaldo: modelo Pokemon ampliado

```java
public class Pokemon {
    private int id;
    private String name;
    private int height;
    private int weight;

    public int getId() { return id; }
    public String getName() { return name; }
    public int getHeight() { return height; }
    public int getWeight() { return weight; }
}
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Modelo: convertir JSON en objeto".
Usarla si se necesita recuperar más campos del modelo antes de conectar Swing con la API.
{{% /note %}}
