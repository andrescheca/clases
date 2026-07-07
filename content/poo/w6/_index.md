+++
title = "Programación Orientada a Objetos - Semana 6"
subtitle = "Excepciones y fundamentos de patrones"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 6</div>
  <h1 class="deck-cover__title">Los errores también son parte del diseño.</h1>
  <p class="deck-cover__subtitle">Una excepción bien usada comunica una condición excepcional. Un patrón bien usado comunica una solución de diseño que otros desarrolladores reconocen.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Excepciones</span>
    <span class="deck-cover__chip">Factory</span>
    <span class="deck-cover__chip">Observer</span>
  </div>
</div>

{{% note %}}
Objetivos:
- Entender la jerarquía de excepciones.
- Distinguir checked y unchecked.
- Crear excepciones del dominio.
- Introducir patrones como vocabulario de diseño.
- Usar Factory y Observer como ejemplos iniciales.
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Excepciones</strong>
      <span>Checked, unchecked y personalizadas.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Diseño de error</strong>
      <span>Cuándo lanzar, capturar o propagar.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Patrones</strong>
      <span>Soluciones recurrentes con nombre.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Aplicación</strong>
      <span>Factory y Observer en ejemplos pequeños.</span>
    </div>
  </div>
</div>

{{% note %}}
Conectar errores y patrones:
ambos son decisiones de diseño.
Una excepción define cómo comunicamos fallas.
Un patrón define cómo comunicamos una solución reconocible.

El riesgo de esta semana es explicar demasiada teoría.
Usar transferencias bancarias como hilo conductor: errores reales, creación de notificadores y auditoría de movimientos.
{{% /note %}}

---

### Jerarquía mínima de excepciones

<div class="visual-split">
  <div class="visual-copy">
    <div class="eyebrow">Java</div>
    <h2>No todas las fallas significan lo mismo.</h2>
    <p class="lead">La jerarquía separa errores graves, condiciones recuperables y errores de programación.</p>
  </div>
  <div class="visual-panel">
    <div class="concept-map">
      <div class="concept-node">
        <strong>Throwable</strong>
        <span>Raíz de todo lo que se puede lanzar.</span>
      </div>
      <div class="concept-arrow">↓</div>
      <div class="concept-node">
        <strong>Error</strong>
        <span>Problemas del entorno. Normalmente no se manejan.</span>
      </div>
      <div class="concept-arrow">↓</div>
      <div class="concept-node">
        <strong>Exception</strong>
        <span>Condiciones que el programa puede decidir manejar.</span>
      </div>
    </div>
  </div>
</div>

{{% note %}}
Puntos clave:
- Throwable es la raíz.
- Error representa fallas graves del entorno que normalmente no manejamos.
- Exception representa condiciones que el programa puede manejar.
- RuntimeException suele indicar errores de programación o validaciones fallidas.
{{% /note %}}

---

### Checked vs unchecked

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Checked</span>
    <p>El compilador obliga a manejar o declarar.</p>
    <p>Ejemplos: archivos, red, base de datos.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Unchecked</span>
    <p>Heredan de <code>RuntimeException</code>.</p>
    <p>Ejemplos: argumentos inválidos, nulos, índices incorrectos.</p>
  </div>
</div>

```java
public String leer(Path path) throws IOException {
    return Files.readString(path);
}
```

{{% note %}}
Checked:
- El compilador obliga a manejar o declarar.
- Se usa para condiciones externas: archivos, red, base de datos.
Unchecked:
- No obliga a try-catch.
- Suele representar error de programación o argumento inválido.
{{% /note %}}

---

### Capturar donde puedes decidir algo

```java
try {
    String contenido = servicio.leerArchivo(path);
    vista.mostrar(contenido);
} catch (IOException ex) {
    vista.mostrarError("No se pudo leer el archivo");
}
```

<div class="takeaway">
  <strong>Regla</strong>
  No captures una excepción si solo vas a esconderla. Captúrala donde puedas recuperar, informar o transformar el error.
</div>

{{% note %}}
Antipatrones:
- catch vacío.
- imprimir stack trace y seguir como si nada.
- capturar Exception genérico sin necesidad.
Una buena captura hace algo concreto: recupera, informa, registra o convierte.
{{% /note %}}

---

### Excepción personalizada

```java
public class FondosInsuficientesException extends Exception {
    public FondosInsuficientesException(double saldo, double monto) {
        super("Saldo " + saldo + " no cubre retiro " + monto);
    }
}

public void retirar(double monto) throws FondosInsuficientesException {
    if (monto > saldo) {
        throw new FondosInsuficientesException(saldo, monto);
    }
    saldo -= monto;
}
```

<div class="takeaway">
  <strong>Cuándo vale la pena</strong>
  Cuando el error pertenece al dominio y quien llama puede tomar una decisión distinta.
