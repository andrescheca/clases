+++
title = "Patrones de Diseño en Profundidad"
subtitle = "Implementaciones Prácticas y Casos de Uso"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 7: Patrones de Diseño en Práctica

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Profundizar en patrones creacionales: Builder {{% /fragment %}}
{{% fragment class="bullet-point" %}} Explorar patrones estructurales: Decorator y Adapter {{% /fragment %}}
{{% fragment class="bullet-point" %}} Analizar patrones de comportamiento: Observer y Strategy {{% /fragment %}}
{{% fragment class="bullet-point" %}} Caso práctico: Aplicación Swing con múltiples patrones {{% /fragment %}}

---

{{% section %}}

### Patrón Builder vs Factory Method

El patrón Builder nos permite construir objetos complejos paso a paso.

```java
// Producto
class Pizza {
    private String masa;
    private String salsa;
    private String queso;
    private List<String> toppings = new ArrayList<>();
    
    // Getters...
    
    @Override
    public String toString() {
        return "Pizza con masa " + masa + ", salsa " + salsa + 
               ", queso " + queso + " y toppings: " + toppings;
    }
}

// Builder
class PizzaBuilder {
    private Pizza pizza = new Pizza();
    
    public PizzaBuilder setMasa(String masa) {
        pizza.masa = masa;
        return this;
    }
    
    public PizzaBuilder setSalsa(String salsa) {
        pizza.salsa = salsa;
        return this;
    }
    
    public PizzaBuilder setQueso(String queso) {
        pizza.queso = queso;
        return this;
    }
    
    public PizzaBuilder addTopping(String topping) {
        pizza.toppings.add(topping);
        return this;
    }
    
    public Pizza build() {
        return pizza;
    }
}

// Director (opcional)
class PizzaDirector {
    public Pizza construirPizzaMargarita(PizzaBuilder builder) {
        return builder
            .setMasa("delgada")
            .setSalsa("tomate")
            .setQueso("mozzarella")
            .addTopping("albahaca")
            .build();
    }
}

// Uso
public class Main {
    public static void main(String[] args) {
        PizzaBuilder builder = new PizzaBuilder();
        
        // Construcción manual
        Pizza pizzaPersonalizada = builder
            .setMasa("gruesa")
            .setSalsa("BBQ")
            .setQueso("cheddar")
            .addTopping("jamón")
            .addTopping("piña")
            .build();
            
        // Usando director
        PizzaDirector director = new PizzaDirector();
        Pizza pizzaMargarita = director.construirPizzaMargarita(new PizzaBuilder());
    }
}
```

{{% note %}}
Builder vs Factory Method:

Builder:
- Usado cuando un objeto necesita ser construido en varios pasos
- Permite diferentes representaciones del mismo objeto
- Encapsula la construcción compleja
- Proporciona control fino sobre el proceso de construcción
- Útil cuando un objeto requiere muchos parámetros opcionales

Factory Method:
- Crea objetos en un solo paso
- Se centra en crear diferentes tipos de objetos
- No maneja construcción compleja
- Menos flexible en términos de configuración
- Mejor cuando la creación es simple y directa

Casos de uso del Builder:
1. Objetos con muchos parámetros opcionales
2. Objetos que requieren un orden específico de construcción
3. Cuando queremos inmutabilidad en el objeto final
4. Construcción de objetos complejos como documentos o interfaces gráficas

Ejemplos en Java Standard Library:
- StringBuilder
- StringBuffer
- Stream.Builder
- DocumentBuilder
{{% /note %}}

---

### Patrón Decorator

Permite añadir funcionalidades a objetos existentes dinámicamente.

```java
// Componente base
interface Coffee {
    String getDescription();
    double getCost();
}

// Componente concreto
class SimpleCoffee implements Coffee {
    public String getDescription() {
        return "Café simple";
    }
    
    public double getCost() {
        return 1.0;
    }
}

// Decorator base
abstract class CoffeeDecorator implements Coffee {
    protected Coffee decoratedCoffee;
    
    public CoffeeDecorator(Coffee coffee) {
        this.decoratedCoffee = coffee;
    }
    
    public String getDescription() {
        return decoratedCoffee.getDescription();
    }
    
    public double getCost() {
        return decoratedCoffee.getCost();
    }
}

// Decoradores concretos
class MilkDecorator extends CoffeeDecorator {
    public MilkDecorator(Coffee coffee) {
        super(coffee);
    }
    
    public String getDescription() {
        return decoratedCoffee.getDescription() + ", con leche";
    }
    
    public double getCost() {
        return decoratedCoffee.getCost() + 0.5;
    }
}

class SugarDecorator extends CoffeeDecorator {
    public SugarDecorator(Coffee coffee) {
        super(coffee);
    }
    
    public String getDescription() {
        return decoratedCoffee.getDescription() + ", con azúcar";
    }
    
    public double getCost() {
        return decoratedCoffee.getCost() + 0.2;
    }
}

// Uso
public class CoffeeShop {
    public static void main(String[] args) {
        Coffee coffee = new SimpleCoffee();
        coffee = new MilkDecorator(coffee);
        coffee = new SugarDecorator(coffee);
        
        System.out.println("Descripción: " + coffee.getDescription());
        System.out.println("Costo: $" + coffee.getCost());
    }
}
```

