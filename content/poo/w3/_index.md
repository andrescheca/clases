+++
title = "Programación Orientada a Objetos - Semana 3"
subtitle = "Abstracción, encapsulamiento y composición"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 3</div>
  <h1 class="deck-cover__title">Diseñar límites antes de escribir métodos.</h1>
  <p class="deck-cover__subtitle">Abstracción, encapsulamiento y composición sirven para que una clase tenga una responsabilidad clara y no exponga más de lo necesario.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Abstracción</span>
    <span class="deck-cover__chip">Encapsulamiento</span>
    <span class="deck-cover__chip">Composición</span>
  </div>
</div>

{{% note %}}
Objetivo de la semana:
- Distinguir abstracción de encapsulamiento.
- Mostrar composición como herramienta central para distribuir responsabilidades.
- Evitar que los estudiantes diseñen clases que solo almacenan datos sin comportamiento.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Cambio mental</div>
  <div class="statement">Una buena clase no muestra todo lo que sabe.</div>
  <p class="statement-note">Muestra operaciones útiles, protege su estado y colabora con otras clases pequeñas.</p>
</div>

{{% note %}}
Abrir con una pregunta: qué información debería ocultar una clase y por qué?
Conectar con ejemplos cotidianos: cajero, control remoto, pedido de restaurante.
La idea es que el usuario de una clase no tenga que conocer todos sus detalles internos.
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Abstraer</strong>
      <span>Diseñar una interfaz simple para usar algo complejo.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Encapsular</strong>
      <span>Controlar cómo cambia el estado interno.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Componer</strong>
      <span>Construir objetos colaborando con otros objetos.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Diseñar</strong>
      <span>Aplicarlo a restaurante, banco o sistema de audio.</span>
    </div>
  </div>
</div>

{{% note %}}
Presentar la secuencia como flujo de diseño:
1. Primero decido qué quiero exponer.
2. Luego protejo el estado interno.
3. Después separo responsabilidades con composición.
4. Finalmente pruebo el diseño con un caso práctico.
La clase de 2 horas necesita alternar explicación y diseño en grupos.
No dejar el restaurante para los últimos 10 minutos: debe ocupar el último tercio de la sesión.
{{% /note %}}

---

### Abstracción vs encapsulamiento

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Abstracción</span>
    <p>Decide qué operaciones entiende quien usa la clase.</p>
    <p><strong>Pregunta:</strong> qué necesito saber para usarla?</p>
  </div>
  <div class="panel">
    <span class="panel-title">Encapsulamiento</span>
    <p>Decide qué datos y reglas quedan protegidos dentro.</p>
    <p><strong>Pregunta:</strong> quién puede cambiar este estado?</p>
  </div>
</div>

<div class="takeaway">
  <strong>No son lo mismo</strong>
  Abstraer simplifica el uso. Encapsular protege la integridad.
</div>

{{% note %}}
Insistir en la diferencia:
- Abstracción mira desde afuera: qué necesito para usarlo?
- Encapsulamiento mira desde adentro: cómo evito estados inválidos?
Un buen diseño normalmente usa ambos al mismo tiempo.
{{% /note %}}

---

### Abstracción: una operación clara

```java
public class ControlRemoto {
    private Televisor televisor;

    public void subirVolumen() {
        televisor.cambiarVolumen(+1);
    }

    public void cambiarCanal(int canal) {
        if (canal > 0) {
            televisor.sintonizar(canal);
        }
    }
}
```

<div class="takeaway">
  <strong>Lectura</strong>
  Quien usa el control no necesita saber cómo se sintoniza una señal. Solo necesita una operación confiable.
</div>

{{% note %}}
Usar el ejemplo para discutir nombres de métodos.
Un método público debería sonar como acción del dominio, no como detalle técnico.
Preguntar: qué métodos privados podrían existir detrás de cambiarCanal?
{{% /note %}}

---

### Encapsulamiento: reglas cerca del dato

```java
public class CuentaBancaria {
    private double saldo;

    public void retirar(double monto) {
        if (monto <= 0 || monto > saldo) {
            throw new IllegalArgumentException("Retiro inválido");
        }
        saldo -= monto;
    }
}
```

<div class="case-strip">
  <div class="case-tile">
    <strong>private</strong>
    <span>Estado interno.</span>
  </div>
  <div class="case-tile">
    <strong>public</strong>
    <span>Operación disponible.</span>
  </div>
  <div class="case-tile">
    <strong>protected</strong>
    <span>Para herencia controlada.</span>
  </div>
  <div class="case-tile">
    <strong>package</strong>
    <span>Colaboración dentro del paquete.</span>
  </div>
</div>

{{% note %}}
Recalcar que private no basta por sí solo.
La protección ocurre cuando las operaciones públicas validan reglas.
Ejemplos de reglas: saldo no negativo, cantidad mayor a cero, estado permitido.
{{% /note %}}

---

### Composición: construir con piezas

