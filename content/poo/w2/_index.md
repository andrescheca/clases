+++
title = "Programación Orientada a Objetos - Semana 2"
subtitle = "De Python a Java: objetos, tipos y control"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 2</div>
  <h1 class="deck-cover__title">Java nos obliga a nombrar las decisiones.</h1>
  <p class="deck-cover__subtitle">La clase conecta lo que ya conocen de Python con una forma más explícita de modelar: tipos, clases, objetos, colecciones y control de flujo.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">POO</span>
    <span class="deck-cover__chip">Java básico</span>
    <span class="deck-cover__chip">De Python a Java</span>
  </div>
</div>

{{% note %}}
Objetivo: que Java deje de sentirse como ceremonia y empiece a verse como un lenguaje que hace visibles decisiones de diseño.
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Idea OO</strong>
      <span>Objeto, estado, comportamiento y responsabilidad.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Java concreto</strong>
      <span>Clases, tipos, métodos y colecciones.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Errores típicos</strong>
      <span><code>==</code>, nulos, mutabilidad y conversiones.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Ejercicio</strong>
      <span>Mini sistema de biblioteca con objetos reales.</span>
    </div>
  </div>
</div>

{{% note %}}
Objetivos de la semana:
- Conectar lo que ya conocen de Python con la forma explícita de Java.
- Introducir objetos como unión de datos y comportamiento.
- Mostrar que tipos, clases y colecciones son decisiones de diseño, no solo sintaxis.
La versión anterior tenía muchos temas de Java básico.
Aquí quedan repartidos como práctica: explicar solo lo necesario para resolver el sistema de biblioteca.
{{% /note %}}

---

### Los cuatro pilares como decisiones de diseño

<div class="case-strip">
  <div class="case-tile">
    <strong>Encapsular</strong>
    <span>Quién puede cambiar el estado y bajo qué reglas.</span>
  </div>
  <div class="case-tile">
    <strong>Abstraer</strong>
    <span>Qué operación expongo sin revelar todo el mecanismo.</span>
  </div>
  <div class="case-tile">
    <strong>Heredar</strong>
    <span>Cuándo una clase realmente es una especialización.</span>
  </div>
  <div class="case-tile">
    <strong>Polimorfismo</strong>
    <span>Cuándo puedo cambiar implementación sin cambiar uso.</span>
  </div>
</div>

<div class="takeaway">
  <strong>Lectura correcta</strong>
  Los pilares no son definiciones para memorizar. Son herramientas para decidir dónde vive una responsabilidad.
</div>

{{% note %}}
Conceptos fundamentales:
- Un objeto combina datos y acciones.
- Los objetos interactúan entre sí para resolver una tarea.
- La POO ayuda a organizar código en unidades con propósito.
- Presentar los pilares como decisiones prácticas: proteger, simplificar, reutilizar y variar comportamiento.
{{% /note %}}

---

<div class="visual-split">
  <div class="visual-copy">
    <div class="eyebrow">Modelo mental</div>
    <h2>Clase es molde. Objeto es caso vivo.</h2>
    <p class="lead">La clase declara datos y operaciones. El objeto tiene valores concretos y participa en el programa.</p>
  </div>
  <div class="visual-panel">
    <div class="concept-map">
      <div class="concept-node">
        <strong>Clase</strong>
        <span><code>Libro</code>: titulo, autor, disponible</span>
      </div>
      <div class="concept-arrow">↓ instancia</div>
      <div class="concept-node">
        <strong>Objeto</strong>
        <span><code>cleanCode</code>: "Clean Code", Martin, true</span>
      </div>
      <div class="concept-arrow">↓ responde</div>
      <div class="concept-node">
        <strong>Comportamiento</strong>
        <span><code>prestar()</code>, <code>devolver()</code>, <code>estaDisponible()</code></span>
      </div>
    </div>
  </div>
</div>

{{% note %}}
Reforzar la diferencia:
- Clase: definición, plantilla o molde.
- Objeto: instancia concreta con estado real.
- Método: comportamiento disponible.
- Usar el ejemplo de Libro para que no parezca una definición abstracta.
{{% /note %}}

---

### Python y Java no piensan igual los datos