{{% note %}}
Características del Decorator:
- Añade funcionalidad a objetos sin alterar su estructura
- Alternativa flexible a la herencia para extender funcionalidad
- Sigue el principio Open/Closed
- Permite combinar comportamientos dinámicamente

Casos de uso:
1. Streams de E/S en Java (FileInputStream, BufferedInputStream, etc.)
2. Interfaces gráficas (añadir bordes, scrollbars, etc.)
3. Middleware en aplicaciones web
4. Filtros y procesadores de datos

Ventajas:
- Mayor flexibilidad que la herencia estática
- Evita clases sobrecargadas de funcionalidad
- Permite combinar comportamientos
- Respeta el principio de responsabilidad única

Desventajas:
- Puede resultar en muchas clases pequeñas
- Puede complicar el código si se usa en exceso
- El orden de los decoradores puede ser importante

Ejemplos en Java Standard Library:
- java.io.BufferedReader(new FileReader())
- java.io.BufferedInputStream(new FileInputStream())
- javax.swing.border.BorderFactory
{{% /note %}}

---

### Patrón Adapter

Permite que interfaces incompatibles trabajen juntas.

```java
// Interface objetivo
interface MediaPlayer {
    void play(String fileName);
}

// Interface incompatible
interface AdvancedMediaPlayer {
    void playMp4(String fileName);
    void playAvi(String fileName);
}

// Implementación de la interface incompatible
class AdvancedMediaPlayerImpl implements AdvancedMediaPlayer {
    public void playMp4(String fileName) {
        System.out.println("Reproduciendo MP4: " + fileName);
    }
    
    public void playAvi(String fileName) {
        System.out.println("Reproduciendo AVI: " + fileName);
    }
}

// Adapter
class MediaAdapter implements MediaPlayer {
    private AdvancedMediaPlayer advancedPlayer;
    
    public MediaAdapter() {
        this.advancedPlayer = new AdvancedMediaPlayerImpl();
    }
    
    public void play(String fileName) {
        if(fileName.endsWith(".mp4")) {
            advancedPlayer.playMp4(fileName);
        } else if(fileName.endsWith(".avi")) {
            advancedPlayer.playAvi(fileName);
        } else {
            System.out.println("Formato no soportado");
        }
    }
}

// Cliente que usa el adapter
class AudioPlayer implements MediaPlayer {
    private MediaAdapter mediaAdapter;
    
    public AudioPlayer() {
        this.mediaAdapter = new MediaAdapter();
    }
    
    public void play(String fileName) {
        if(fileName.endsWith(".mp3")) {
            System.out.println("Reproduciendo MP3: " + fileName);
        } else {
            mediaAdapter.play(fileName);
        }
    }
}

// Uso
public class MusicApp {
    public static void main(String[] args) {
        AudioPlayer player = new AudioPlayer();
        
        player.play("cancion.mp3");  // Reproducción nativa
        player.play("video.mp4");    // Usa adapter
        player.play("pelicula.avi"); // Usa adapter
    }
}
```

{{% note %}}
Características del Adapter:
- Convierte la interface de una clase en otra que el cliente espera
- Permite que clases incompatibles trabajen juntas
- Puede ser de clase (herencia) o de objeto (composición)
- Muy útil para integrar sistemas legacy o bibliotecas de terceros

Tipos de Adapter:
1. Adapter de Clase:
   - Usa herencia múltiple (donde está disponible)
   - Más rígido pero más directo
   - No puede adaptar subclases

2. Adapter de Objeto:
   - Usa composición
   - Más flexible
   - Puede adaptar cualquier subclase
   - Preferido en la mayoría de los casos

Casos de uso:
1. Integración de bibliotecas externas
2. Compatibilidad con sistemas legacy
3. Reutilización de código existente
4. APIs incompatibles

Ejemplos en Java Standard Library:
- Arrays.asList()
- InputStreamReader/OutputStreamWriter
- Collections.list()/Collections.enumeration()
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Patrón Strategy

Permite definir una familia de algoritmos intercambiables.