<div class="visual-split">
  <div class="visual-copy">
    <div class="eyebrow">Diseño OO</div>
    <h2>Un objeto grande suele esconder varios objetos pequeños.</h2>
    <p class="lead">La composición evita clases que hacen demasiado. Cada pieza conserva una responsabilidad concreta.</p>
  </div>
  <div class="visual-panel">
    <div class="concept-map">
      <div class="concept-node">
        <strong>Pedido</strong>
        <span>Coordina la venta.</span>
      </div>
      <div class="concept-arrow">↓ contiene</div>
      <div class="concept-node">
        <strong>Items</strong>
        <span>Producto + cantidad + subtotal.</span>
      </div>
      <div class="concept-arrow">↓ usa</div>
      <div class="concept-node">
        <strong>Cliente</strong>
        <span>Datos de contacto y reglas de entrega.</span>
      </div>
    </div>
  </div>
</div>

{{% note %}}
La composición responde a la pregunta: de qué está hecho este objeto?
Contrastar con herencia: no todo lo relacionado necesita una superclase.
Usar Pedido e ItemPedido para mostrar una relación contiene.
{{% /note %}}

---

### Composición en código

```java
public class Pedido {
    private Cliente cliente;
    private List<ItemPedido> items = new ArrayList<>();

    public void agregar(Producto producto, int cantidad) {
        items.add(new ItemPedido(producto, cantidad));
    }

    public double total() {
        return items.stream()
            .mapToDouble(ItemPedido::subtotal)
            .sum();
    }
}
```

<div class="takeaway">
  <strong>Regla práctica</strong>
  Si una clase necesita muchos atributos de otro concepto, probablemente ese concepto merece su propia clase.
</div>

{{% note %}}
Explicar que Pedido no calcula cada detalle manualmente si ItemPedido sabe calcular su subtotal.
Eso reduce duplicación y hace que cada clase tenga una razón más clara para cambiar.
{{% /note %}}

---

### Señales de mal diseño

<div class="big-word-grid">
  <div class="big-word">
    <strong>Datos públicos</strong>
    <span>Cualquier parte del sistema puede romper invariantes.</span>
  </div>
  <div class="big-word">
    <strong>Clase dios</strong>
    <span>Una clase valida, calcula, guarda, imprime y decide.</span>
  </div>
  <div class="big-word">
    <strong>Getters sin reglas</strong>
    <span>La clase entrega datos pero no ofrece comportamiento.</span>
  </div>
</div>

{{% note %}}
Usar esta slide como revisión crítica:
- Datos públicos rompen invariantes.
- Clase dios acumula demasiadas razones para cambiar.
- Getters sin comportamiento suelen indicar modelo anémico.
Pedir ejemplos de proyectos anteriores donde hayan visto estos problemas.
{{% /note %}}

---

### Prácticas: audio y banco

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Sistema de audio</span>
    <p><strong>Objetivo:</strong> separar interfaz simple y detalle interno.</p>
    <p><code>Reproductor</code>, <code>Volumen</code>, <code>ListaReproduccion</code>.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Cuenta bancaria</span>
    <p><strong>Objetivo:</strong> proteger invariantes del saldo.</p>
    <p><code>depositar()</code>, <code>retirar()</code>, <code>transferir()</code>.</p>
  </div>
</div>

<div class="takeaway">
  <strong>Actividad</strong>
  Cada grupo resuelve uno, luego compara qué reglas quedaron dentro de la clase y cuáles quedaron afuera.
</div>


{{% note %}}
Estos dos ejercicios venían de la versión anterior.
Ahora funcionan como calentamiento antes del sistema de restaurante.
Pedir una implementación mínima y una justificación de diseño, no una solución completa.
{{% /note %}}

---

### Ejercicio: sistema de audio

<div class="split-layout">
  <div>
    <p class="lead">Diseña una API pequeña para controlar reproducción sin exponer el estado interno.</p>
    <ol class="step-list">
      <li><div><strong>Modela</strong><br><code>Reproductor</code>, <code>Volumen</code> y <code>ListaReproduccion</code>.</div></li>
      <li><div><strong>Encapsula</strong><br>El volumen debe mantenerse entre <code>0</code> y <code>100</code>.</div></li>
      <li><div><strong>Abstrae</strong><br>La lista permite avanzar canciones, pero no entrega su arreglo interno.</div></li>
      <li><div><strong>Justifica</strong><br>Explica qué detalles escondiste y por qué.</div></li>
    </ol>
  </div>
  <div class="code-card">

```java
public class Volumen {
    private int nivel;

    public void subir() {
        cambiar(1);
    }

    public void bajar() {
        cambiar(-1);
    }

    private void cambiar(int delta) {
        int nuevoNivel = nivel + delta;
        if (nuevoNivel < 0 || nuevoNivel > 100) {
            return;
        }
        nivel = nuevoNivel;
    }
}
```

  </div>
</div>

{{% note %}}
Calentamiento de 10 a 15 minutos.
No pedir interfaz gráfica ni persistencia.
Enfatizar que la API pública debe sonar como acciones del dominio: reproducir, pausar, subir volumen, avanzar.
{{% /note %}}

---

### Ejercicio: cuenta bancaria

