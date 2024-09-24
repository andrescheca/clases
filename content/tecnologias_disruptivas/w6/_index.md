+++
title = "UEES - Tecnologías Disruptivas"
outputs = ["Reveal"]
+++

## Semana 6
Lenguaje de Programación

{{% note %}}
En esta sexta semana desarrollaremos una visión general de los tipos de datos, variables y operadores que presenta el lenguaje Python. También analizaremos sentencias de programación sencillas. Prepárate para introducir conceptos fundamentales de programación y explicar por qué Python es una excelente elección para comenzar.
{{% /note %}}

---

## ¿Qué es un Programa?
Conjunto de instrucciones que realiza una tarea específica.

{{% note %}}
Un programa de computadora es una serie de instrucciones escritas en un lenguaje de programación que, al ejecutarse, realiza una tarea específica. Enfatiza que los programas son la base de todo el software que utilizamos diariamente, desde aplicaciones móviles hasta sistemas operativos complejos.
{{% /note %}}

---

## ¿Qué es la Programación?
Proceso de creación de instrucciones informáticas ejecutables por una computadora.

{{% note %}}
La programación es el proceso de crear instrucciones que una computadora puede ejecutar. Es la base de la ingeniería del software y la informática. Destaca que la programación requiere tanto creatividad como pensamiento lógico para resolver problemas de manera eficiente.
{{% /note %}}

---

## Proceso de Programación
{{% fragment %}}Escritura del código{{% /fragment %}}
{{% fragment %}}Compilación del código{{% /fragment %}}
{{% fragment %}}Ejecución del código{{% /fragment %}}

{{% note %}}
El proceso de programación se divide en tres pasos principales:
1. Escritura del código: Crear las instrucciones en un lenguaje de programación específico.
2. Compilación del código: Traducir el código a un lenguaje que la computadora pueda entender directamente.
3. Ejecución del código: Correr el programa para obtener los resultados deseados.
Explica que algunos lenguajes, como Python, son interpretados y no requieren un paso de compilación separado.
{{% /note %}}

---

## Tipos de Lenguajes de Programación
{{% fragment %}}Python{{% /fragment %}}
{{% fragment %}}Java{{% /fragment %}}
{{% fragment %}}C++{{% /fragment %}}
{{% fragment %}}JavaScript{{% /fragment %}}
{{% fragment %}}SQL{{% /fragment %}}
{{% fragment %}}PHP{{% /fragment %}}

{{% note %}}
Existen numerosos lenguajes de programación, cada uno con sus propias características y usos:
- Python: Versátil, fácil de aprender, usado en desarrollo web, ciencia de datos, IA.
- Java: Muy utilizado en aplicaciones empresariales y Android.
- C++: Eficiente, usado en desarrollo de sistemas y videojuegos.
- JavaScript: Esencial para desarrollo web front-end y ahora también back-end.
- SQL: Especializado en manejo de bases de datos relacionales.
- PHP: Principalmente usado para desarrollo web del lado del servidor.
Menciona que la elección del lenguaje depende del proyecto y las necesidades específicas.
{{% /note %}}

---

## Componentes de una Sentencia Simple
Una línea de código que contiene instrucciones para que la computadora las ejecute.

{{% note %}}
Una sentencia simple es la unidad básica de instrucción en programación. En su forma más básica, es una línea de código que la computadora puede ejecutar. Explica que las sentencias simples son los bloques de construcción de programas más complejos y que entenderlas es fundamental para aprender a programar.
{{% /note %}}

---

## Elementos de una Sentencia Simple
{{% fragment %}}Palabra clave o palabra reservada{{% /fragment %}}
{{% fragment %}}Tipo de dato{{% /fragment %}}
{{% fragment %}}Variable o constante{{% /fragment %}}
{{% fragment %}}Operador{{% /fragment %}}

{{% note %}}
Los elementos clave de una sentencia simple son:
1. Palabra clave o reservada: Términos con significado especial en el lenguaje (ej. "if", "for").
2. Tipo de dato: Categoría de información (ej. int, float, string).
3. Variable o constante: Espacio de memoria nombrado para almacenar datos.
4. Operador: Símbolo que realiza operaciones en variables o constantes.
Proporciona ejemplos de cada uno para clarificar estos conceptos.
{{% /note %}}

---

## Palabra Clave o Reservada
Una palabra con un significado especial en un lenguaje de programación.

