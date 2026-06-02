+++
title = "Programación Orientada a Objetos - Semana 7"
subtitle = "Patrones de diseño en práctica"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 7</div>
  <h1 class="deck-cover__title">Los patrones importan cuando reducen fricción real.</h1>
  <p class="deck-cover__subtitle">Builder, Factory, Decorator, Adapter, Strategy y Observer no son recetas para memorizar. Son respuestas a problemas de creación, extensión, adaptación y comunicación.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Builder</span>
    <span class="deck-cover__chip">Adapter</span>
    <span class="deck-cover__chip">Strategy</span>
  </div>
</div>

{{% note %}}
Objetivos:
- Profundizar en patrones creacionales, estructurales y de comportamiento.
- Reconocer el problema que justifica cada patrón.
- Aplicar varios patrones en un caso práctico con Swing.
{{% /note %}}

---

### La ruta de hoy

<div class="case-strip">
  <div class="case-tile">
    <strong>Crear</strong>
    <span>Builder, Factory Method, Abstract Factory.</span>
  </div>
  <div class="case-tile">
    <strong>Envolver</strong>
    <span>Decorator agrega comportamiento sin heredar.</span>
  </div>
  <div class="case-tile">
    <strong>Adaptar</strong>
    <span>Adapter conecta interfaces incompatibles.</span>
  </div>
  <div class="case-tile">
    <strong>Decidir</strong>
    <span>Strategy y Observer separan comportamientos.</span>
  </div>
</div>

{{% note %}}
Presentar la ruta por problemas:
- Crear objetos complejos.
- Agregar comportamiento sin heredar.
- Adaptar código externo.
- Cambiar algoritmos.
- Notificar cambios.
Esto evita que los patrones parezcan una lista para memorizar.
La versión anterior tenía muchos ejemplos largos por patrón.
Ahora se mantienen como rondas de práctica: problema, patrón, cambio que debe quedar localizado.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Criterio</div>
  <div class="statement">No empezamos por el patrón. Empezamos por el problema.</div>
  <p class="statement-note">Si el problema no existe, el patrón agrega ceremonia. Si el problema existe, el patrón nombra una solución reconocible.</p>
</div>

{{% note %}}
Repetir esta idea durante toda la clase.
Un estudiante puede implementar un patrón correctamente y aun así diseñar mal si el patrón no respondía a un problema real.
{{% /note %}}

---

### Builder: muchos pasos, objeto claro

```java
Pedido pedido = new PedidoBuilder()
    .cliente(cliente)
    .agregar(producto, 2)
    .agregar(otroProducto, 1)
    .conEnvio("Urdesa")
    .build();
```

<div class="takeaway">
  <strong>Cuándo usarlo</strong>
  Cuando el constructor empieza a tener muchos parámetros opcionales o el objeto necesita construirse por etapas.
</div>

{{% note %}}
Builder:
- Construye objetos complejos paso a paso.
- Mejora legibilidad cuando hay muchos parámetros opcionales.
- Ayuda a mantener objetos finales consistentes.
Ejemplos Java: StringBuilder, Stream.Builder, DocumentBuilder.
{{% /note %}}

---

### Builder evita constructores ilegibles

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Sin Builder</span>
    <p><code>new Pedido(c, p, true, null, 10, "U")</code></p>
    <p>Difícil saber qué significa cada argumento.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Con Builder</span>
    <p><code>.cliente(c).conEnvio("U").build()</code></p>
    <p>La construcción se lee como configuración.</p>
  </div>
</div>

{{% note %}}
Usar esta comparación para que vean el costo cognitivo.
El constructor largo obliga a recordar posiciones.
Builder nombra cada decisión de construcción.
{{% /note %}}

---

### Casos reales: Builder

