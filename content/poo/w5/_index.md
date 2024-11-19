+++
title = "Programación Orientada a Objetos - Semana 5"
subtitle = "Patrón Delegate, Swing y Aplicaciones Gráficas"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 5: Patrón Delegate y Aplicaciones Gráficas con Swing

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Comprender el patrón Delegate {{% /fragment %}}
{{% fragment class="bullet-point" %}} Aplicar Comparator como ejemplo de Delegate {{% /fragment %}}
{{% fragment class="bullet-point" %}} Introducción a la programación gráfica con Swing {{% /fragment %}}
{{% fragment class="bullet-point" %}} Crear nuestra primera aplicación gráfica {{% /fragment %}}
{{% fragment class="bullet-point" %}} Empaquetar la aplicación en un JAR {{% /fragment %}}


---

{{% section %}}

### Patrón Delegate

```java
// Interfaz del delegado
public interface OrderDelegate {
    int compare(String a, String b);
}

// Implementación específica
public class AlphabeticalOrderDelegate implements OrderDelegate {
    @Override
    public int compare(String a, String b) {
        return a.compareTo(b);
    }
}

// Clase que utiliza el delegado
public class StringSorter {
    private OrderDelegate delegate;
    
    public void setDelegate(OrderDelegate delegate) {
        this.delegate = delegate;
    }
    
    public void sortStrings(List<String> strings) {
        Collections.sort(strings, (a, b) -> delegate.compare(a, b));
    }
}
```

{{% note %}}
El patrón Delegate:
- Permite delegar comportamiento a otra clase
- Favorece composición sobre herencia
- Proporciona flexibilidad en tiempo de ejecución
- Es la base de muchos patrones de diseño
- Se usa extensivamente en frameworks de GUI
{{% /note %}}

---

#### ¿Por qué usar Delegate?

- Separa responsabilidades
- Flexibilidad en tiempo de ejecución
- Evita herencia innecesaria
- Facilita pruebas unitarias

{{% note %}}
Ventajas del patrón Delegate:
- Desacopla el comportamiento de la implementación
- Permite cambiar comportamiento sin modificar código
- Facilita la implementación de nuevos comportamientos
- Hace el código más mantenible y testeable
{{% /note %}}

---

#### Comparator como Delegate

```java
public class ProductComparator implements Comparator<Product> {
    @Override
    public int compare(Product p1, Product p2) {
        return Double.compare(p1.getPrice(), p2.getPrice());
    }
}

List<Product> products = new ArrayList<>();
products.sort(new ProductComparator());
// O usando lambda
products.sort((p1, p2) -> Double.compare(p1.getPrice(), p2.getPrice()));
```

{{% note %}}
Comparator es un ejemplo perfecto de Delegate:
- Define una única responsabilidad (comparación)
- Permite múltiples implementaciones
- Se puede cambiar en tiempo de ejecución
- Es compatible con expresiones lambda
- No requiere modificar las clases que se comparan
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Jerarquía de Componentes Swing

```
Component (abstract)
├── Container
│   ├── JComponent
│   │   ├── JPanel
│   │   ├── JLabel
│   │   ├── JButton
│   │   ├── JTextField
│   │   └── JTextArea
│   ├── JFrame
│   └── JDialog
└── Window
    └── Frame
```

{{% note %}}
La jerarquía de Swing está diseñada siguiendo principios OOP:
- Component es la clase base abstracta
- Container puede contener otros componentes
- JComponent es la base para la mayoría de los widgets
- Cada nivel agrega funcionalidad específica
- La herencia permite compartir comportamiento común
{{% /note %}}

---

### Introducción a Swing

```java
import javax.swing.*;

public class FirstWindow extends JFrame {
    public FirstWindow() {
        setTitle("Mi Primera Ventana");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new FirstWindow().setVisible(true);
        });
    }
}
```

{{% note %}}
Conceptos fundamentales de Swing:
- Todos los componentes heredan de JComponent
- JFrame es la ventana principal
- SwingUtilities.invokeLater garantiza thread safety
- Los componentes se organizan en una jerarquía padre-hijo
- Cada contenedor puede tener un LayoutManager
{{% /note %}}

---

#### Componentes Principales

- **Contenedores**
  - JFrame: Ventana principal
  - JPanel: Panel contenedor
  - JDialog: Ventana secundaria
- **Controles**
  - JButton: Botón clickeable
  - JTextField: Campo de texto
  - JLabel: Etiqueta de texto