{{% note %}}
Las palabras clave o reservadas son términos predefinidos en un lenguaje de programación que tienen un significado y uso específicos. No pueden usarse como nombres de variables o funciones. Ejemplos en Python incluyen "if", "for", "while", "def", "class". Explica que conocer estas palabras es crucial para escribir código válido y entender la estructura del lenguaje.
{{% /note %}}

---

## Tipo de Dato
Una categoría de datos que puede almacenarse en una variable o constante.

{{% note %}}
Los tipos de datos definen qué clase de información puede almacenar una variable. Los tipos básicos incluyen:
- Enteros (int): Números sin decimales.
- Flotantes (float): Números con decimales.
- Cadenas (str): Texto.
- Booleanos (bool): Verdadero o falso.
Menciona que Python tiene tipos de datos más complejos como listas, tuplas y diccionarios, que se verán más adelante.
{{% /note %}}

---

## Variable o Constante
Porción de memoria con nombre utilizada para almacenar datos.

{{% note %}}
Las variables son espacios de memoria nombrados que almacenan datos que pueden cambiar durante la ejecución del programa. Las constantes son similares, pero su valor no cambia. En Python, por convención, las constantes se escriben en mayúsculas. Ejemplo de variable: `x = 5`. Ejemplo de constante: `PI = 3.14159`. Enfatiza la importancia de elegir nombres descriptivos para las variables.
{{% /note %}}

---

## Ejemplos

```python
PI = 3.14
MAX_SPEED = 300
DEFAULT_COLOR = "#336699"
WIDTH = 20
API_TOKEN = "593086396372"
BASE_URL = "https://api.example.com"
DEFAULT_TIMEOUT = 5
```

{{% note %}}
Estos ejemplos muestran diferentes tipos de variables y constantes:
- PI: Constante numérica (float)
- MAX_SPEED: Constante numérica (int)
- DEFAULT_COLOR: Constante de cadena (str) representando un color hexadecimal
- WIDTH: Variable numérica (int)
- API_TOKEN: Constante de cadena (str)
- BASE_URL: Constante de cadena (str) para una URL
- DEFAULT_TIMEOUT: Constante numérica (int) para un tiempo de espera
Explica cómo cada nombre describe claramente su propósito, lo cual es una buena práctica en programación.
{{% /note %}}

---

## Operador
Un símbolo utilizado para realizar una operación en una o más variables o constantes.

```
+ - * / ^ = & |  < <= > >= != == and or
```

{{% note %}}
Los operadores son símbolos que realizan operaciones específicas:
- Aritméticos: +, -, *, / (suma, resta, multiplicación, división)
- Comparación: <, <=, >, >=, ==, != (menor que, menor o igual, mayor que, mayor o igual, igual a, no igual a)
- Lógicos: and, or, not (y, o, no)
- Asignación: = (asigna un valor a una variable)
Explica que entender los operadores es crucial para realizar cálculos y tomar decisiones en programación.
{{% /note %}}

---

## Ejemplo de Sentencia Simple

```c
int x = 55;
```

{{% note %}}
En esta sentencia:
- "int" es una palabra reservada que declara una variable de tipo entero.
- "x" es el nombre de la variable.
- "=" es el operador de asignación.
- "55" es el valor asignado a la variable.
- ";" marca el fin de la sentencia (en C, no necesario en Python).
Destaca que esta simple línea combina varios conceptos: tipo de dato, variable, operador y valor.
{{% /note %}}

---

## Operador Lógico AND
Realiza la operación lógica "Y" entre dos elementos.

{{% note %}}
El operador lógico AND (&&, and) devuelve verdadero solo si ambas condiciones son verdaderas. Es útil para combinar múltiples condiciones en estructuras de control como if. En Python, se escribe como "and". Ejemplo: `if (x > 0 and x < 10):` verifica si x está entre 0 y 10.
{{% /note %}}

---

## Tabla de Verdad del Operador AND

| Valor 1 | Valor 2 | Resultado |
|---------|---------|-----------|
| True    | True    | True      |
| True    | False   | False     |
| False   | True    | False     |
| False   | False   | False     |

{{% note %}}
La tabla de verdad del AND muestra todos los posibles resultados:
- True AND True = True: Ambas condiciones son verdaderas.
- True AND False = False: Una condición es falsa.
- False AND True = False: Una condición es falsa.
- False AND False = False: Ambas condiciones son falsas.
Enfatiza que AND solo devuelve True cuando ambas condiciones son verdaderas.
{{% /note %}}

