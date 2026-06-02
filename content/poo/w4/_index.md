+++
title = "Programación Orientada a Objetos - Semana 4"
subtitle = "Herencia, polimorfismo, interfaces y genéricos"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 4</div>
  <h1 class="deck-cover__title">No todo lo parecido merece herencia.</h1>
  <p class="deck-cover__subtitle">Herencia, interfaces, clases abstractas y genéricos son herramientas potentes. La clave está en escoger la relación correcta antes de escribir la jerarquía.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Herencia</span>
    <span class="deck-cover__chip">Polimorfismo</span>
    <span class="deck-cover__chip">Genéricos</span>
  </div>
</div>

{{% note %}}
Objetivos:
- Diferenciar herencia, interfaces y composición.
- Usar polimorfismo sin abusar de instanceof.
- Entender interfaces comunes de Java.
- Introducir genéricos como seguridad de tipos y reutilización.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Regla de diseño</div>
  <div class="statement">Herencia significa "es un". Interfaz significa "puede hacer".</div>
  <p class="statement-note">Confundir esas relaciones produce jerarquías frágiles, clases acopladas y mucho <code>instanceof</code>.</p>
</div>

{{% note %}}
Abrir con ejemplos rápidos:
- Perro es un Animal.
- Factura puede ser Imprimible.
- Pedido contiene Items.
Pedir que clasifiquen cada relación antes de ver la regla.
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Relación</strong>
      <span>Herencia, interfaz o composición.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Polimorfismo</strong>
      <span>Mismo uso, comportamientos distintos.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Contratos Java</strong>
      <span><code>Comparable</code>, <code>Comparator</code>, <code>Iterable</code>.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Genéricos</strong>
      <span>Tipos seguros sin duplicar clases.</span>
    </div>
  </div>
</div>

{{% note %}}
Explicar que esta semana tiene más herramientas, pero una sola pregunta central:
qué tipo de relación expresa mejor el dominio?
No se trata de usar todo, sino de elegir la abstracción menos peligrosa.
Esta semana tiene muchas herramientas.
El tiempo se sostiene si cada bloque termina en una decisión de diseño: qué relación conviene y por qué.
{{% /note %}}

---

### Herencia vs interfaces

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Herencia</span>
    <p>Modela una especialización real.</p>
    <p><code>Gato</code> es un <code>Animal</code>.</p>
    <p>Puede reutilizar estado y comportamiento.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Interfaz</span>
    <p>Modela una capacidad o contrato.</p>
    <p><code>Factura</code> puede ser <code>Imprimible</code>.</p>
    <p>Permite desacoplar uso e implementación.</p>
  </div>
</div>

{{% note %}}
Puntos clave:
- Java permite una sola superclase, pero múltiples interfaces.
- Herencia puede compartir implementación, pero aumenta acoplamiento.
- Interfaces permiten variar implementaciones y facilitan pruebas.
{{% /note %}}

---

### Clase abstracta: plantilla incompleta

```java
public abstract class Figura {
    private String color;

    public Figura(String color) {
        this.color = color;
    }

    public abstract double area();

    public String getColor() {
        return color;
    }
}
```

<div class="takeaway">
  <strong>Cuándo usarla</strong>
  Cuando hay comportamiento común, pero la clase base no tiene sentido como objeto completo.
</div>

{{% note %}}
Contrastar clase base regular vs abstracta:
- Una clase normal puede instanciarse.
- Una abstracta expresa que falta una parte esencial.
Enfatizar que area() fuerza a cada figura a explicar su cálculo.
{{% /note %}}

---

### Polimorfismo en una línea

```java
List<Figura> figuras = List.of(
    new Circulo(10),
    new Rectangulo(4, 8)
);

for (Figura figura : figuras) {
    System.out.println(figura.area());
}
```

<div class="concept-map">
  <div class="concept-node">
    <strong>Código cliente</strong>
    <span>Solo conoce <code>Figura</code>.</span>
  </div>
  <div class="concept-arrow">↓ decide en ejecución</div>
  <div class="concept-node">
    <strong>Objeto real</strong>
    <span><code>Circulo</code> o <code>Rectangulo</code> calcula a su manera.</span>
  </div>
</div>

{{% note %}}
Lo importante aquí es que el ciclo no cambia al agregar nuevas figuras.
Esa es la ganancia del polimorfismo: el código cliente depende del contrato, no del subtipo.
{{% /note %}}

---

### Señal de alerta (`code smell`): demasiado `instanceof`

```java
if (figura instanceof Circulo circulo) {
    return Math.PI * circulo.getRadio() * circulo.getRadio();
}

if (figura instanceof Rectangulo rectangulo) {
    return rectangulo.getBase() * rectangulo.getAltura();
}
```

<div class="takeaway">
  <strong>Señal de alerta</strong>
  Si el código revisa cada subtipo para decidir qué hacer, probablemente la operación debería vivir en la jerarquía.
