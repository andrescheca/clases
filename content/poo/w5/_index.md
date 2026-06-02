+++
title = "Programación Orientada a Objetos - Semana 5"
subtitle = "Delegate, Swing y eventos"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Semana 5</div>
  <h1 class="deck-cover__title">Una interfaz gráfica es objetos hablando por eventos.</h1>
  <p class="deck-cover__subtitle">Delegate, Comparator y Swing muestran la misma idea: separar quién recibe una acción, quién decide qué hacer y quién actualiza el estado.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Delegate</span>
    <span class="deck-cover__chip">Swing</span>
    <span class="deck-cover__chip">Eventos</span>
  </div>
</div>

{{% note %}}
Objetivos:
- Comprender Delegate como separación de responsabilidades.
- Ver Comparator como ejemplo concreto de delegate.
- Introducir Swing como árbol de componentes.
- Conectar eventos con listeners.
- Terminar con una aplicación pequeña empaquetable.
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Delegate</strong>
      <span>Pasar una decisión a otro objeto.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Comparator</strong>
      <span>Ordenar sin modificar la clase original.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Swing</strong>
      <span>Ventanas, paneles, componentes y layouts.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Eventos</strong>
      <span>Botones que disparan comportamiento.</span>
    </div>
  </div>
</div>

{{% note %}}
Presentar la semana como transición:
venimos de interfaces y polimorfismo; ahora esos conceptos aparecen en GUI y eventos.
Delegate no es un patrón aislado: aparece en ordenamiento, listeners y callbacks.
La versión anterior tenía una calculadora completa antes del conversor.
Aquí queda como laboratorio guiado para que el conversor sea trabajo más independiente.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Patrón mental</div>
  <div class="statement">Delegar es decir: yo coordino, otro decide.</div>
  <p class="statement-note">La clase principal conserva el flujo, pero no se llena con cada variante posible del comportamiento.</p>
</div>

{{% note %}}
Explicar con una analogía:
un coordinador no hace todas las tareas; delega tareas específicas a personas especializadas.
En código, delegar permite cambiar comportamiento sin tocar el coordinador.
{{% /note %}}

---

### Delegate en código

```java
public interface ReglaDescuento {
    double aplicar(double total);
}

public class Carrito {
    private ReglaDescuento descuento;

    public Carrito(ReglaDescuento descuento) {
        this.descuento = descuento;
    }

    public double totalConDescuento(double total) {
        return descuento.aplicar(total);
    }
}
```

<div class="takeaway">
  <strong>Ventaja</strong>
  Cambiar la regla no requiere tocar <code>Carrito</code>. Solo cambiamos el delegado.
</div>

{{% note %}}
Puntos del patrón Delegate:
- Desacopla comportamiento de la clase que lo usa.
- Permite variar comportamiento en tiempo de ejecución.
- Facilita pruebas unitarias, porque se puede pasar un delegado falso.
- Evita crear subclases solo para cambiar una regla.
{{% /note %}}

---

### Comparator es un delegate de orden

```java
List<Producto> productos = cargarProductos();

productos.sort(
    Comparator.comparing(Producto::getPrecio)
);

productos.sort(
    Comparator.comparing(Producto::getNombre)
);
```

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Objeto</span>
    <p><code>Producto</code> conserva sus datos y reglas.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Delegate</span>
    <p><code>Comparator</code> decide el criterio de orden.</p>
  </div>
</div>

{{% note %}}
Comparator es un ejemplo perfecto:
- Define una única responsabilidad: comparar.
- Permite múltiples criterios para la misma clase.
- Puede escribirse como clase, clase anónima o lambda.
- No obliga a modificar Producto.
{{% /note %}}

---

### Swing: jerarquía mínima

```text
JFrame
└── JPanel
    ├── JLabel
    ├── JTextField
    └── JButton
```

<div class="takeaway">
  <strong>Lectura</strong>
  Una interfaz Swing es un árbol de componentes. Los contenedores organizan; los componentes muestran o capturan información.
</div>

{{% note %}}
Explicar la jerarquía:
- Component es la base.
- Container puede contener otros componentes.
- JComponent es la base de muchos controles Swing.
- JFrame representa la ventana principal.
{{% /note %}}