</div>

{{% note %}}
Explicar por qué no usar siempre Exception:
FondosInsuficientesException comunica una regla del negocio.
Eso permite que la capa de UI muestre un mensaje específico o que una transacción se cancele limpiamente.
{{% /note %}}

---

### Anti-patrones de excepciones

<div class="big-word-grid">
  <div class="big-word">
    <strong>catch vacío</strong>
    <span>El error desaparece y el sistema queda en estado incierto.</span>
  </div>
  <div class="big-word">
    <strong>throws Exception</strong>
    <span>Oculta el contrato real del método.</span>
  </div>
  <div class="big-word">
    <strong>Control normal</strong>
    <span>Usar excepciones para flujo esperado vuelve caro el código.</span>
  </div>
</div>

{{% note %}}
Usar esta diapositiva para discusión:
- Qué pasa si escondo el error?
- Qué contrato pierde un método con throws Exception?
- Por qué no conviene usar excepciones para un caso esperado como "usuario no encontró resultados"?
{{% /note %}}

---

### Qué es un patrón de diseño

<div class="statement-slide">
  <div class="eyebrow">Diseño reutilizable</div>
  <div class="statement">Un patrón es vocabulario compartido para una solución recurrente.</div>
  <p class="statement-note">No se aplica para sonar avanzado. Se aplica cuando reduce acoplamiento, duplicación o decisiones repetidas.</p>
</div>

{{% note %}}
Enfatizar:
Los patrones no son código copiado.
Son nombres compartidos para resolver problemas recurrentes.
Si el problema no existe, el patrón solo agrega complejidad.
{{% /note %}}

---

### Categorías de patrones

<div class="big-word-grid">
  <div class="big-word">
    <strong>Creacionales</strong>
    <span>Cómo crear objetos sin acoplarse a clases concretas.</span>
  </div>
  <div class="big-word">
    <strong>Estructurales</strong>
    <span>Cómo componer objetos y adaptar interfaces.</span>
  </div>
  <div class="big-word">
    <strong>Comportamiento</strong>
    <span>Cómo distribuir responsabilidades y comunicación.</span>
  </div>
</div>

{{% note %}}
Categorías:
- Creacionales: encapsulan creación.
- Estructurales: componen o adaptan objetos.
- Comportamiento: distribuyen responsabilidades entre objetos.
No memorizar listas; asociar cada categoría con un tipo de problema.
{{% /note %}}

---

### Caso aplicado: transferencia bancaria

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Excepción</strong>
      <span>Fondos insuficientes no es un <code>if</code> perdido.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Factory</strong>
      <span>Elegir email, SMS o push sin acoplar el dominio.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Observer</strong>
      <span>Auditoría, métricas y notificaciones reaccionan al evento.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Diseño</strong>
      <span>Transferir no debería saber todo lo que ocurre después.</span>
    </div>
  </div>
</div>

{{% note %}}
Usar este caso como hilo conductor para los patrones:
- La excepción comunica una falla del dominio.
- Factory evita repetir decisiones de creación.
- Observer separa la transferencia de sus efectos secundarios.
{{% /note %}}

---

### Simple Factory

```java
public class NotificadorFactory {
    public static Notificador crear(String canal) {
        return switch (canal) {
            case "email" -> new EmailNotificador();
            case "sms" -> new SmsNotificador();
            default -> throw new IllegalArgumentException("Canal inválido");
        };
    }
}
```

<div class="takeaway">
  <strong>Uso</strong>
  Centraliza una decisión de creación. El resto del sistema trabaja contra la interfaz <code>Notificador</code>.
</div>

{{% note %}}
Simple Factory no siempre aparece como patrón GoF formal, pero es muy útil para iniciar.
Sirve cuando hay una decisión de creación repetida.
Advertir que si crece demasiado puede evolucionar a Factory Method o configuración externa.
{{% /note %}}

---

### Factory aplicada al caso real

```java
Notificador notificador = NotificadorFactory.crear(preferenciaCliente);
notificador.enviar("Transferencia aprobada");
```

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Sin Factory</span>
    <p>El servicio de transferencia decide entre <code>Email</code>, <code>SMS</code> y <code>Push</code>.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Con Factory</span>
    <p>El servicio pide un <code>Notificador</code>. La creación queda aislada.</p>
  </div>
</div>

{{% note %}}
Pregunta para la clase:
si mañana agregamos WhatsApp, qué clase debería cambiar?
Si cambia TransferenciaService, el diseño está demasiado acoplado.
{{% /note %}}

---

