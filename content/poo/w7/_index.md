+++
title = "Colecciones en Java"
outputs = ["Reveal"]
+++

## Semana 7

- Colecciones en Java

---

### Arreglos de Datos Primitivos

{{% fragment class="bullet-point small-text-size" %}}Los arreglos de datos primitivos almacenan tipos de datos básicos como `int`, `double`, `char`, etc.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}La sintaxis para declarar un arreglo de tipo primitivo es: `tipo[] nombre = new tipo[tamaño];`{{% /fragment %}}

---

### Ejemplo de Arreglo de Datos Primitivos

```java
int[] numeros = new int[5];
numeros[0] = 10;
numeros[1] = 20;
// Accediendo a los elementos
for (int i = 0; i < numeros.length; i++) {
System.out.println(numeros[i]);
}
```

{{% fragment class="bullet-point small-text-size" %}}Este ejemplo muestra la creación y acceso a un arreglo de enteros.{{% /fragment %}}

---

### Arreglos de Objetos

{{% fragment class="bullet-point small-text-size" %}}Los arreglos de objetos almacenan objetos de cualquier tipo, incluyendo instancias de clases definidas por el usuario.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}La declaración es similar a los arreglos primitivos, pero cada elemento debe ser instanciado.{{% /fragment %}}

---

### Ejemplo de Arreglo de Objetos

```java
String[] nombres = new String[3];
nombres[0] = "Alice";
nombres[1] = "Bob";
nombres[2] = "Charlie";
// Accediendo a los elementos
for (String nombre : nombres) {
System.out.println(nombre);
}
```

{{% fragment class="bullet-point small-text-size" %}}Este ejemplo muestra la creación y acceso a un arreglo de strings.{{% /fragment %}}

---

### ArrayList y Uso de Generics

{{% fragment class="bullet-point small-text-size" %}}`ArrayList` es una parte de las colecciones en Java que permite almacenar elementos de manera dinámica.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Generics permiten especificar el tipo de elementos que el `ArrayList` puede contener, proporcionando seguridad de tipo en tiempo de compilación.{{% /fragment %}}

---

### Ejemplo de ArrayList

```java
import java.util.ArrayList;

ArrayList<String> lista = new ArrayList<>();
lista.add("Apple");
lista.add("Banana");
// Accediendo a los elementos
for (String fruta : lista) {
System.out.println(fruta);
}
```

{{% fragment class="bullet-point small-text-size" %}}Este ejemplo muestra cómo trabajar con `ArrayList` utilizando Generics para asegurar que solo se añadan Strings.{{% /fragment %}}

---

### HashMap y Uso de Generics

{{% fragment class="bullet-point small-text-size" %}}`HashMap` es una estructura de datos que almacena pares clave-valor.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Como con `ArrayList`, los genéricos se utilizan para asegurar que las claves y valores sean del tipo correcto.{{% /fragment %}}

---

### Ejemplo de HashMap

```java
import java.util.HashMap;

HashMap<String, Integer> map = new HashMap<>();
map.put("Llaves", 100);
map.put("Zapatos", 3);
// Accediendo a los elementos
for (String key : map.keySet()) {
System.out.println(key + ": " + map.get(key));
}
```
{{% fragment class="bullet-point small-text-size" %}}Este ejemplo muestra cómo trabajar con `HashMap` utilizando Generics para asegurar la consistencia de tipos en las claves y valores.{{% /fragment %}}

