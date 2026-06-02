+++
title = "Programación Orientada a Objetos - Semana 1"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Programación Orientada a Objetos · Semana 1</div>
  <h1 class="deck-cover__title">De escribir pasos a diseñar sistemas</h1>
  <p class="deck-cover__subtitle">Hoy no intentamos cubrir todo Java. Abrimos el mapa: por qué existe la orientación a objetos, qué papel cumple Java y cómo dejamos listo el entorno para trabajar.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">Diseño</span>
    <span class="deck-cover__chip">Java</span>
    <span class="deck-cover__chip">Primer programa</span>
  </div>
</div>

{{% note %}}
La primera sesión debe posicionar el curso. Java es el medio; la materia trata de modelar y sostener software.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Tesis de la clase</div>
  <div class="statement">POO no empieza con clases. Empieza con responsabilidades.</div>
  <p class="statement-note">Si una clase no tiene una responsabilidad clara, el código puede compilar y aun así estar mal diseñado.</p>
</div>

{{% note %}}
Usar esta tesis para subir el nivel desde el inicio.
No presentar POO como "usar class", sino como una forma de ubicar responsabilidades, reglas y colaboración.
Pedir un ejemplo simple: en un sistema de notas, qué objeto debería calcular el promedio y cuál solo muestra datos?
{{% /note %}}

---

### La ruta de hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>1. Contexto</strong>
      <span>Qué cambia al pasar de flujo procedural a objetos.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>2. Java</strong>
      <span>Por qué usaremos un lenguaje más explícito y estructurado.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>3. Entorno</strong>
      <span>JDK, IntelliJ y un proyecto mínimo ejecutable.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>4. Primer logro</strong>
      <span>Leer, ejecutar y modificar un programa pequeño.</span>
    </div>
  </div>
</div>

{{% note %}}
La ruta reemplaza el listado largo de temas de Java de la versión anterior.
Marcar que hoy no se agotará sintaxis: se dejará un mapa mínimo para poder practicar.
Si hay estudiantes con problemas de entorno, resolverlo en el bloque de laboratorio, no durante toda la exposición.
El ritmo recupera estructura de la versión anterior sin convertir la clase en una lista enorme de sintaxis.
Si el grupo ya domina lo básico, reducir laboratorio y usar más tiempo en errores y lectura de código.
{{% /note %}}

---

<div class="visual-split">
  <div class="visual-copy">
    <div class="eyebrow">Cambio mental</div>
    <h2>Antes: instrucciones. Ahora: modelos.</h2>
    <p class="lead">La programación estructurada organiza pasos. La orientación a objetos organiza entidades, reglas y relaciones.</p>
  </div>
  <div class="visual-panel">
    <div class="concept-map">
      <div class="concept-node">
        <strong>Dato suelto</strong>
        <span>`saldo`, `nombre`, `estado`, `fecha`</span>
      </div>
      <div class="concept-arrow">↓</div>
      <div class="concept-node">
        <strong>Función suelta</strong>
        <span>`depositar()`, `validar()`, `notificar()`</span>
      </div>
      <div class="concept-arrow">↓</div>
      <div class="concept-node">
        <strong>Objeto</strong>
        <span>estado + comportamiento + responsabilidad</span>
      </div>
    </div>
  </div>
</div>

{{% note %}}
La idea no es atacar la programación estructurada. Es mostrar que funciona muy bien hasta cierto tamaño de problema.
{{% /note %}}

---

### Python y Java empujan decisiones distintas

<div class="axis">
  <div class="axis__line"></div>
  <div class="axis__labels">
    <div>
      <strong>Python</strong>
      <span>Rápido para expresar ideas y probar caminos.</span>
    </div>
    <div>
      <strong>Java</strong>
      <span>Explícito para contratos, tipos y estructura.</span>
    </div>
  </div>
</div>

<div class="takeaway">
  <strong>Lectura correcta</strong>
  No es una pelea de lenguajes. Es una diferencia de disciplina: Java obliga a nombrar más decisiones desde el inicio.
</div>

{{% note %}}
Recupera la comparación Python vs Java de la versión anterior.
Evitar decir que Java es "mejor"; la idea es que Java obliga a declarar tipos, estructura y punto de entrada.
Conectar con evaluación: se revisará diseño explícito, no solo que el programa corra.
{{% /note %}}

---

### El mismo saludo, más estructura

```python
def saludar(nombre):
    print(f"Hola {nombre}")

saludar("Ana")
```

```java
public class Saludos {
    public static void main(String[] args) {
        saludar("Ana");
    }

    public static void saludar(String nombre) {
        System.out.println("Hola " + nombre);
    }
}
```

{{% note %}}
Pausa breve: pedir que identifiquen entrada, salida, nombre de función y punto de ejecución en ambos ejemplos.
{{% /note %}}