### Factory Method: cuando la subclase decide

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Simple Factory</span>
    <p>Una clase central decide qué implementación crear.</p>
    <p>Útil para empezar, pero puede crecer como un <code>switch</code> gigante.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Factory Method</span>
    <p>La clase base define el flujo y delega la creación a subclases.</p>
    <p>Útil cuando cada variante necesita su propia configuración.</p>
  </div>
</div>

```java
abstract class NotificadorCreator {
    public void enviar(String mensaje) {
        crearNotificador().enviar(mensaje);
    }

    protected abstract Notificador crearNotificador();
}
```

{{% note %}}
Este tema estaba más desarrollado en la versión anterior.
Aquí se recupera la diferencia conceptual sin ocupar muchas slides.
La pregunta clave: la decisión de creación está centralizada o cada variante debe construir a su manera?
{{% /note %}}

---

### Observer en una frase

<div class="concept-map">
  <div class="concept-node">
    <strong>Subject</strong>
    <span>El objeto que cambia de estado.</span>
  </div>
  <div class="concept-arrow">↓ notifica</div>
  <div class="concept-node">
    <strong>Observers</strong>
    <span>Objetos interesados en reaccionar al cambio.</span>
  </div>
  <div class="concept-arrow">↓ desacopla</div>
  <div class="concept-node">
    <strong>Resultado</strong>
    <span>El subject no necesita saber qué hace cada observer.</span>
  </div>
</div>

{{% note %}}
Observer:
- Un subject mantiene una lista de observadores.
- Cuando cambia, notifica.
- El subject no conoce qué hará cada observer.
Conectar con eventos de Swing: botón y listeners son una forma de observación.
{{% /note %}}

---

### Observer aplicado al caso real

```java
transferencia.registrar(new AuditoriaListener());
transferencia.registrar(new NotificacionListener());
transferencia.registrar(new MetricasListener());

transferencia.ejecutar(origen, destino, monto);
```

<div class="takeaway">
  <strong>Diseño</strong>
  La transferencia emite un evento. Los listeners deciden qué hacer sin ensuciar la regla principal.
</div>

{{% note %}}
Contrastar dos diseños:
- Malo: transferir también guarda auditoría, envía email, actualiza dashboard y escribe logs.
- Mejor: transferir cambia saldos y emite un evento de dominio.
Luego cada observer reacciona.
{{% /note %}}

---

### Ejercicio: transferencias bancarias

<ol class="step-list">
  <li><div><strong>Dominio</strong><br>Crear <code>Cuenta</code> con retiro, depósito y transferencia.</div></li>
  <li><div><strong>Excepción</strong><br>Lanzar <code>FondosInsuficientesException</code> cuando corresponda.</div></li>
  <li><div><strong>Factory</strong><br>Crear notificadores de operación por canal.</div></li>
  <li><div><strong>Observer</strong><br>Registrar listeners para auditar movimientos.</div></li>
</ol>

{{% note %}}
Dinámica:
- Empezar con Cuenta y transferir.
- Agregar excepción específica.
- Luego agregar NotificadorFactory.
- Finalmente registrar observadores para auditoría.
El objetivo es mostrar cómo errores y patrones aparecen juntos en un caso real.
{{% /note %}}

---

### Cierre

<div class="statement-slide">
  <div class="eyebrow">Para recordar</div>
  <div class="statement">Una excepción explica una falla. Un patrón explica una decisión.</div>
  <p class="statement-note">Ambos son comunicación entre desarrolladores, no solo mecanismos del lenguaje.</p>
</div>

{{% note %}}
Cierre:
- Las excepciones deben contar qué salió mal y quién puede decidir.
- Los patrones deben reducir cambios dispersos.
- Preparar semana 7: veremos más patrones, pero siempre partiendo del problema.
{{% /note %}}

---

### Material de respaldo: catálogo mínimo de patrones

<div class="big-word-grid">
  <div class="big-word">
    <strong>Creacionales</strong>
    <span>Singleton, Factory Method, Abstract Factory, Builder.</span>
  </div>
  <div class="big-word">
    <strong>Estructurales</strong>
    <span>Adapter, Decorator, Facade, Proxy.</span>
  </div>
  <div class="big-word">
    <strong>Comportamiento</strong>
    <span>Observer, Strategy, Command, State, Iterator.</span>
  </div>
</div>

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Categorías de patrones" y el caso de transferencia bancaria.
Usarla si el grupo necesita ubicar más nombres de patrones antes de profundizar en semana 7.
{{% /note %}}

---

### Solución sugerida: excepción del dominio

```java
public class FondosInsuficientesException extends Exception {
    public FondosInsuficientesException(double saldo, double monto) {
        super("Saldo " + saldo + " no cubre retiro " + monto);
    }
}
```

<div class="takeaway">
  <strong>Decisión</strong>
  Fondos insuficientes es una falla del dominio, no un error genérico del sistema.