- **Menús**
  - JMenuBar: Barra de menú
  - JMenu: Menú desplegable
  - JMenuItem: Elemento de menú

{{% note %}}
Características de los componentes:
- Contenedores:
  * JFrame es la ventana principal de la aplicación
  * JPanel es un contenedor ligero para organizar componentes
  * JDialog es para ventanas modales o no modales
- Controles:
  * JButton maneja eventos de click
  * JTextField permite entrada de una línea
  * JLabel muestra texto no editable
- Menús:
  * JMenuBar contiene JMenus
  * JMenu contiene JMenuItems
  * JMenuItem representa una acción específica
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Layouts en Swing

```java
// BorderLayout
JPanel panel = new JPanel(new BorderLayout());
panel.add(new JButton("Norte"), BorderLayout.NORTH);
panel.add(new JButton("Sur"), BorderLayout.SOUTH);

// FlowLayout
JPanel buttonPanel = new JPanel(new FlowLayout());
buttonPanel.add(new JButton("1"));
buttonPanel.add(new JButton("2"));

// GridLayout
JPanel grid = new JPanel(new GridLayout(2, 2));
grid.add(new JButton("1,1"));
grid.add(new JButton("1,2"));
```

{{% note %}}
Características de los layouts:
- BorderLayout:
  * Divide el espacio en 5 áreas: NORTH, SOUTH, EAST, WEST, CENTER
  * Cada área puede contener un solo componente
  * El componente CENTER se expande para llenar el espacio disponible

- FlowLayout:
  * Coloca componentes en una fila
  * Cuando no hay espacio, continúa en la siguiente línea
  * Respeta el tamaño preferido de los componentes

- GridLayout:
  * Divide el espacio en una cuadrícula
  * Todos los componentes tienen el mismo tamaño
  * Se expanden para llenar su celda

- GridBagLayout:
  * El más flexible pero complejo
  * Permite control preciso del tamaño y posición
  * Componentes pueden ocupar múltiples celdas

- BoxLayout:
  * Organiza componentes en una sola fila o columna
  * Respeta el tamaño preferido de los componentes
  * Útil para barras de herramientas

- CardLayout:
  * Muestra un componente a la vez
  * Útil para wizards o interfaces tipo pestañas
  * Permite cambiar entre componentes programáticamente
{{% /note %}}

---

#### Layouts Disponibles

- BorderLayout
- FlowLayout
- GridLayout
- GridBagLayout
- BoxLayout
- CardLayout

{{% note %}}
Cuándo usar cada layout:
- BorderLayout: Para la organización general de la ventana
- FlowLayout: Para grupos de botones o controles similares
- GridLayout: Para calculadoras o teclados numéricos
- GridBagLayout: Para interfaces complejas con alineación precisa
- BoxLayout: Para barras de herramientas o paneles de opciones
- CardLayout: Para interfaces tipo wizard o pestañas
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Eventos en Swing

```java
JButton button = new JButton("Click Me");
button.addActionListener(e -> {
    System.out.println("¡Botón presionado!");
});

// Clase separada para el listener
class ButtonHandler implements ActionListener {
    @Override
    public void actionPerformed(ActionEvent e) {
        System.out.println("¡Botón presionado!");
    }
}
```

{{% note %}}
Sistema de eventos en Swing:
- Basado en el patrón Observer
- Los componentes son observables (fuentes de eventos)
- Los listeners son observadores
- Puede usar clases anónimas o lambdas
- Cada tipo de evento tiene su propia interfaz listener
- Los eventos se procesan en el Event Dispatch Thread
{{% /note %}}

---

#### Tipos de Eventos

- ActionEvent: Para acciones simples como clicks
- MouseEvent: Para interacciones del mouse
- KeyEvent: Para entrada de teclado
- WindowEvent: Para eventos de la ventana
- ItemEvent: Para cambios de estado

{{% note %}}
Características de los eventos:
- ActionEvent:
  * Usado principalmente con botones y menús
  * Representa una acción simple
  * Proporciona comando y fuente del evento

- MouseEvent:
  * Incluye posición del mouse
  * Diferentes tipos (click, press, release, move)
  * Útil para interfaces gráficas avanzadas

- KeyEvent:
  * Captura pulsaciones de teclas
  * Distingue entre key press y key release
  * Proporciona código de tecla y modificadores