<div class="axis">
  <div class="axis__line"></div>
  <div class="axis__labels">
    <div>
      <strong>Python</strong>
      <span>Flexibilidad rápida. El tipo se descubre en ejecución.</span>
    </div>
    <div>
      <strong>Java</strong>
      <span>Contrato explícito. El tipo se revisa antes de ejecutar.</span>
    </div>
  </div>
</div>

```java
String titulo = "Clean Code";
int paginas = 464;
boolean disponible = true;
```

{{% note %}}
No presentar Java como "más difícil", sino como "más explícito". Esa explicitud luego permite mejores herramientas, refactor y mantenimiento.
{{% /note %}}

---

### Encapsular es proteger invariantes

```java
public class CuentaBancaria {
    private double saldo;

    public void depositar(double monto) {
        if (monto <= 0) {
            throw new IllegalArgumentException("Monto inválido");
        }
        saldo += monto;
    }

    public double consultarSaldo() {
        return saldo;
    }
}
```

<div class="takeaway">
  <strong>Regla</strong>
  Un atributo privado no es decoración. Es una forma de impedir estados inválidos.
</div>

{{% note %}}
La encapsulación:
- Protege los datos de modificaciones no deseadas.
- Permite validar datos antes de modificarlos.
- Oculta implementación interna.
- Insistir en que setter no es automáticamente buen encapsulamiento si no protege ninguna regla.
{{% /note %}}

---

### Primitivos y wrappers

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Primitivo</span>
    <p><code>int</code>, <code>double</code>, <code>boolean</code></p>
    <p>Valor directo. Rápido. No puede ser <code>null</code>.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Wrapper</span>
    <p><code>Integer</code>, <code>Double</code>, <code>Boolean</code></p>
    <p>Objeto. Puede usarse en colecciones y representar ausencia.</p>
  </div>
</div>

```java
List<Integer> edades = new ArrayList<>();
edades.add(21);
```

{{% note %}}
Explicar con cuidado:
- Los primitivos guardan valores directos y no pueden ser null.
- Los wrappers son objetos y por eso funcionan con genéricos y colecciones.
- Autoboxing convierte entre primitivo y wrapper, pero no conviene esconder la diferencia conceptual.
{{% /note %}}

---

### Colecciones: elegir por intención

<div class="big-word-grid">
  <div class="big-word">
    <strong>List</strong>
    <span>Orden importa. Se permiten repetidos.</span>
  </div>
  <div class="big-word">
    <strong>Set</strong>
    <span>No quiero duplicados. La identidad importa.</span>
  </div>
  <div class="big-word">
    <strong>Map</strong>
    <span>Busco valores por una clave.</span>
  </div>
</div>

```java
List<Libro> catalogo = new ArrayList<>();
Set<String> codigos = new HashSet<>();
Map<String, Libro> porIsbn = new HashMap<>();
```

{{% note %}}
Comparación con Python:
- List se parece a list.
- Set se parece a set.
- Map se parece a dict.
La diferencia importante es el tipo explícito: Java obliga a declarar qué contiene la colección.
{{% /note %}}

---

### Control de flujo: misma intención, más estructura

<div class="split-grid">
  <div>

```python
for libro in catalogo:
    if libro.disponible:
        print(libro.titulo)
```

  </div>
  <div>

```java
for (Libro libro : catalogo) {
    if (libro.estaDisponible()) {
        System.out.println(libro.getTitulo());
    }
}
```

  </div>
</div>

<div class="takeaway">
  <strong>Idea clave</strong>
  Java no cambia la lógica. Cambia cuánto contrato escribimos alrededor de esa lógica.
</div>

{{% note %}}
Mostrar que la lógica es equivalente a Python:
- Iterar una colección.
- Preguntar una condición.
- Ejecutar una acción.
La diferencia visible está en tipos, llaves y métodos, no en la intención algorítmica.
{{% /note %}}

---

### El error que más cuesta al inicio

```java
String a = new String("Java");
String b = new String("Java");

System.out.println(a == b);      // false
System.out.println(a.equals(b)); // true
```

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title"><code>==</code></span>
    <p>Compara si dos referencias apuntan al mismo objeto.</p>
  </div>
  <div class="panel">
    <span class="panel-title"><code>equals()</code></span>
    <p>Compara igualdad lógica definida por la clase.</p>
  </div>