<div class="case-strip">
  <div class="case-tile">
    <strong>HTTP</strong>
    <span><code>HttpRequest.newBuilder()</code> arma URL, método, headers y body paso a paso.</span>
  </div>
  <div class="case-tile">
    <strong>Texto</strong>
    <span><code>StringBuilder</code> construye cadenas mutables antes de producir un <code>String</code>.</span>
  </div>
  <div class="case-tile">
    <strong>Pedido</strong>
    <span>Cliente, items, envío, descuento e impuestos no caben bien en un constructor largo.</span>
  </div>
</div>

{{% note %}}
Builder no es solo "fluent syntax".
La razón es controlar construcción progresiva y legible.
Si el objeto tiene pocos campos obligatorios, probablemente basta con constructor o factory.
{{% /note %}}

---

### Factory Method: crear sin conocer la clase concreta

```java
public interface Reporte {
    void generar();
}

public abstract class ReporteCreator {
    public void ejecutar() {
        Reporte reporte = crearReporte();
        reporte.generar();
    }

    protected abstract Reporte crearReporte();
}
```

<div class="takeaway">
  <strong>Idea</strong>
  La clase base conoce el flujo. La subclase decide qué producto concreto crear.
</div>

{{% note %}}
Factory Method:
- Crea objetos en un solo paso.
- Encapsula la decisión de clase concreta.
- Es útil cuando el flujo es común, pero el producto cambia.
Comparar con Builder: Builder configura; Factory selecciona/crea.
{{% /note %}}

---

### Casos reales: Factory Method

<div class="case-strip">
  <div class="case-tile">
    <strong>Pagos</strong>
    <span>Crear procesador para tarjeta, PayPal, transferencia o billetera.</span>
  </div>
  <div class="case-tile">
    <strong>Archivos</strong>
    <span>Crear parser según extensión: CSV, JSON, XML o PDF.</span>
  </div>
  <div class="case-tile">
    <strong>Reportes</strong>
    <span>Crear exportador PDF, Excel o HTML sin cambiar el flujo de generación.</span>
  </div>
</div>

{{% note %}}
La pregunta no es "qué patrón quiero usar".
La pregunta es: quién debería saber qué clase concreta se instancia?
Si esa decisión aparece repetida en varios lugares, Factory Method o Factory suele ayudar.
{{% /note %}}

---

### Abstract Factory: familias compatibles

<div class="concept-map">
  <div class="concept-node">
    <strong>UIFactory</strong>
    <span>Crea familia de componentes.</span>
  </div>
  <div class="concept-arrow">↓</div>
  <div class="concept-node">
    <strong>LightFactory / DarkFactory</strong>
    <span>Botón, campo y panel compatibles entre sí.</span>
  </div>
  <div class="concept-arrow">↓</div>
  <div class="concept-node">
    <strong>Aplicación</strong>
    <span>Usa interfaces, no clases concretas.</span>
  </div>
</div>

{{% note %}}
Abstract Factory se justifica cuando hay familias de objetos que deben ser compatibles.
Ejemplo: componentes de UI de un mismo tema.
No usar si solo se crea un objeto aislado.
{{% /note %}}

---

### Casos reales: Abstract Factory

<div class="case-strip">
  <div class="case-tile">
    <strong>UI temática</strong>
    <span>Botón, campo y menú de un mismo tema visual.</span>
  </div>
  <div class="case-tile">
    <strong>Base de datos</strong>
    <span>Conexión, query builder y transacción compatibles con MySQL o PostgreSQL.</span>
  </div>
  <div class="case-tile">
    <strong>Multimedia</strong>
    <span>Codec de video, codec de audio y contenedor para un mismo formato.</span>
  </div>
</div>

{{% note %}}
Abstract Factory se entiende mejor con compatibilidad:
no queremos mezclar una conexión MySQL con un query builder pensado para otro motor.
Si no hay familia compatible, el patrón puede ser excesivo.
{{% /note %}}

---

### Decorator: agregar comportamiento por capas