</div>

{{% note %}}
Mostrar solo después del intento de los estudiantes.
La excepción vale la pena porque quien llama puede tomar una decisión específica: cancelar, informar o pedir otro monto.
{{% /note %}}

---

### Solución sugerida: Cuenta

```java
public class Cuenta {
    private final String numero;
    private double saldo;

    public Cuenta(String numero, double saldoInicial) {
        this.numero = numero;
        this.saldo = saldoInicial;
    }

    public void depositar(double monto) {
        validarMonto(monto);
        saldo += monto;
    }

    public void retirar(double monto) throws FondosInsuficientesException {
        validarMonto(monto);
        if (monto > saldo) {
            throw new FondosInsuficientesException(saldo, monto);
        }
        saldo -= monto;
    }

    private void validarMonto(double monto) {
        if (monto <= 0) {
            throw new IllegalArgumentException("Monto inválido");
        }
    }

    public String numero() {
        return numero;
    }
}
```

{{% note %}}
La idea clave no es copiar la clase, sino notar dónde viven las reglas:
- El saldo no tiene setter.
- La cuenta protege montos inválidos.
- Fondos insuficientes es una excepción del dominio.
{{% /note %}}

---

### Solución sugerida: Factory

```java
public interface Notificador {
    void enviar(String mensaje);
}

public class EmailNotificador implements Notificador {
    public void enviar(String mensaje) {
        System.out.println("Email: " + mensaje);
    }
}

public class SmsNotificador implements Notificador {
    public void enviar(String mensaje) {
        System.out.println("SMS: " + mensaje);
    }
}

public class NotificadorFactory {
    public static Notificador crear(String canal) {
        return switch (canal) {
            case "email" -> new EmailNotificador();
            case "sms" -> new SmsNotificador();
            default -> throw new IllegalArgumentException("Canal inválido");
        };
    }
}
```

{{% note %}}
Preguntar:
Si mañana agregamos push o WhatsApp, qué parte cambia?
La respuesta esperada es: se agrega una implementación y se ajusta la creación, pero el servicio no debería llenarse de ifs de canales.
{{% /note %}}

---

### Solución sugerida: Observer

```java
public record TransferenciaRealizada(
    String origen,
    String destino,
    double monto
) {}

public interface TransferenciaListener {
    void alTransferir(TransferenciaRealizada evento);
}

public class AuditoriaListener implements TransferenciaListener {
    public void alTransferir(TransferenciaRealizada evento) {
        System.out.println("Auditoría: " + evento);
    }
}
```

<div class="takeaway">
  <strong>Idea</strong>
  La transferencia produce un evento. Los listeners deciden cómo reaccionar.
</div>

{{% note %}}
Esta slide separa el contrato del listener del servicio.
Marcar que Observer no significa "muchas clases por obligación"; significa que el emisor no queda acoplado a todas las reacciones.
{{% /note %}}

---

### Solución sugerida: servicio integrado

```java
import java.util.ArrayList;
import java.util.List;

public class TransferenciaService {
    private final List<TransferenciaListener> listeners = new ArrayList<>();

    public void registrar(TransferenciaListener listener) {
        listeners.add(listener);
    }

    public void transferir(Cuenta origen, Cuenta destino, double monto)
            throws FondosInsuficientesException {
        origen.retirar(monto);
        destino.depositar(monto);

        var evento = new TransferenciaRealizada(
            origen.numero(),
            destino.numero(),
            monto
        );

        listeners.forEach(listener -> listener.alTransferir(evento));
    }
}
```

{{% note %}}
Antes de mostrar esta slide, pedir que identifiquen el orden:
1. Validar y ejecutar regla del dominio.
2. Crear evento de dominio.
3. Notificar efectos secundarios.
Conectar con la clase Cuenta: numero() expone un dato estable para auditoría, pero el saldo sigue protegido por operaciones del dominio.
{{% /note %}}

---

### Solución sugerida: uso

```java
var origen = new Cuenta("001", 100);
var destino = new Cuenta("002", 20);

var notificador = NotificadorFactory.crear("email");

var servicio = new TransferenciaService();
servicio.registrar(new AuditoriaListener());
servicio.registrar(evento ->
    notificador.enviar("Transferencia realizada: " + evento.monto())
);

servicio.transferir(origen, destino, 40);
```

<div class="takeaway">
  <strong>Lectura de diseño</strong>
  La cuenta protege reglas, la Factory crea variantes y Observer desacopla efectos secundarios.
</div>

{{% note %}}
Cerrar conectando con el objetivo de la semana:
excepciones y patrones son comunicación de diseño.
La solución no es valiosa por tener muchos patrones; es valiosa porque cada pieza tiene una razón clara para cambiar.
{{% /note %}}