---

## Operador Lógico OR
Realiza la operación lógica "O" entre dos elementos.

{{% note %}}
El operador lógico OR (||, or) devuelve verdadero si al menos una de las condiciones es verdadera. Es útil cuando queremos que una acción se realice si se cumple cualquiera de varias condiciones. En Python, se escribe como "or". Ejemplo: `if (x < 0 or x > 100):` verifica si x está fuera del rango 0-100.
{{% /note %}}

---

## Tabla de Verdad del Operador OR

| Valor 1 | Valor 2 | Resultado |
|---------|---------|-----------|
| True    | True    | True      |
| True    | False   | True      |
| False   | True    | True      |
| False   | False   | False     |

{{% note %}}
La tabla de verdad del OR muestra todos los posibles resultados:
- True OR True = True: Al menos una condición es verdadera.
- True OR False = True: Al menos una condición es verdadera.
- False OR True = True: Al menos una condición es verdadera.
- False OR False = False: Ninguna condición es verdadera.
Resalta que OR devuelve True si al menos una de las condiciones es verdadera.
{{% /note %}}

---

## Depuración de Código
Proceso de encontrar y corregir errores en un programa.

{{% fragment %}}Errores de sintaxis{{% /fragment %}}
{{% fragment %}}Errores lógicos{{% /fragment %}}
{{% fragment %}}Errores semánticos{{% /fragment %}}

{{% note %}}
La depuración es un proceso crucial en programación:
1. Errores de sintaxis: Violaciones de las reglas del lenguaje (ej. olvidar cerrar paréntesis).
2. Errores lógicos: El código no produce el resultado esperado (ej. usar < en lugar de >).
3. Errores semánticos: El código no tiene el significado pretendido (ej. usar la variable incorrecta).
Explica que la práctica y el uso de herramientas de depuración ayudan a identificar y corregir estos errores más rápidamente.
{{% /note %}}

---

## Cómo Solucionar Errores
{{% fragment %}}Palabras clave mal escritas o palabras reservadas{{% /fragment %}}
{{% fragment %}}Tipos de datos incorrectos{{% /fragment %}}
{{% fragment %}}Nombres incorrectos de variables o constantes{{% /fragment %}}
{{% fragment %}}Operador incorrecto{{% /fragment %}}
{{% fragment %}}Punto y coma incorrecto{{% /fragment %}}

{{% note %}}
Para solucionar errores, revisa:
1. Ortografía de palabras clave y uso correcto de palabras reservadas.
2. Uso de tipos de datos apropiados para cada variable.
3. Consistencia en nombres de variables y constantes.
4. Uso correcto de operadores para la operación deseada.
5. Uso adecuado de puntuación (ej. punto y coma en lenguajes que lo requieren).
Recomienda usar un IDE con resaltado de sintaxis y herramientas de depuración para facilitar la detección de errores.
{{% /note %}}

---

## ¿Por qué Python?
Potente, fácil de usar y eficiente.

{{% note %}}
Python es una excelente elección para principiantes y profesionales por varias razones:
1. Sintaxis clara y legible, similar al inglés.
2. Versatilidad: útil en web, ciencia de datos, IA, automatización, etc.
3. Gran comunidad y amplia biblioteca de paquetes.
4. Curva de aprendizaje suave pero potente para tareas avanzadas.
5. Interpretado, lo que facilita la experimentación y depuración.
Menciona que estas características hacen que Python sea ideal para aprender conceptos de programación.
{{% /note %}}

---

## Tipos de Datos en Python
{{% fragment %}}Numéricos: int, float, complex{{% /fragment %}}
{{% fragment %}}Cadena de texto: str{{% /fragment %}}
{{% fragment %}}Booleanos: bool{{% /fragment %}}
{{% fragment %}}Listas: list{{% /fragment %}}
{{% fragment %}}Tuplas: tuple{{% /fragment %}}
{{% fragment %}}Diccionarios: dict{{% /fragment %}}

{{% note %}}
Python tiene varios tipos de datos incorporados:
1. Numéricos: int (enteros), float (decimales), complex (complejos)
2. str: Cadenas de texto
3. bool: Valores booleanos (True/False)
4. list: Colecciones ordenadas y mutables
5. tuple: Colecciones ordenadas e inmutables
6. dict: Colecciones de pares clave-valor
Explica brevemente cada tipo y proporciona ejemplos simples de su uso.
{{% /note %}}