---

<div class="visual-split">
  <div class="visual-copy">
    <div class="eyebrow">Por qué Java</div>
    <h2>El lenguaje nos obliga a ver la estructura.</h2>
    <p class="lead">Tipos, clases, métodos y punto de entrada parecen ceremonia al inicio. Más adelante son el andamiaje que permite sostener sistemas grandes.</p>
  </div>
  <div class="visual-panel">
    <div class="concept-map">
      <div class="concept-node">
        <strong>Código fuente</strong>
        <span>`Saludos.java`</span>
      </div>
      <div class="concept-arrow">↓ compila</div>
      <div class="concept-node">
        <strong>Bytecode</strong>
        <span>`Saludos.class`</span>
      </div>
      <div class="concept-arrow">↓ ejecuta</div>
      <div class="concept-node">
        <strong>JVM</strong>
        <span>Windows, macOS, Linux, servidores y dispositivos.</span>
      </div>
    </div>
  </div>
</div>

{{% note %}}
Explicar fuente, compilación, bytecode y JVM como cadena conceptual, no como detalle histórico.
Esto recupera la explicación de "qué es Java" y por qué corre en distintas plataformas.
Si hay tiempo, mostrar que el IDE oculta parte de este proceso, pero no lo elimina.
{{% /note %}}

---

### Entorno mínimo

<div class="big-word-grid">
  <div class="big-word">
    <strong>JDK</strong>
    <span>Compila y ejecuta programas Java.</span>
  </div>
  <div class="big-word">
    <strong>IntelliJ</strong>
    <span>Nos ayuda a leer errores, navegar código y ejecutar proyectos.</span>
  </div>
  <div class="big-word">
    <strong>Proyecto</strong>
    <span>Una carpeta ordenada donde el código puede crecer.</span>
  </div>
</div>