<div class="split-layout">
  <div>
    <p class="lead">Implementa una cuenta que proteja sus reglas antes de permitir cualquier operación.</p>
    <ol class="step-list">
      <li><div><strong>Estado privado</strong><br><code>saldo</code> no debe modificarse desde afuera.</div></li>
      <li><div><strong>Reglas</strong><br>No aceptar montos negativos ni retiros sin fondos.</div></li>
      <li><div><strong>Operación compuesta</strong><br><code>transferir()</code> coordina retiro y depósito.</div></li>
      <li><div><strong>Prueba mínima</strong><br>Intenta retirar más del saldo y depositar un monto inválido.</div></li>
    </ol>
  </div>
  <div class="code-card">

```java
public class CuentaBancaria {
    private double saldo;

    public void depositar(double monto) {
        validarMonto(monto);
        saldo += monto;
    }

    public void retirar(double monto) {
        validarMonto(monto);
        if (monto > saldo) {
            throw new IllegalArgumentException("Fondos insuficientes");
        }
        saldo -= monto;
    }

    public void transferir(CuentaBancaria destino, double monto) {
        retirar(monto);
        destino.depositar(monto);
    }

    private void validarMonto(double monto) {
        if (monto <= 0) {
            throw new IllegalArgumentException("Monto inválido");
        }
    }
}
```

  </div>
</div>

{{% note %}}
Calentamiento de 10 a 15 minutos.
Pedir una implementación mínima y una justificación: por qué no hay setter de saldo y dónde viven las reglas.
Si hay discusión, conectar con invariantes y con la diferencia entre datos públicos y comportamiento.
{{% /note %}}

---

### Ejercicio guiado: sistema de restaurante

<ol class="step-list">
  <li><div><strong>Identificar entidades</strong><br><code>Mesa</code>, <code>Pedido</code>, <code>Producto</code>, <code>ItemPedido</code>, <code>Cuenta</code>.</div></li>
  <li><div><strong>Definir responsabilidades</strong><br>Escribe una frase por clase: "esta clase se encarga de...".</div></li>
  <li><div><strong>Proteger estado</strong><br>Ninguna lista interna debe modificarse directamente desde afuera.</div></li>
  <li><div><strong>Componer</strong><br>Un pedido contiene items; un item conoce producto y cantidad.</div></li>
</ol>

{{% note %}}
Dinámica:
- Dividir en grupos pequeños.
- Primero pedir responsabilidades, no código.
- Luego pedir relaciones: contiene, usa, crea.
- Finalmente implementar solo un flujo: agregar producto y calcular total.
{{% /note %}}

---

### Checklist de revisión

<ul class="checklist">
  <li>La clase tiene una responsabilidad que cabe en una frase.</li>
  <li>Los atributos importantes son privados.</li>
  <li>Los métodos públicos expresan acciones del dominio.</li>
  <li>Las reglas viven cerca de los datos que protegen.</li>
  <li>La colaboración entre objetos se entiende sin leer todo el sistema.</li>
</ul>

{{% note %}}
Usar esta lista como rúbrica rápida.
Si una clase falla en dos o más puntos, pedir rediseño antes de seguir programando.
{{% /note %}}

---

### Cierre

<div class="statement-slide">
  <div class="eyebrow">Idea central</div>
  <div class="statement">Composición primero. Herencia solo cuando el modelo la pide.</div>
  <p class="statement-note">Antes de extender una clase, preguntamos si el objeto debería colaborar con otra pieza más pequeña.</p>
</div>

{{% note %}}
Cierre:
- La composición es el mecanismo más frecuente para construir sistemas mantenibles.
- La herencia se reserva para relaciones de especialización reales.
- Preparar el puente hacia semana 4: cuándo sí conviene heredar o definir interfaces?
{{% /note %}}

---

### Material de respaldo: modificadores de acceso

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title"><code>private</code></span>
    <p>Solo la misma clase puede acceder. Es la opción normal para atributos.</p>
  </div>
  <div class="panel">
    <span class="panel-title"><code>public</code></span>
    <p>Forma parte de la interfaz visible del objeto. Debe expresar operaciones útiles.</p>
  </div>
  <div class="panel">
    <span class="panel-title"><code>protected</code></span>
    <p>Visible para subclases. Usarlo con cuidado porque acopla la jerarquía.</p>
  </div>
  <div class="panel">
    <span class="panel-title">package-private</span>
    <p>Sin palabra clave. Visible dentro del mismo paquete.</p>
  </div>
</div>

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Encapsulamiento: reglas cerca del dato".
Usarla si el grupo necesita una explicación explícita de los modificadores de acceso antes de implementar.
{{% /note %}}

---

### Material de respaldo: restaurante mínimo

```java
public class Pedido {
    private List<ItemPedido> items = new ArrayList<>();

    public void agregar(Producto producto, int cantidad) {
        if (cantidad <= 0) {
            throw new IllegalArgumentException("Cantidad inválida");
        }
        items.add(new ItemPedido(producto, cantidad));
    }

    public double total() {
        return items.stream()
            .mapToDouble(ItemPedido::subtotal)
            .sum();
    }
}
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Ejercicio guiado: sistema de restaurante".
Usarla si conviene iniciar el ejercicio con una base de código común para todos los grupos.
{{% /note %}}