---

### Qué responsabilidad tiene cada pieza

<div class="big-word-grid">
  <div class="big-word">
    <strong>JFrame</strong>
    <span>La ventana principal de la aplicación.</span>
  </div>
  <div class="big-word">
    <strong>JPanel</strong>
    <span>Agrupa componentes y define zonas.</span>
  </div>
  <div class="big-word">
    <strong>Layout</strong>
    <span>Decide cómo se acomodan los componentes.</span>
  </div>
</div>

{{% note %}}
Reforzar que GUI también es diseño OO:
- JFrame no debería contener toda la lógica.
- JPanel ayuda a separar zonas.
- Layout evita posicionamiento manual frágil.
{{% /note %}}

---

### Layouts: elegir estructura antes de mover pixeles

<div class="case-strip">
  <div class="case-tile">
    <strong>BorderLayout</strong>
    <span>Norte, sur, este, oeste y centro.</span>
  </div>
  <div class="case-tile">
    <strong>GridLayout</strong>
    <span>Celdas uniformes.</span>
  </div>
  <div class="case-tile">
    <strong>FlowLayout</strong>
    <span>Componentes en fila.</span>
  </div>
  <div class="case-tile">
    <strong>BoxLayout</strong>
    <span>Vertical u horizontal con control.</span>
  </div>
</div>

{{% note %}}
Comparar layouts:
- BorderLayout para estructuras generales.
- GridLayout para formularios o botones uniformes.
- FlowLayout para controles simples en fila.
- BoxLayout cuando necesitamos apilar vertical u horizontalmente.
No usar null layout en clase salvo para mostrar por qué es mala idea.
{{% /note %}}

---

### Eventos: del click al método

<div class="concept-map">
  <div class="concept-node">
    <strong>Usuario</strong>
    <span>Hace click en un botón.</span>
  </div>
  <div class="concept-arrow">↓</div>
  <div class="concept-node">
    <strong>Evento</strong>
    <span>Swing dispara un <code>ActionEvent</code>.</span>
  </div>
  <div class="concept-arrow">↓</div>
  <div class="concept-node">
    <strong>Listener</strong>
    <span>El delegado ejecuta la acción.</span>
  </div>
</div>

{{% note %}}
Flujo de eventos:
1. Usuario interactúa.
2. Swing crea un evento.
3. Listener recibe el evento.
4. Listener coordina la acción.
Conectar con Delegate: el listener es el objeto delegado para responder.
{{% /note %}}

---

### Listener pequeño, intención clara

```java
JButton calcular = new JButton("Calcular");
JTextField entrada = new JTextField(10);
JLabel resultado = new JLabel("Resultado");

calcular.addActionListener(event -> {
    double celsius = Double.parseDouble(entrada.getText());
    double fahrenheit = celsius * 9 / 5 + 32;
    resultado.setText(fahrenheit + " °F");
});
```

<div class="takeaway">
  <strong>Precaución</strong>
  El listener debe coordinar. Si crece demasiado, extraemos lógica a otra clase.
</div>

{{% note %}}
Señalar el riesgo:
al principio es tentador poner validación, cálculo, formato y persistencia dentro del listener.
Eso funciona en ejemplos pequeños, pero escala mal.
Extraer TemperatureConverter como servicio.
{{% /note %}}

---

### Arquitectura mínima para una app Swing

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Vista</strong>
      <span>Componentes Swing y eventos.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Servicio</strong>
      <span>Reglas de negocio o cálculo.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Modelo</strong>
      <span>Datos del dominio.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Resultado</strong>
      <span>La vista muestra el cambio.</span>
    </div>
  </div>
</div>

{{% note %}}
Modelo mental:
- Vista: solo interfaz y eventos.
- Servicio: reglas o cálculo.
- Modelo: datos.
Esta separación permite probar lógica sin abrir una ventana.
{{% /note %}}

---

### Empaquetar en JAR