</div>

{{% note %}}
No decir que instanceof está prohibido.
Decir que repetido en muchos lugares es una señal de diseño débil.
Cuando aparece para decidir comportamiento, suele faltar polimorfismo.
{{% /note %}}

---

### Interfaces comunes que sí aparecen en código real

<div class="case-strip">
  <div class="case-tile">
    <strong>Comparable</strong>
    <span>Orden natural del objeto.</span>
  </div>
  <div class="case-tile">
    <strong>Comparator</strong>
    <span>Orden externo y configurable.</span>
  </div>
  <div class="case-tile">
    <strong>Iterable</strong>
    <span>Permite recorrer con <code>for-each</code>.</span>
  </div>
  <div class="case-tile">
    <strong>Serializable</strong>
    <span>Permite persistir o transportar objetos.</span>
  </div>
</div>

{{% note %}}
Conectar con librerías reales:
- Collections.sort usa Comparable o Comparator.
- for-each usa Iterable.
- Serializable aparece al persistir o transportar objetos.
La idea es reconocer contratos estándar de Java.
{{% /note %}}

---

### Comparable vs Comparator

<div class="split-grid">
  <div>

```java
class Alumno implements Comparable<Alumno> {
    public int compareTo(Alumno otro) {
        return nombre.compareTo(otro.nombre);
    }
}
```

  </div>
  <div>

```java
Comparator<Alumno> porPromedio =
    (a, b) -> Double.compare(
        b.getPromedio(),
        a.getPromedio()
    );
```

  </div>
</div>

<div class="takeaway">
  <strong>Decisión</strong>
  Si hay un solo orden natural, <code>Comparable</code>. Si hay varios criterios, <code>Comparator</code>.
</div>

{{% note %}}
Ejemplos:
- Alumno por matrícula puede ser orden natural.
- Alumno por promedio, apellido o edad son criterios externos.
Comparator evita modificar la clase cada vez que necesitamos otro orden.
{{% /note %}}

---

### Por qué existen los genéricos

<div class="axis">
  <div class="axis__line"></div>
  <div class="axis__labels">
    <div>
      <strong>Sin genéricos</strong>
      <span>Todo parece <code>Object</code>. Los errores aparecen tarde.</span>
    </div>
    <div>
      <strong>Con genéricos</strong>
      <span>El compilador sabe qué tipo viaja por la estructura.</span>
    </div>
  </div>
</div>

```java
List<String> nombres = new ArrayList<>();
nombres.add("Ana");
String primero = nombres.get(0);
```

{{% note %}}
Sin genéricos, Java trataría los elementos como Object y habría que hacer casts.
Con genéricos, el compilador detecta errores antes de ejecutar.
Relacionar con List<Libro>, Map<String, Libro> y Optional<Cliente>.
{{% /note %}}

---

### Una clase genérica pequeña

```java
public class Caja<T> {
    private T valor;

    public void guardar(T valor) {
        this.valor = valor;
    }

    public T obtener() {
        return valor;
    }
}
```

<div class="takeaway">
  <strong>Idea</strong>
  <code>T</code> no es magia. Es una variable de tipo que se reemplaza por <code>String</code>, <code>Libro</code>, <code>Cliente</code> u otro tipo concreto.
</div>

{{% note %}}
Pedir que creen mentalmente Caja<String> y Caja<Libro>.
Mostrar que la lógica de guardar/obtener es igual, pero el tipo cambia de forma segura.
{{% /note %}}

---

### Restringir tipos genéricos

```java
public class Repositorio<T extends Identificable> {
    private Map<String, T> datos = new HashMap<>();

    public void guardar(T entidad) {
        datos.put(entidad.getId(), entidad);
    }
}
```

<div class="concept-map">
  <div class="concept-node">
    <strong><code>T</code></strong>
    <span>Puede ser cualquier subtipo de <code>Identificable</code>.</span>
  </div>
  <div class="concept-arrow">↓ garantiza</div>
  <div class="concept-node">
    <strong>Contrato</strong>
    <span>El compilador permite llamar <code>getId()</code>.</span>
  </div>
</div>

{{% note %}}
Explicar extends en genéricos como restricción.
No significa heredar implementación aquí; significa que T debe cumplir un contrato.
Eso permite llamar getId() sin cast.
{{% /note %}}

---

### Errores comunes

<div class="big-word-grid">
  <div class="big-word">
    <strong>Base frágil</strong>
    <span>Un cambio en la superclase rompe subclases.</span>
  </div>
  <div class="big-word">
    <strong>Herencia por ahorro</strong>
    <span>Extender solo para reutilizar dos métodos suele salir caro.</span>
  </div>
  <div class="big-word">
    <strong>Genéricos raw</strong>
    <span>Usar <code>List</code> en vez de <code>List&lt;Libro&gt;</code> pierde seguridad.</span>
  </div>
</div>