- WindowEvent:
  * Maneja el ciclo de vida de la ventana
  * Útil para cleanup y validación
  * Controla minimizar, maximizar, cerrar

- ItemEvent:
  * Para componentes con estados (checkbox, combobox)
  * Proporciona estado anterior y nuevo
  * Útil para UI reactiva
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Primera Aplicación: Calculadora Simple

```java
public class Calculadora extends JFrame {
    private JTextField display;
    private double result = 0;
    private String lastOperation = "=";
    private boolean start = true;
    
    public Calculadora() {
        // Configuración de la ventana
        configureWindow();
        
        // Crear componentes
        createDisplay();
        createButtons();
    }
    
    private void configureWindow() {
        setTitle("Calculadora");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());
    }
    
    private void createDisplay() {
        display = new JTextField("0");
        display.setEditable(false);
        display.setHorizontalAlignment(JTextField.RIGHT);
        add(display, BorderLayout.NORTH);
    }
    
    private void createButtons() {
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(4, 4, 5, 5));
        
        String[] buttonLabels = {
            "7", "8", "9", "/",
            "4", "5", "6", "*",
            "1", "2", "3", "-",
            "0", ".", "=", "+"
        };
        
        for (String label : buttonLabels) {
            JButton button = new JButton(label);
            buttonPanel.add(button);
            button.addActionListener(new ButtonClickListener());
        }
        
        add(buttonPanel, BorderLayout.CENTER);
    }
}
```

{{% note %}}
Aspectos clave de la implementación:
- Hereda de JFrame para crear la ventana principal
- Usa BorderLayout para organizar componentes principales
- GridLayout para la matriz de botones
- Encapsula la creación de componentes en métodos
- Sigue principios de diseño OOP:
  * Encapsulación de estado
  * Métodos privados para organización
  * Manejo de eventos mediante delegate
{{% /note %}}

---

#### Manejando los Eventos

```java
private class ButtonClickListener implements ActionListener {
    @Override
    public void actionPerformed(ActionEvent event) {
        String command = event.getActionCommand();
        if (command.charAt(0) >= '0' && command.charAt(0) <= '9' || command.equals(".")) {
            if (start) {
                display.setText(command);
                start = false;
            } else {
                display.setText(display.getText() + command);
            }
        } else {
            if (!start) {
                calculate(Double.parseDouble(display.getText()));
                lastOperation = command;
                start = true;
            }
        }
    }
}

private void calculate(double x) {
    switch (lastOperation) {
        case "+": result += x; break;
        case "-": result -= x; break;
        case "*": result *= x; break;
        case "/": result /= x; break;
        case "=": result = x; break;
    }
    display.setText("" + result);
}
```

{{% note %}}
Manejo de eventos en la calculadora:
- Usa clase interna para acceder al estado
- Implementa ActionListener para procesar clicks
- Distingue entre números y operaciones
- Mantiene estado de la operación actual
- Actualiza display después de cada operación
- Maneja casos especiales (inicio, decimales)
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Creando un JAR Ejecutable

1. **Estructura del Proyecto**
```
src/
  ├── com/
  │   └── miapp/
  │       └── Calculadora.java
  └── META-INF/
      └── MANIFEST.MF
```

{{% note %}}
Estructura del proyecto:
- src/ contiene código fuente
- com/miapp/ sigue convención de paquetes Java
- META-INF/MANIFEST.MF es necesario para JAR ejecutable
- Organización facilita mantenimiento y distribución
{{% /note %}}

--- 

2. **MANIFEST.MF**
```
Manifest-Version: 1.0
Main-Class: com.miapp.Calculadora
```

{{% note %}}
MANIFEST.MF:
- Define metadatos del JAR
- Main-Class especifica la clase con main()
- Necesario para JAR ejecutable
- Debe terminar con línea en blanco
- Puede incluir otras propiedades como Class-Path
{{% /note %}}

---

#### Comandos para crear JAR

```bash
# Compilar
javac -d bin src/com/miapp/*.java

# Crear JAR
jar cvfm calculadora.jar src/META-INF/MANIFEST.MF -C bin .

# Ejecutar
java -jar calculadora.jar
```

{{% note %}}
Proceso de creación del JAR:
- javac compila los archivos .java a .class
- -d bin especifica directorio de salida
- jar crea el archivo JAR ejecutable
- cvfm: create, verbose, manifest, nombre archivo
- -C bin . incluye todos los archivos de bin/
- El JAR resultante es portable y ejecutable
{{% /note %}}