```java
// Strategy interface
interface SortStrategy {
    void sort(int[] array);
}

// Estrategias concretas
class BubbleSort implements SortStrategy {
    public void sort(int[] array) {
        System.out.println("Ordenando con Bubble Sort");
        // Implementación del bubble sort
    }
}

class QuickSort implements SortStrategy {
    public void sort(int[] array) {
        System.out.println("Ordenando con Quick Sort");
        // Implementación del quick sort
    }
}

class MergeSort implements SortStrategy {
    public void sort(int[] array) {
        System.out.println("Ordenando con Merge Sort");
        // Implementación del merge sort
    }
}

// Contexto
class Sorter {
    private SortStrategy strategy;
    
    public void setStrategy(SortStrategy strategy) {
        this.strategy = strategy;
    }
    
    public void sort(int[] array) {
        if(strategy == null) {
            throw new IllegalStateException("Estrategia no definida");
        }
        strategy.sort(array);
    }
}

// Uso
public class SortingApp {
    public static void main(String[] args) {
        int[] array = {64, 34, 25, 12, 22, 11, 90};
        Sorter sorter = new Sorter();
        
        // Usando diferentes estrategias
        sorter.setStrategy(new BubbleSort());
        sorter.sort(array);  // Ordenamiento con bubble sort
        
        sorter.setStrategy(new QuickSort());
        sorter.sort(array);  // Ordenamiento con quick sort
    }
}
```

{{% note %}}
Características del Strategy:
- Define una familia de algoritmos encapsulados
- Hace los algoritmos intercambiables
- Permite cambiar el algoritmo en tiempo de ejecución
- Separa el algoritmo de su uso

Casos de uso:
1. Diferentes métodos de ordenamiento
2. Diferentes algoritmos de compresión
3. Diferentes estrategias de validación
4. Diferentes métodos de pago en un e-commerce

Beneficios:
- Evita condicionales complejos
- Facilita la adición de nuevos algoritmos
- Permite cambiar comportamiento en runtime
- Promueve el principio Open/Closed

Ejemplos en Java Standard Library:
- Comparator interface
- javax.servlet.http.HttpServlet
- Collections.sort() con Comparator
{{% /note %}}

---

### Patrón Observer (Repaso y Profundización)

```java
// Interface Observable (Subject)
interface WeatherStation {
    void registerObserver(WeatherObserver observer);
    void removeObserver(WeatherObserver observer);
    void notifyObservers();
}

// Interface Observer
interface WeatherObserver {
    void update(float temperature, float humidity, float pressure);
}

// Implementación Concreta del Observable
class WeatherData implements WeatherStation {
    private List<WeatherObserver> observers = new ArrayList<>();
    private float temperature;
    private float humidity;
    private float pressure;
    
    public void registerObserver(WeatherObserver observer) {
        observers.add(observer);
    }
    
    public void removeObserver(WeatherObserver observer) {
        observers.remove(observer);
    }
    
    public void notifyObservers() {
        for(WeatherObserver observer : observers) {
            observer.update(temperature, humidity, pressure);
        }
    }
    
    public void setMeasurements(float temperature, float humidity, float pressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.pressure = pressure;
        notifyObservers();
    }
}

// Implementaciones Concretas de Observers
class CurrentConditionsDisplay implements WeatherObserver {
    public void update(float temperature, float humidity, float pressure) {
        System.out.println("Condiciones actuales:");
        System.out.println("Temperatura: " + temperature + "°C");
        System.out.println("Humedad: " + humidity + "%");
    }
}

class StatisticsDisplay implements WeatherObserver {
    private List<Float> temperatures = new ArrayList<>();
    
    public void update(float temperature, float humidity, float pressure) {
        temperatures.add(temperature);
        displayStats();
    }
    
    private void displayStats() {
        float avg = temperatures.stream()
            .reduce(0f, Float::sum) / temperatures.size();
        float max = Collections.max(temperatures);
        float min = Collections.min(temperatures);
        
        System.out.println("\nEstadísticas de Temperatura:");
        System.out.println("Promedio: " + avg + "°C");
        System.out.println("Máxima: " + max + "°C");
        System.out.println("Mínima: " + min + "°C");
    }
}

// Uso
public class WeatherStation {
    public static void main(String[] args) {
        WeatherData weatherData = new WeatherData();
        
        CurrentConditionsDisplay currentDisplay = new CurrentConditionsDisplay();
        StatisticsDisplay statsDisplay = new StatisticsDisplay();
        
        weatherData.registerObserver(currentDisplay);
        weatherData.registerObserver(statsDisplay);
        
        // Simulando cambios en el clima
        weatherData.setMeasurements(25.5f, 65.0f, 1013.1f);
        weatherData.setMeasurements(26.7f, 70.0f, 1014.2f);
    }
}
```