{{% note %}}
Usar estos errores como checklist:
- Si la superclase cambia demasiado, revisar herencia.
- Si heredamos solo para ahorrar código, considerar composición.
- Si aparece List sin tipo, corregir antes de seguir.
{{% /note %}}

---

### Taller: diagnosticar problemas

<div class="big-word-grid">
  <div class="big-word">
    <strong>Base frágil</strong>
    <span>Un cambio pequeño en la superclase rompe subclases que dependían de detalles internos.</span>
  </div>
  <div class="big-word">
    <strong><code>instanceof</code></strong>
    <span>Si decide comportamiento en varios lugares, probablemente falta polimorfismo.</span>
  </div>
  <div class="big-word">
    <strong>Type erasure</strong>
    <span>Los genéricos protegen en compilación; en ejecución el tipo concreto no siempre está disponible.</span>
  </div>
</div>

<div class="takeaway">
  <strong>Actividad</strong>
  Entregar un fragmento con herencia forzada, lista raw y comparaciones por tipo. El grupo debe proponer una refactorización.
</div>

{{% note %}}
Este bloque recupera el ejercicio de identificar problemas en código existente y el tema de type erasure.
No convertir type erasure en una clase profunda: basta con que entiendan por qué no deben depender de tipos genéricos en runtime.
{{% /note %}}

---

### Ejercicio guiado: sistema de formas

<ol class="step-list">
  <li><div><strong>Contrato</strong><br>Crear <code>Figura</code> con <code>area()</code> y <code>perimetro()</code>.</div></li>
  <li><div><strong>Especializaciones</strong><br>Implementar <code>Circulo</code>, <code>Rectangulo</code> y <code>Triangulo</code>.</div></li>
  <li><div><strong>Polimorfismo</strong><br>Guardar todo en <code>List&lt;Figura&gt;</code> y recorrer sin <code>instanceof</code>.</div></li>
  <li><div><strong>Orden</strong><br>Ordenar por área con <code>Comparator&lt;Figura&gt;</code>.</div></li>
</ol>

{{% note %}}
Dinámica:
- Implementar primero Figura y dos subclases.
- Agregar una tercera figura sin cambiar el ciclo que imprime áreas.
- Luego ordenar por área usando Comparator.
Esto fuerza polimorfismo y genéricos en el mismo ejercicio.
{{% /note %}}

---

### Ejercicio de diseño: biblioteca

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Interfaces</span>
    <p><code>Prestable</code>, <code>Reservable</code>, <code>Identificable</code>.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Clases</span>
    <p><code>Libro</code>, <code>Revista</code>, <code>Usuario</code>, <code>Prestamo</code>.</p>
  </div>
</div>

<div class="takeaway">
  <strong>Pregunta de revisión</strong>
  Qué relación es "es un", qué relación es "puede hacer" y qué relación es "contiene"?
</div>

{{% note %}}
No buscar una única respuesta inmediata.
Hacer que justifiquen:
- Libro y Revista podrían ser MaterialBiblioteca.
- Prestable puede ser interfaz.
- Prestamo contiene Usuario y Material.
Evaluar por claridad de responsabilidades.
{{% /note %}}

---

### Cierre

<div class="statement-slide">
  <div class="eyebrow">Para recordar</div>
  <div class="statement">La jerarquía no debe impresionar. Debe reducir decisiones repetidas.</div>
  <p class="statement-note">Si una jerarquía necesita explicarse demasiado, probablemente el modelo todavía está confundido.</p>
</div>

{{% note %}}
Cierre:
- La mejor jerarquía es la que vuelve el código cliente más simple.
- Si cada cambio obliga a tocar muchas subclases, revisar diseño.
- Anticipar semana 5: Comparator y listeners como objetos que delegan comportamiento.
{{% /note %}}

---

### Material de respaldo: lista raw vs lista tipada

```java
List raw = new ArrayList();
raw.add("Ana");
raw.add(42);

String nombre = (String) raw.get(1); // falla en ejecución
```

```java
List<String> nombres = new ArrayList<>();
nombres.add("Ana");
// nombres.add(42); // falla en compilación
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Por qué existen los genéricos".
Usarla si el grupo necesita ver claramente el problema que resuelven los genéricos.
{{% /note %}}

---

### Material de respaldo: problema de `instanceof`

```java
double calcularArea(Figura figura) {
    if (figura instanceof Circulo c) {
        return Math.PI * c.getRadio() * c.getRadio();
    }
    if (figura instanceof Rectangulo r) {
        return r.getBase() * r.getAltura();
    }
    throw new IllegalArgumentException("Figura desconocida");
}
```

<div class="takeaway">
  <strong>Problema</strong>
  Cada nueva figura obliga a volver a este método. El cambio no queda local.
</div>

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Señal de alerta (`code smell`): demasiado `instanceof`".
Usarla si conviene contrastar polimorfismo contra condicionales por tipo con más detalle.
{{% /note %}}