</div>

{{% note %}}
Este punto suele generar errores:
- En Python se usa == para igualdad de valor.
- En Java, == con objetos compara referencias.
- equals() compara igualdad lógica.
Anticipar que más adelante habrá que implementar equals() y hashCode() correctamente.
{{% /note %}}

---

### Práctica: Java dentro del caso

<div class="big-word-grid">
  <div class="big-word">
    <strong><code>enum</code></strong>
    <span>Estados finitos: <code>DISPONIBLE</code>, <code>PRESTADO</code>, <code>RESERVADO</code>.</span>
  </div>
  <div class="big-word">
    <strong><code>HashSet</code></strong>
    <span>Evita ISBN duplicados y obliga a hablar de igualdad lógica.</span>
  </div>
  <div class="big-word">
    <strong><code>String</code></strong>
    <span>Usar <code>equals()</code>, normalizar texto y evitar comparar referencias.</span>
  </div>
</div>

<div class="takeaway">
  <strong>Criterio</strong>
  Si un concepto de Java no ayuda al modelo de biblioteca, queda como referencia y no como teoría central.
</div>

{{% note %}}
Contenido recuperado de la versión anterior:
- Enumeraciones.
- HashSet.
- Métodos de String.
- Igualdad entre objetos.
La diferencia es que ahora aparecen dentro del caso de biblioteca, no como slides aisladas.
{{% /note %}}

---

### Ejercicio en clase

<ol class="step-list">
  <li><div><strong>Modelo</strong><br>Crea <code>Libro</code> con titulo, autor, isbn y disponibilidad.</div></li>
  <li><div><strong>Reglas</strong><br><code>prestar()</code> solo funciona si el libro está disponible.</div></li>
  <li><div><strong>Colección</strong><br>Guarda libros en una <code>List&lt;Libro&gt;</code>.</div></li>
  <li><div><strong>Búsqueda</strong><br>Implementa búsqueda por ISBN usando <code>equals()</code>.</div></li>
</ol>

{{% note %}}
Dinámica sugerida:
- Primero pedir que diseñen atributos y métodos antes de abrir el IDE.
- Luego implementar una versión mínima.
- Revisar si Libro protege su estado o si solo es una bolsa de datos.
- Cerrar conectando el ejercicio con encapsulación y colecciones.
{{% /note %}}

---

### Cierre

<div class="statement-slide">
  <div class="eyebrow">Para recordar</div>
  <div class="statement">El objeto no es un contenedor de datos. Es una unidad con reglas.</div>
  <p class="statement-note">Si el estado puede quedar inválido desde afuera, todavía no hay buen diseño orientado a objetos.</p>
</div>

{{% note %}}
Cierre:
- Repetir que el objetivo no es escribir más código que en Python.
- El objetivo es hacer explícitas responsabilidades y reglas.
- Preguntar: qué regla protege cada clase que escribimos hoy?
{{% /note %}}

---

### Material de respaldo: enum y estados

```java
public enum EstadoLibro {
    DISPONIBLE,
    PRESTADO,
    RESERVADO
}

public class Libro {
    private EstadoLibro estado = EstadoLibro.DISPONIBLE;

    public void prestar() {
        if (estado != EstadoLibro.DISPONIBLE) {
            throw new IllegalStateException("No disponible");
        }
        estado = EstadoLibro.PRESTADO;
    }
}
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Práctica: Java dentro del caso".
Usarla si el grupo necesita ver enum y reglas de estado con código antes del ejercicio de biblioteca.
{{% /note %}}

---

### Material de respaldo: igualdad y colecciones

```java
Set<String> isbns = new HashSet<>();
isbns.add("978-0134685991");
isbns.add("978-0134685991");

String a = new String("Java");
String b = new String("Java");

System.out.println(isbns.size()); // 1
System.out.println(a == b);       // false
System.out.println(a.equals(b));  // true
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "El error que más cuesta al inicio" y la práctica de biblioteca.
Usarla si hace falta reforzar HashSet, duplicados e igualdad lógica.
{{% /note %}}