---

## Variables en Python
Nombres simbólicos que representan valores de datos almacenados.

{{% note %}}
En Python, las variables son nombres que se refieren a valores en memoria:
- No requieren declaración de tipo explícita (tipado dinámico).
- Se crean al asignarles un valor: `x = 5`
- Pueden cambiar de tipo durante la ejecución: `x = "hola"`
- Usan convención snake_case: `mi_variable = 10`
Enfatiza la flexibilidad de las variables en Python y la importancia de nombres descriptivos.
{{% /note %}}

---

## Ejemplos de Variables

```python
a = 5
b = 8.0
nombre = "Catalina"
m = 7
n = m
lista = [a, b, nombre, m, n]
# lista = [5, 8.0, "Catalina", 7, 7]
```

{{% note %}}
Explica cada ejemplo:
- `a = 5`: Variable entera
- `b = 8.0`: Variable de punto flotante
- `nombre = "Catalina"`: Variable de cadena
- `m = 7` y `n = m`: Asignación de valor de una variable a otra
- `lista = [a, b, nombre, m, n]`: Lista que contiene diferentes tipos de datos
Destaca cómo Python permite mezclar diferentes tipos de datos en una lista.
{{% /note %}}

---

## Sentencias Simples en Python
Una línea de código en un lenguaje de programación.

{{% note %}}
Una sentencia simple en Python es una instrucción única que el intérprete puede ejecutar. Puede ser una asignación, una llamada a función, o una expresión. A diferencia de otros lenguajes, Python no requiere punto y coma al final de las sentencias. Enfatiza la simplicidad y legibilidad del código Python.
{{% /note %}}

---

## Ejemplo de Sentencia Simple en Python

```python
print("Buenos días")
```

{{% note %}}
Esta sentencia simple llama a la función `print()` para mostrar el mensaje "Buenos días" en la consola. Explica que `print()` es una función incorporada en Python para mostrar salida. Puedes usar este ejemplo para introducir el concepto de funciones y argumentos de función.
{{% /note %}}

---

## Tipos de Sentencias de Programación
{{% fragment %}}Sentencias de asignación{{% /fragment %}}
{{% fragment %}}Sentencias de control{{% /fragment %}}
{{% fragment %}}Sentencias de función{{% /fragment %}}
{{% fragment %}}Sentencias de bucle{{% /fragment %}}

{{% note %}}
Existen varios tipos de sentencias en programación:
1. Sentencias de asignación: Asignan valores a variables (ej. `x = 5`)
2. Sentencias de control: Controlan el flujo del programa (ej. `if`, `else`)
3. Sentencias de función: Definen o llaman funciones (ej. `def mi_funcion():`)
4. Sentencias de bucle: Repiten un bloque de código (ej. `for`, `while`)
Explica que cada tipo de sentencia tiene un propósito específico en la construcción de programas.
{{% /note %}}

---

## Ejemplos de Sentencias

```python
# Asignación
x = 10

# Control
if x > 5:
    print("x es mayor que 5")

# Función
def saludar(nombre):
    print(f"Hola, {nombre}!")

# Bucle
for i in range(5):
    print(i)
```

{{% note %}}
Explica cada ejemplo:
- Asignación: Asigna el valor 10 a la variable x.
- Control: Verifica si x es mayor que 5 y ejecuta el código indentado si es verdadero.
- Función: Define una función llamada saludar que toma un parámetro nombre.
- Bucle: Imprime los números del 0 al 4.
Destaca cómo estas sentencias se combinan para crear programas más complejos.
{{% /note %}}

---

## Ventajas de Python
{{% fragment %}}Lenguaje expresivo{{% /fragment %}}
{{% fragment %}}Legible y fácil de escribir{{% /fragment %}}
{{% fragment %}}Detecta y corrige errores fácilmente{{% /fragment %}}
{{% fragment %}}Admite múltiples paradigmas{{% /fragment %}}

{{% note %}}
Python ofrece varias ventajas:
1. Expresividad: Permite escribir código conciso y claro.
2. Legibilidad: Su sintaxis se asemeja al inglés, facilitando su comprensión.
3. Manejo de errores: Proporciona mensajes de error claros y útiles.
4. Versatilidad: Soporta programación procedural, orientada a objetos y funcional.
Estas características hacen que Python sea ideal tanto para principiantes como para proyectos complejos.
{{% /note %}}

---