```bash
javac -d out src/*.java
jar cfe app.jar Main -C out .
java -jar app.jar
```

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Compilar</span>
    <p>Convierte <code>.java</code> en <code>.class</code>.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Empaquetar</span>
    <p>Une clases y punto de entrada en un artefacto ejecutable.</p>
  </div>
</div>

{{% note %}}
Explicar comandos:
- javac compila .java a .class.
- jar agrupa clases y define clase principal.
- java -jar ejecuta el artefacto.
Si usan IDE, mostrar que el IDE automatiza esto, no que desaparece.
{{% /note %}}

---

### Laboratorio: calculadora simple

<div class="comparison-grid">
  <div class="panel">
    <span class="panel-title">Vista</span>
    <p><code>JTextField</code> para dos números, <code>JComboBox</code> para operación y <code>JLabel</code> para resultado.</p>
  </div>
  <div class="panel">
    <span class="panel-title">Modelo de cálculo</span>
    <p><code>Operacion</code> como interfaz o enum. La UI no debería conocer la fórmula completa.</p>
  </div>
</div>

<ol class="step-list">
  <li><div><strong>Primero</strong><br>Armar ventana y layout sin lógica.</div></li>
  <li><div><strong>Después</strong><br>Implementar suma y resta fuera del listener.</div></li>
  <li><div><strong>Luego</strong><br>Agregar multiplicación, división y validación de entrada.</div></li>
</ol>

{{% note %}}
Este bloque recupera la primera aplicación de la versión anterior.
Usarlo para modelar el flujo completo antes de pedir el conversor.
Insistir: el listener coordina, no concentra toda la lógica.
{{% /note %}}

---

### Ejercicio: conversor de temperatura

<ol class="step-list">
  <li><div><strong>Vista</strong><br><code>JFrame</code>, <code>JTextField</code>, <code>JButton</code> y <code>JLabel</code>.</div></li>
  <li><div><strong>Regla</strong><br>Crear <code>TemperatureConverter</code> con métodos puros.</div></li>
  <li><div><strong>Evento</strong><br>El botón lee entrada, llama al servicio y actualiza salida.</div></li>
  <li><div><strong>Validación</strong><br>Si el texto no es número, mostrar mensaje claro.</div></li>
</ol>

{{% note %}}
Dinámica sugerida:
- Primero dibujar la ventana.
- Luego crear el servicio de conversión sin Swing.
- Después conectar botón y servicio.
- Finalmente manejar NumberFormatException con un mensaje para usuario.
{{% /note %}}

---

### Cierre

<div class="statement-slide">
  <div class="eyebrow">Para recordar</div>
  <div class="statement">El click no debería contener toda la aplicación.</div>
  <p class="statement-note">Un buen listener conecta interfaz y lógica. No reemplaza al diseño de objetos.</p>
</div>

{{% note %}}
Cierre:
- Swing permite practicar POO de forma visible.
- Los eventos enseñan delegación.
- El objetivo no es memorizar componentes, sino separar responsabilidades en una app interactiva.
{{% /note %}}

---

### Material de respaldo: calculadora Swing mínima

```java
JTextField a = new JTextField(6);
JTextField b = new JTextField(6);
JButton sumar = new JButton("Sumar");
JLabel resultado = new JLabel("Resultado");

sumar.addActionListener(event -> {
    double x = Double.parseDouble(a.getText());
    double y = Double.parseDouble(b.getText());
    resultado.setText(String.valueOf(x + y));
});

JPanel panel = new JPanel();
panel.add(a);
panel.add(b);
panel.add(sumar);
panel.add(resultado);
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Laboratorio: calculadora simple".
Usarla si el grupo necesita un punto de partida con código visible para construir la ventana.
{{% /note %}}

---

### Material de respaldo: JAR ejecutable

```bash
javac -d out src/Main.java src/*.java
jar cfe calculadora.jar Main -C out .
java -jar calculadora.jar
```

<div class="takeaway">
  <strong>Lectura</strong>
  El IDE puede hacerlo por nosotros, pero el artefacto final sigue siendo clases empaquetadas con una clase principal.
</div>

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por "Empaquetar en JAR".
Usarla si se necesita explicar manualmente compilación, manifest y ejecución fuera del IDE.
{{% /note %}}
