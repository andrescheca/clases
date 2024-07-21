+++
title = "Explorando Más Allá del Curso"
outputs = ["Reveal"]
+++

## Temas Avanzados en Java

- Qué explorar después de este curso

---

### Anotaciones en Java

{{% fragment class="bullet-point small-text-size" %}}Las anotaciones son metadatos que proporcionan datos sobre el programa pero no son parte del programa en sí.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Se utilizan para configurar el comportamiento de ciertos procesos en tiempo de compilación y ejecución.{{% /fragment %}}

---

### Crear y Usar una Anotación

```java
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

// Definición de la anotación
@Retention(RetentionPolicy.RUNTIME)  // Esta anotación puede ser detectada en tiempo de ejecución
@Target(ElementType.TYPE)  // Esta anotación es aplicable a clases
public @interface MyCustomAnnotation {
    String description() default "No description";
}

// Uso de la anotación en una clase
@MyCustomAnnotation(description = "Esta es una clase de ejemplo con anotación personalizada")
public class MyClass {
    // Implementación de la clase
}

// Clase para probar la anotación
public class TestAnnotation {
    public static void main(String[] args) {
        Class<?> cls = MyClass.class;

        // Verificar si 'MyClass' tiene la anotación 'MyCustomAnnotation'
        if (cls.isAnnotationPresent(MyCustomAnnotation.class)) {
            MyCustomAnnotation annotation = cls.getAnnotation(MyCustomAnnotation.class);
            System.out.println("Descripción: " + annotation.description());
        } else {
            System.out.println("MyClass no tiene la anotación 'MyCustomAnnotation'");
        }
    }
}
```

{{% fragment class="bullet-point small-text-size" %}}Este ejemplo muestra cómo crear y aplicar una anotación personalizada en Java.{{% /fragment %}}

---

### Reflection en Java

{{% fragment class="bullet-point small-text-size" %}}Reflection permite examinar o modificar en tiempo de ejecución el comportamiento de clases, interfaces, campos y métodos.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Es una herramienta poderosa para la programación avanzada y la creación de frameworks.{{% /fragment %}}

---

### Relación entre Anotaciones y Reflection

{{% fragment class="bullet-point small-text-size" %}}Las anotaciones a menudo se utilizan junto con reflection para obtener información sobre las anotaciones en tiempo de ejecución y actuar en consecuencia.{{% /fragment %}}

---

### Ejemplo de Reflection

```java
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Method;

// Definición de la anotación
@Retention(RetentionPolicy.RUNTIME)  // Esta anotación puede ser detectada en tiempo de ejecución
@Target(ElementType.TYPE)  // Esta anotación es aplicable a clases
public @interface MyCustomAnnotation {
    String description() default "No description";
}

// Uso de la anotación en una clase
@MyCustomAnnotation(description = "Esta es una clase de ejemplo con anotación personalizada")
public class MyClass {
    // Método que queremos invocar usando reflection
    public void displayMessage() {
        System.out.println("Este es un mensaje desde MyClass!");
    }
}

// Clase para probar la anotación con reflection y llamar a un método indirectamente
public class TestAnnotation {
    public static void main(String[] args) {
        try {
            Class<?> cls = MyClass.class;

            // Verificar si 'MyClass' tiene la anotación 'MyCustomAnnotation'
            if (cls.isAnnotationPresent(MyCustomAnnotation.class)) {
                // Obtener la instancia de la anotación
                MyCustomAnnotation annotation = cls.getAnnotation(MyCustomAnnotation.class);
                // Imprimir la descripción proporcionada en la anotación
                System.out.println("Descripción: " + annotation.description());
            } else {
                System.out.println("MyClass no tiene la anotación 'MyCustomAnnotation'");
            }

            // Crear una instancia de MyClass
            Object obj = cls.getDeclaredConstructor().newInstance();

            // Obtener el método 'displayMessage' de MyClass
            Method method = cls.getMethod("displayMessage");

            // Invocar el método 'displayMessage' en la instancia de MyClass
            method.invoke(obj);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

---

### Hilos en Java

{{% fragment class="bullet-point small-text-size" %}}Los hilos permiten la ejecución concurrente dentro de un programa.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Java proporciona múltiples formas de manejar hilos, incluyendo la interfaz `Runnable` y la clase `Thread`.{{% /fragment %}}

---

### Ejemplo de Uso de Hilos

```java 
class HelloRunnable implements Runnable {
public void run() {
System.out.println("Hello from a thread!");
}
public static void main(String[] args) {
    (new Thread(new HelloRunnable())).start();
}
}
```