{{% note %}}
Características del Observer:
- Establece relaciones uno-a-muchos entre objetos
- Los observadores son notificados automáticamente
- Desacopla sujetos de observadores
- Soporta comunicación broadcast

Casos de uso:
1. Interfaces de usuario (eventos)
2. Monitoreo de sistemas
3. Publicación-suscripción de eventos
4. Actualización de vistas en MVC

Implementación en Java:
- Observable/Observer (obsoleto desde Java 9)
- PropertyChangeListener/PropertyChangeSupport
- EventListener en Swing
- Reactive Streams (Flow API)

Patrones relacionados:
- Mediator: coordina la comunicación entre objetos
- Singleton: el sujeto suele ser singleton
- Strategy: los observadores pueden usar diferentes estrategias
{{% /note %}}

{{% /section %}}

---

{{% section %}}

### Caso Práctico: Convertidor de Unidades

Implementaremos un convertidor de unidades usando Swing y varios patrones de diseño.

```java
// Strategy para diferentes tipos de conversión
interface ConversionStrategy {
    double convert(double value);
    String getFromUnit();
    String getToUnit();
}

class CelsiusToFahrenheitStrategy implements ConversionStrategy {
    public double convert(double celsius) {
        return (celsius * 9/5) + 32;
    }
    public String getFromUnit() { return "Celsius"; }
    public String getToUnit() { return "Fahrenheit"; }
}

class KilometersToMilesStrategy implements ConversionStrategy {
    public double convert(double km) {
        return km * 0.621371;
    }
    public String getFromUnit() { return "Kilómetros"; }
    public String getToUnit() { return "Millas"; }
}

// Observer para actualizar la interfaz
interface ConversionObserver {
    void onConversionPerformed(double result);
}

// La ventana principal implementa el observer
public class UnitConverterGUI extends JFrame implements ConversionObserver {
    private JTextField inputField;
    private JLabel resultLabel;
    private JComboBox<String> conversionType;
    private Map<String, ConversionStrategy> strategies;
    
    public UnitConverterGUI() {
        setupStrategies();
        setupGUI();
    }
    
    private void setupStrategies() {
        strategies = new HashMap<>();
        strategies.put("Temperatura", new CelsiusToFahrenheitStrategy());
        strategies.put("Distancia", new KilometersToMilesStrategy());
    }
    
    private void setupGUI() {
        setTitle("Convertidor de Unidades");
        setLayout(new GridLayout(4, 1, 10, 10));
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        conversionType = new JComboBox<>(strategies.keySet().toArray(new String[0]));
        inputField = new JTextField();
        JButton convertButton = new JButton("Convertir");
        resultLabel = new JLabel("Resultado: ", SwingConstants.CENTER);
        
        convertButton.addActionListener(e -> performConversion());
        
        add(conversionType);
        add(inputField);
        add(convertButton);
        add(resultLabel);
        
        pack();
        setSize(300, 200);
        setLocationRelativeTo(null);
    }
    
    private void performConversion() {
        try {
            String selected = (String) conversionType.getSelectedItem();
            ConversionStrategy strategy = strategies.get(selected);
            double value = Double.parseDouble(inputField.getText());
            double result = strategy.convert(value);
            onConversionPerformed(result);
        } catch (NumberFormatException ex) {
            resultLabel.setText("Error: Ingrese un número válido");
        }
    }
    
    @Override
    public void onConversionPerformed(double result) {
        String selected = (String) conversionType.getSelectedItem();
        ConversionStrategy strategy = strategies.get(selected);
        resultLabel.setText(String.format("%.2f %s = %.2f %s", 
            Double.parseDouble(inputField.getText()),
            strategy.getFromUnit(),
            result,
            strategy.getToUnit()));
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new UnitConverterGUI().setVisible(true);
        });
    }
}
```

{{% note %}}
Patrones utilizados en el convertidor:

1. Strategy:
   - ConversionStrategy define la interfaz para diferentes tipos de conversión
   - Cada estrategia implementa un tipo específico de conversión
   - Permite agregar nuevas conversiones fácilmente

2. Observer:
   - ConversionObserver define la interfaz para actualizar la UI
   - La ventana principal observa los resultados de conversión
   - Desacopla la lógica de conversión de la actualización de UI

3. Factory Method (implícito):
   - setupStrategies() actúa como factory para crear estrategias
   - Centraliza la creación de estrategias
   - Facilita la adición de nuevas estrategias

4. Singleton (implícito):
   - La ventana principal es efectivamente un singleton
   - Solo existe una instancia del convertidor

{{% /note %}}

{{% /section %}}

---

### ¿Preguntas?