```java
Notificador notificador =
    new ConAuditoria(
        new ConReintentos(
            new EmailNotificador()
        )
    );

notificador.enviar("Pago confirmado");
```

<div class="takeaway">
  <strong>Cuándo usarlo</strong>
  Cuando quieres combinar responsabilidades opcionales sin crear una subclase por cada combinación.
</div>

{{% note %}}
Decorator:
- Envuelve un objeto con otro objeto que implementa la misma interfaz.
- Permite combinar funcionalidades.
- Evita explosión de subclases.
Ejemplos Java: streams de I/O como BufferedInputStream.
{{% /note %}}

---

### Decorator no es herencia disfrazada

<div class="axis">
  <div class="axis__line"></div>
  <div class="axis__labels">
    <div>
      <strong>Herencia</strong>
      <span>Decide comportamiento en la clase.</span>
    </div>
    <div>
      <strong>Decorator</strong>
      <span>Compone comportamiento en runtime.</span>
    </div>
  </div>
</div>

{{% note %}}
Herencia fija comportamiento en la jerarquía.
Decorator permite ensamblar comportamiento en runtime.
Usar ejemplo de notificación con auditoría, reintentos y logging.
{{% /note %}}

---

### Casos reales: Decorator

<div class="case-strip">
  <div class="case-tile">
    <strong>Java I/O</strong>
    <span><code>BufferedInputStream</code> envuelve otro stream y agrega buffer.</span>
  </div>
  <div class="case-tile">
    <strong>HTTP</strong>
    <span>Agregar logging, retry o autenticación alrededor de un cliente base.</span>
  </div>
  <div class="case-tile">
    <strong>Facturación</strong>
    <span>Subtotal + impuesto + descuento + redondeo como capas combinables.</span>
  </div>
</div>

{{% note %}}
Hacer visible el problema de combinaciones:
sin Decorator aparecen clases como NotificadorConRetryYAuditoriaYMetricas.
Con Decorator, las capacidades se apilan.
{{% /note %}}

---

### Adapter: traducir una interfaz ajena

```java
public class PagoPayPalAdapter implements ProcesadorPago {
    private PayPalClient client;

    public void cobrar(double monto) {
        client.makePayment(monto);
    }
}
```

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Sistema propio</span>
    <p>Espera <code>ProcesadorPago.cobrar()</code>.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Servicio externo</span>
    <p>Ofrece <code>makePayment()</code>.</p>
  </div>
</div>

{{% note %}}
Adapter:
- Convierte una interfaz existente en la interfaz que nuestro sistema espera.
- Muy común al integrar librerías externas, SDKs o APIs legacy.
- Protege al resto del sistema de detalles del proveedor.
{{% /note %}}

---

### Casos reales: Adapter

<div class="case-strip">
  <div class="case-tile">
    <strong>Pasarelas</strong>
    <span>Stripe, PayPal y banco local se exponen como <code>ProcesadorPago</code>.</span>
  </div>
  <div class="case-tile">
    <strong>Datos</strong>
    <span>Convertir XML legacy a objetos que el sistema nuevo entiende.</span>
  </div>
  <div class="case-tile">
    <strong>APIs externas</strong>
    <span>Ocultar nombres raros, formatos y errores propios del proveedor.</span>
  </div>
</div>

{{% note %}}
Adapter protege el lenguaje del dominio.
El sistema no debería quedar lleno de nombres de métodos o modelos del proveedor externo.
Si mañana cambiamos proveedor, el daño debe quedar en el adapter.
{{% /note %}}

---

### Strategy: cambiar algoritmo sin cambiar contexto

```java
public interface EstrategiaEnvio {
    double calcular(Pedido pedido);
}

public class CalculadoraEnvio {
    private EstrategiaEnvio estrategia;

    public double costo(Pedido pedido) {
        return estrategia.calcular(pedido);
    }
}
```