## Aplicaciones de Python
{{% fragment %}}Desarrollo web{{% /fragment %}}
{{% fragment %}}Análisis de datos{{% /fragment %}}
{{% fragment %}}Inteligencia artificial{{% /fragment %}}
{{% fragment %}}Automatización{{% /fragment %}}
{{% fragment %}}Scripting{{% /fragment %}}

{{% note %}}
Python se utiliza en diversos campos:
1. Desarrollo web: Frameworks como Django y Flask.
2. Análisis de datos: Bibliotecas como Pandas y NumPy.
3. Inteligencia artificial: TensorFlow, PyTorch para machine learning.
4. Automatización: Scripts para tareas repetitivas.
5. Scripting: Integración de sistemas y herramientas.
Destaca la versatilidad de Python y cómo sus librerías extensas lo hacen útil en muchas áreas.
{{% /note %}}

---

## Próximos Pasos
{{% fragment %}}Instalar Python{{% /fragment %}}
{{% fragment %}}Explorar el intérprete interactivo{{% /fragment %}}
{{% fragment %}}Escribir y ejecutar scripts simples{{% /fragment %}}
{{% fragment %}}Practicar con ejercicios básicos{{% /fragment %}}

{{% note %}}
Para comenzar con Python:
1. Instalar Python: Visitar python.org y descargar la última versión estable.
2. Usar el intérprete: Abrir la consola de Python para experimentar con comandos.
3. Escribir scripts: Crear archivos .py y ejecutarlos desde la línea de comandos.
4. Practicar: Resolver problemas simples para reforzar lo aprendido.
Anima a los estudiantes a experimentar y no temer cometer errores, ya que son parte del proceso de aprendizaje.
{{% /note %}}

---

## Recursos Adicionales
{{% fragment %}}Documentación oficial de Python{{% /fragment %}}
{{% fragment %}}Tutoriales en línea (ej. Codecademy, Real Python){{% /fragment %}}
{{% fragment %}}Libros para principiantes{{% /fragment %}}
{{% fragment %}}Comunidades en línea (ej. Stack Overflow, Reddit r/learnpython){{% /fragment %}}

{{% note %}}
Proporciona recursos para que los estudiantes continúen su aprendizaje:
1. Documentación oficial: python.org/doc para referencia detallada.
2. Tutoriales en línea: Plataformas interactivas para practicar.
3. Libros: Recomienda algunos títulos para principiantes.
4. Comunidades: Lugares donde pueden hacer preguntas y obtener ayuda.
Anima a los estudiantes a explorar estos recursos y a mantener una práctica constante.
{{% /note %}}

---

## Calculadora simple

```python

print("Calculadora Simple")

# Obtener números del usuario
num1 = float(input("Ingresa el primer número: "))
num2 = float(input("Ingresa el segundo número: "))

# Realizar operaciones
suma = num1 + num2
resta = num1 - num2
multiplicacion = num1 * num2

# Imprimir resultados
print(f"Suma: {suma}")
print(f"Resta: {resta}")
print(f"Multiplicación: {multiplicacion}")

# División (con manejo básico de error)
if num2 != 0:
    division = num1 / num2
    print(f"División: {division}")
else:
    print("No se puede dividir por cero")
```

---

## Convertidor de temperatura

```python
print("Conversor de Temperatura")

# Obtener temperatura en Celsius del usuario
celsius = float(input("Ingresa la temperatura en Celsius: "))

# Convertir a Fahrenheit
fahrenheit = (celsius * 9/5) + 32

# Imprimir resultado
print(f"{celsius} grados Celsius es igual a {fahrenheit} grados Fahrenheit")

# Convertir de Fahrenheit a Celsius
fahrenheit_input = float(input("Ahora ingresa una temperatura en Fahrenheit: "))
celsius_resultado = (fahrenheit_input - 32) * 5/9

# Imprimir resultado
print(f"{fahrenheit_input} grados Fahrenheit es igual a {celsius_resultado} grados Celsius")
```

---

## Más ejercicios para practicar

- ¿Es primo un número ingresado por teclado?
- Convertir una cantidad de segundos ingresada a horas, minutos y segundos.
- Imprimir todos los números del 1 al 100 que sean múltiplos de un número dado (ingreado por teclado).
- Solicitar al usuario su edad y determinar si es menor de edad, adulto o adulto mayor.
- Realizar un convertidor de monedas que transforme de dólares a euros, yenes u otra moneda.

--- 

## ¿Preguntas?