{{% /section %}}

---

### Ejercicio: Conversor de Temperatura (30-45 min)

Crear una aplicación gráfica que:
1. Tenga un campo de texto para ingresar temperatura
2. Dos botones: "°C a °F" y "°F a °C"
3. Una etiqueta para mostrar el resultado
4. Un menú con opciones para:
   - Limpiar campos
   - Salir
   - Acerca de (mostrar diálogo)

**Requerimientos:**
- Validar que el input sea numérico
- Mostrar mensajes de error en un JOptionPane
- Usar GridBagLayout para la disposición
- Implementar el patrón Delegate para las conversiones

{{% note %}}
Aquí está una implementación completa del ejercicio sin usar lambdas:

```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

// Interfaz para el patrón delegate
interface TemperatureConverter {
    double convert(double temp);
}

public class ConversorTemperatura extends JFrame {
    private JTextField inputTemp;
    private JLabel resultLabel;
    private JButton celsiusButton;
    private JButton fahrenheitButton;
    
    // Implementaciones del delegate como clases internas
    private class CelsiusToFahrenheitConverter implements TemperatureConverter {
        public double convert(double temp) {
            return (temp * 9/5) + 32;
        }
    }
    
    private class FahrenheitToCelsiusConverter implements TemperatureConverter {
        public double convert(double temp) {
            return (temp - 32) * 5/9;
        }
    }
    
    private final TemperatureConverter celsiusToFahr = new CelsiusToFahrenheitConverter();
    private final TemperatureConverter fahrToCelsius = new FahrenheitToCelsiusConverter();
    
    public ConversorTemperatura() {
        setTitle("Conversor de Temperatura");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setupUI();
        setupMenu();
        pack();
        setLocationRelativeTo(null);
    }
    
    private void setupUI() {
        setLayout(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        
        // Input field
        inputTemp = new JTextField(10);
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.insets = new Insets(5,5,5,5);
        add(inputTemp, gbc);
        
        // Buttons
        celsiusButton = new JButton("°C a °F");
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 1;
        add(celsiusButton, gbc);
        
        fahrenheitButton = new JButton("°F a °C");
        gbc.gridx = 1;
        gbc.gridy = 1;
        add(fahrenheitButton, gbc);
        
        // Result label
        resultLabel = new JLabel("Resultado: ");
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        add(resultLabel, gbc);
        
        // Button listeners
        celsiusButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                convertTemperature(celsiusToFahr, "°F");
            }
        });
        
        fahrenheitButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                convertTemperature(fahrToCelsius, "°C");
            }
        });
    }
    
    private void setupMenu() {
        JMenuBar menuBar = new JMenuBar();
        JMenu menu = new JMenu("Opciones");
        
        JMenuItem clearItem = new JMenuItem("Limpiar");
        clearItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                inputTemp.setText("");
                resultLabel.setText("Resultado: ");
            }
        });
        
        JMenuItem exitItem = new JMenuItem("Salir");
        exitItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        
        JMenuItem aboutItem = new JMenuItem("Acerca de");
        aboutItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(ConversorTemperatura.this,
                    "Conversor de Temperatura v1.0\n" +
                    "Creado para la clase de POO",
                    "Acerca de",
                    JOptionPane.INFORMATION_MESSAGE);
            }
        });
        
        menu.add(clearItem);
        menu.addSeparator();
        menu.add(exitItem);
        menu.addSeparator();
        menu.add(aboutItem);
        
        menuBar.add(menu);
        setJMenuBar(menuBar);
    }
    
    private void convertTemperature(TemperatureConverter converter, String unit) {
        try {
            double temp = Double.parseDouble(inputTemp.getText());
            double result = converter.convert(temp);
            resultLabel.setText(String.format("Resultado: %.2f %s", result, unit));
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this,
                "Por favor ingrese un número válido",
                "Error",
                JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new ConversorTemperatura().setVisible(true);
            }
        });
    }
}
```

Puntos clave de la implementación:
1. Usa GridBagLayout para una disposición precisa
2. Implementa el patrón Delegate con clases internas
3. Usa clases anónimas para los ActionListeners
4. Maneja errores con JOptionPane
5. Tiene un menú completo con acciones básicas
6. Sigue las convenciones de Swing (EDT)
7. Código organizado en métodos privados
8. No usa expresiones lambda para mayor compatibilidad
{{% /note %}}

---

### ¿Preguntas?