<div class="takeaway">
  <strong>Diferencia clave</strong>
  Strategy encapsula una decisión que cambia: envío normal, express, retiro en tienda, promoción.
</div>

{{% note %}}
Strategy:
- Define una familia de algoritmos.
- El contexto usa la interfaz.
- Cambiar algoritmo no exige cambiar el contexto.
Conectar con Comparator como strategy para ordenamiento.
{{% /note %}}

---

### Casos reales: Strategy

<div class="case-strip">
  <div class="case-tile">
    <strong>Ordenamiento</strong>
    <span><code>Comparator</code> cambia el criterio sin cambiar la lista.</span>
  </div>
  <div class="case-tile">
    <strong>Envío</strong>
    <span>Normal, express, retiro en tienda o courier externo.</span>
  </div>
  <div class="case-tile">
    <strong>Descuentos</strong>
    <span>Por cupón, por volumen, por cliente o por temporada.</span>
  </div>
</div>

{{% note %}}
Strategy reemplaza condicionales que crecen alrededor de una decisión variable.
Si cada nueva regla agrega otro if al mismo método, hay una estrategia escondida.
{{% /note %}}

---

### Observer: varios reaccionan al mismo cambio

<div class="concept-map">
  <div class="concept-node">
    <strong>Pedido confirmado</strong>
    <span>Evento de dominio.</span>
  </div>
  <div class="concept-arrow">↓</div>
  <div class="concept-node">
    <strong>Observers</strong>
    <span>Email, inventario, auditoría, métricas.</span>
  </div>
  <div class="concept-arrow">↓</div>
  <div class="concept-node">
    <strong>Desacoplamiento</strong>
    <span>Confirmar pedido no conoce todos los efectos secundarios.</span>
  </div>
</div>

{{% note %}}
Observer:
- Útil cuando varios objetos deben reaccionar a un evento.
- Reduce acoplamiento entre quien produce el evento y quienes reaccionan.
- Advertir que demasiados observers pueden hacer difícil seguir el flujo.
{{% /note %}}

---

### Casos reales: Observer

<div class="case-strip">
  <div class="case-tile">
    <strong>Swing</strong>
    <span>Un botón notifica a sus <code>ActionListener</code>.</span>
  </div>
  <div class="case-tile">
    <strong>Dominio</strong>
    <span>Pedido confirmado dispara email, inventario y auditoría.</span>
  </div>
  <div class="case-tile">
    <strong>Pub/Sub</strong>
    <span>Servicios distintos reaccionan a eventos sin conocerse directamente.</span>
  </div>
</div>

{{% note %}}
Observer no es solo UI.
En sistemas reales aparece como eventos de dominio, listeners, colas, pub/sub y callbacks.
Advertir que si todo es evento, depurar puede ser difícil.
{{% /note %}}

---

### Cómo elegir el patrón

<div class="big-word-grid">
  <div class="big-word">
    <strong>Construcción difícil</strong>
    <span>Builder o Factory.</span>
  </div>
  <div class="big-word">
    <strong>Interfaz incompatible</strong>
    <span>Adapter.</span>
  </div>
  <div class="big-word">
    <strong>Algoritmo variable</strong>
    <span>Strategy.</span>
  </div>
</div>

{{% note %}}
Usar esta slide como tabla de decisión:
- Construcción compleja: Builder.
- Creación de variantes: Factory.
- Integración incompatible: Adapter.
- Algoritmo variable: Strategy.
- Efectos múltiples ante evento: Observer.
Pregunta para guiar la discusión: qué parte del sistema está cambiando demasiado?
{{% /note %}}

---

### Caso práctico: convertidor de unidades

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Strategy</strong>
      <span>Celsius a Fahrenheit, km a millas, kg a libras.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Factory</strong>
      <span>Crea la estrategia según selección del usuario.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Observer</strong>
      <span>Actualiza historial o métricas.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Swing</strong>
      <span>La vista dispara eventos y muestra resultados.</span>
    </div>
  </div>