<div class="callout">
  <strong>Recursos</strong>
  <p>[Java](https://www.oracle.com/java/technologies/downloads/) · [JetBrains Education](https://www.jetbrains.com/community/education/) · [IntelliJ IDEA](https://www.jetbrains.com/idea/download/)</p>
</div>

{{% note %}}
Verificar tres cosas en vivo: versión de JDK, creación de proyecto y ejecución desde IntelliJ.
No permitir instalaciones improvisadas largas en medio de la explicación: anotar bloqueos y pasar a apoyo puntual durante laboratorio.
{{% /note %}}

---

### Primer programa

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("Hola, POO");
    }
}
```

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>`HolaMundo.java`</strong>
      <span>El archivo y la clase pública deben coincidir.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>`main`</strong>
      <span>El punto de entrada de ejecución.</span>
    </div>
  </div>
</div>

{{% note %}}
Recupera la explicación de estructura de programa Java:
- Archivo y clase pública con el mismo nombre.
- main como punto de entrada.
- System.out.println como salida básica.
Pedir que identifiquen qué partes son nombres elegidos por nosotros y qué partes son obligatorias.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Primera práctica</div>
  <div class="statement">Romper algo pequeño también es aprender.</div>
  <p class="statement-note">Cambiar texto, borrar un punto y coma, renombrar la clase y leer el error del compilador enseña más que copiar el ejemplo intacto.</p>
</div>

{{% note %}}
Dedicar unos minutos a errores deliberados:
- Quitar punto y coma.
- Cambiar nombre de clase sin cambiar archivo.
- Escribir mal String.
- Quitar una llave.
La meta es que lean errores de compilación sin pánico.
{{% /note %}}

---

### Leer errores, no adivinarlos

<div class="case-strip">
  <div class="case-tile">
    <strong>Compilación</strong>
    <span>Falta <code>;</code>, nombre de clase incorrecto o llave sin cerrar.</span>
  </div>
  <div class="case-tile">
    <strong>Ejecución</strong>
    <span>El programa compila, pero falla con una excepción.</span>
  </div>
  <div class="case-tile">
    <strong>Depuración</strong>
    <span>Breakpoints, inspección de variables y ejecución paso a paso.</span>
  </div>
</div>

<div class="takeaway">
  <strong>Regla inicial</strong>
  Antes de cambiar código al azar, leer la primera línea útil del error.
</div>

{{% note %}}
Esta slide recupera depuración y errores comunes de la versión anterior.
Hacer una demostración corta:
- Error de compilación por punto y coma.
- Error de ejecución por conversión inválida o índice fuera de rango.
- Breakpoint en IntelliJ para ver el valor de una variable.
{{% /note %}}

---

### Sintaxis que sí importa hoy

<div class="big-word-grid">
  <div class="big-word">
    <strong>`;`</strong>
    <span>Cierra instrucciones.</span>
  </div>
  <div class="big-word">
    <strong>`{ }`</strong>
    <span>Delimita bloques de código.</span>
  </div>
  <div class="big-word">
    <strong>`String`</strong>
    <span>Un tipo explícito para texto.</span>
  </div>
</div>

{{% note %}}
Esta slide sustituye varias slides largas de sintaxis.
Explicar solo lo que necesitan para el laboratorio: punto y coma, llaves, tipo explícito.
Luego dejar que variables, operadores, Scanner, if, switch, for y arrays aparezcan en práctica.
{{% /note %}}

---

### Práctica: fundamentos de Java

<ol class="step-list">
  <li><div><strong>Variables y tipos</strong><br>Declarar nombre, edad, promedio y activo. Explicar declaración vs inicialización.</div></li>
  <li><div><strong>Operadores</strong><br>Calcular área, perímetro y una condición booleana compuesta.</div></li>
  <li><div><strong>Entrada</strong><br>Leer texto y números con <code>Scanner</code>. Revisar el problema de <code>nextLine()</code>.</div></li>
  <li><div><strong>Control</strong><br>Resolver un caso con <code>if</code>, otro con <code>switch</code> y una repetición con <code>for</code>.</div></li>
  <li><div><strong>Arrays</strong><br>Guardar notas, recorrerlas y calcular promedio.</div></li>
</ol>

{{% note %}}
Esto recupera los bloques largos anteriores: variables, tipos primitivos, operadores, Scanner, condicionales, ciclos y arrays.
No es necesario exponer cada tema como teoría.
Usarlo como laboratorio incremental: se explica lo mínimo y se corrige leyendo errores reales.
{{% /note %}}

---

### Ejercicio en clase

<ol class="step-list">
  <li><div><strong>Modificar</strong><br>Cambia el saludo y ejecútalo.</div></li>
  <li><div><strong>Agregar</strong><br>Guarda un nombre en una variable.</div></li>
  <li><div><strong>Decidir</strong><br>Usa un `if` con una edad.</div></li>
  <li><div><strong>Explicar</strong><br>Di qué fue sintaxis y qué fue lógica.</div></li>
</ol>

{{% note %}}
Este ejercicio debe ser corto.
La entrega mínima es un programa que compile y que puedan explicar línea por línea.
Si el grupo avanza rápido, pedir entrada por consola y cálculo simple.
Si avanza lento, concentrarse en compilar, ejecutar y leer errores.
{{% /note %}}

---

### Para la próxima clase

<div class="visual-split">
  <div class="visual-copy">
    <h2>Llegar con el entorno listo.</h2>
    <p class="lead">La siguiente sesión entra a tipos, objetos y diferencias con Python. Si el entorno falla, la clase se vuelve soporte técnico.</p>
  </div>
  <div class="visual-panel">
    <ul class="checklist">
      <li>JDK instalado.</li>
      <li>IntelliJ abre el proyecto.</li>
      <li>`HolaMundo` compila.</li>
      <li>Puedes explicar cada línea.</li>
    </ul>
  </div>
</div>

{{% note %}}
Cierre operativo:
- Confirmar que todos tienen JDK e IntelliJ.
- Pedir captura o evidencia de ejecución del primer programa si hace falta.
- Dejar claro que la semana 2 asumirá entorno listo y entrará a objetos, tipos y colecciones.
{{% /note %}}

---

<div class="statement-slide">
  <div class="eyebrow">Cierre</div>
  <div class="statement">El objetivo no es escribir más código. Es diseñar código que aguante cambios.</div>
</div>

{{% note %}}
Cerrar con una pregunta:
qué parte del programa de hoy cambiaría si mañana se pidiera leer datos de usuario?
La respuesta debe apuntar a diseño y separación, no solo a copiar más líneas.
{{% /note %}}

---

### Material de respaldo: entrada y control básico

```java
import java.util.Scanner;

public class RegistroEdad {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nombre: ");
        String nombre = scanner.nextLine();

        System.out.print("Edad: ");
        int edad = scanner.nextInt();

        if (edad >= 18) {
            System.out.println(nombre + " es mayor de edad");
        } else {
            System.out.println(nombre + " es menor de edad");
        }
    }
}
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada en el flujo principal por "Práctica: fundamentos de Java".
Usarla si el grupo necesita ver Scanner, variables e if en un ejemplo completo antes de resolver el laboratorio.
{{% /note %}}

---

### Material de respaldo: arrays y recorrido

```java
double[] notas = {8.5, 9.0, 7.5, 10.0};
double total = 0;

for (double nota : notas) {
    total += nota;
}

double promedio = total / notas.length;
System.out.println("Promedio: " + promedio);
```

{{% note %}}
Material de respaldo: esta diapositiva fue reemplazada por la práctica incremental de fundamentos.
Usarla si se necesita recuperar explícitamente arrays, for-each y cálculo de promedio.
{{% /note %}}