</div>

{{% note %}}
Caso integrador:
- Strategy para conversiones.
- Factory para seleccionar estrategia.
- Observer para historial o métricas.
- Swing dispara eventos.
Pedir que identifiquen qué cambia en la app antes de elegir patrón.
{{% /note %}}

---

### Laboratorio: esqueleto del convertidor

```java
public interface ConversionStrategy {
    double convertir(double valor);
}

public class CelsiusAFahrenheit implements ConversionStrategy {
    public double convertir(double celsius) {
        return celsius * 9 / 5 + 32;
    }
}

public class KilometrosAMillas implements ConversionStrategy {
    public double convertir(double km) {
        return km * 0.621371;
    }
}

public class ConversionFactory {
    public static ConversionStrategy crear(String tipo) {
        return switch (tipo) {
            case "temperatura" -> new CelsiusAFahrenheit();
            case "distancia" -> new KilometrosAMillas();
            default -> throw new IllegalArgumentException(tipo);
        };
    }
}
```

{{% note %}}
Usar este código como punto de partida.
Rondas sugeridas:
- Agregar otra estrategia sin cambiar la UI.
- Crear historial como observer.
- Agregar validación o redondeo con decorator.
- Conectar una librería externa con adapter.
Resultado esperado: agregar una variante debe tocar pocas clases.
{{% /note %}}

---

### Ejercicio en clase

<ol class="step-list">
  <li><div><strong>Definir contrato</strong><br><code>ConversionStrategy</code> con <code>convertir(double)</code>.</div></li>
  <li><div><strong>Crear estrategias</strong><br>Temperatura, distancia y peso.</div></li>
  <li><div><strong>Crear factory</strong><br>Seleccionar estrategia por texto o enum.</div></li>
  <li><div><strong>Conectar Swing</strong><br>El botón no calcula: delega a la estrategia.</div></li>
</ol>

{{% note %}}
Dinámica:
- Implementar primero una sola estrategia.
- Agregar segunda estrategia sin cambiar el botón.
- Luego crear factory.
- Si queda tiempo, agregar historial como observer.
{{% /note %}}

---

### Cierre

<div class="statement-slide">
  <div class="eyebrow">Para recordar</div>
  <div class="statement">Un patrón bien aplicado hace que el cambio sea local.</div>
  <p class="statement-note">Si para agregar una variante debes tocar cinco clases, el diseño está pidiendo una abstracción.</p>
</div>

{{% note %}}
Cierre:
- Evaluar un patrón por el costo de cambio que reduce.
- Si el patrón distribuye responsabilidades con claridad, sirve.
- Si solo agrega clases sin reducir acoplamiento, no era necesario.
{{% /note %}}

---

### Material de respaldo: Observer con historial

```java
public interface ConversionObserver {
    void conversionRealizada(String tipo, double entrada, double salida);
}

public class HistorialObserver implements ConversionObserver {
    private final List<String> historial = new ArrayList<>();

    public void conversionRealizada(String tipo, double entrada, double salida) {
        historial.add(tipo + ": " + entrada + " -> " + salida);
    }
}
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Casos reales: Observer" y el laboratorio del convertidor.
Usarla si el grupo termina Strategy y Factory rápido y conviene agregar historial como Observer.
{{% /note %}}

---

### Material de respaldo: Decorator de redondeo

```java
public class RedondeoDecorator implements ConversionStrategy {
    private final ConversionStrategy base;

    public RedondeoDecorator(ConversionStrategy base) {
        this.base = base;
    }

    public double convertir(double valor) {
        double resultado = base.convertir(valor);
        return Math.round(resultado * 100.0) / 100.0;
    }
}
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Decorator: agregar comportamiento por capas".
Usarla si se quiere extender el convertidor con comportamiento opcional sin modificar estrategias existentes.
{{% /note %}}
