+++
title = "Semana 7: Lenguaje de Programación - Parte II"
outputs = ["Reveal"]
+++

## Semana 7
Lenguaje de Programación: Parte II

{{% note %}}
En esta séptima semana incursionaremos en las sentencias de control que presenta Python, que permiten abstraer algoritmos o secuencias de instrucciones en un software para lograr su objetivo. Particularmente analizaremos las sentencias condicionales y las repetitivas. Prepárate para explicar cómo estas estructuras permiten crear programas más complejos y dinámicos.
{{% /note %}}

---

## ¿Qué son las Sentencias de Control?
Controlan el flujo de ejecución de un programa.

{{% fragment %}}Se dividen en las sentencias condicionales y las sentencias repetitivas.{{% /fragment %}}

{{% note %}}
Las sentencias de control en Python se usan para controlar el flujo de ejecución de un programa. Estas sentencias determinan cuándo y cómo se ejecuta el código. Explica que sin estas estructuras, los programas serían lineales y limitados en su funcionalidad. Enfatiza la importancia de estas sentencias para crear programas más complejos y útiles.
{{% /note %}}

---

## Tipos de Sentencias de Control
{{% fragment %}}Selección: if-else, switch-case{{% /fragment %}}
{{% fragment %}}Iteración: bucles for y while{{% /fragment %}}

{{% note %}}
Las sentencias de control de Python se dividen en dos categorías principales:
1. Selección: Permiten al programador elegir qué código ejecutar basado en condiciones.
2. Iteración: Permiten repetir un bloque de código varias veces.
Explica cómo estas categorías trabajan juntas para crear programas flexibles y eficientes.
{{% /note %}}

---

## Sentencias de Selección
Permiten seleccionar una parte específica del código a ejecutar.

{{% fragment %}}if-else{{% /fragment %}}
{{% fragment %}}switch-case{{% /fragment %}}

{{% note %}}
Las sentencias de selección permiten al programador ejecutar diferentes partes del código basándose en condiciones específicas. En Python, la estructura if-else es la más común. Aunque Python no tiene una sentencia switch-case nativa, se puede simular con diccionarios o if-elif-else. Proporciona ejemplos simples de cada tipo para ilustrar su uso.
{{% /note %}}

---

## Sentencias de Iteración
Permiten ejecutar una parte específica del código múltiples veces.

{{% fragment %}}Bucles for{{% /fragment %}}
{{% fragment %}}Bucles while{{% /fragment %}}

{{% note %}}
Las sentencias de iteración, o bucles, permiten repetir un bloque de código:
1. Bucles for: Útiles cuando se conoce el número de iteraciones.
2. Bucles while: Se usan cuando la condición de terminación no es conocida de antemano.
Explica las diferencias entre ambos y cuándo es más apropiado usar cada uno.
{{% /note %}}

---

## Bloques de Código
Conjunto de sentencias agrupadas lógicamente.

{{% note %}}
Los bloques de código son fundamentales en Python. Son conjuntos de sentencias que se ejecutan como una unidad. En Python, los bloques se definen por su indentación, lo que hace que la estructura del código sea visualmente clara. Explica cómo los bloques se usan en estructuras de control y funciones.
{{% /note %}}

---

## Indentación en Python
Indica la estructura del código.

{{% note %}}
En Python, la indentación es crucial y obligatoria. A diferencia de otros lenguajes que usan llaves o palabras clave, Python usa la indentación para definir bloques de código. Generalmente, se usan 4 espacios para cada nivel de indentación. Enfatiza que una indentación incorrecta puede llevar a errores de sintaxis o lógica.
{{% /note %}}

---

## Ejemplo de Indentación

```python
if x > 7:
    print("x es mayor que 7")
```

{{% note %}}
En este ejemplo, la línea `print("x es mayor que 7")` está indentada, lo que indica que pertenece al bloque de código del `if`. Si no estuviera indentada, se ejecutaría siempre, independientemente del valor de x. Muestra cómo cambiaría el comportamiento si la línea no estuviera indentada.
{{% /note %}}

---

## Codificación de Texto
Indicación de la codificación de caracteres utilizada en el archivo.

{{% note %}}
La codificación de texto es importante para asegurar que los caracteres especiales se interpreten correctamente. En Python 3, UTF-8 es la codificación por defecto, pero es una buena práctica especificarla explícitamente al principio del archivo. Explica por qué es importante, especialmente cuando se trabaja con diferentes idiomas o sistemas.
{{% /note %}}

---

## Ejemplo de Codificación de Texto

```python
# -*- coding: utf-8 -*-
print("El niño juntó leños")
```

{{% note %}}
Este ejemplo muestra cómo especificar la codificación UTF-8 al inicio de un archivo Python. La línea `# -*- coding: utf-8 -*-` le dice al intérprete de Python que use UTF-8 para leer el archivo. Esto es especialmente útil para asegurar que los caracteres no ASCII (como las tildes y la ñ en español) se interpreten correctamente.
{{% /note %}}

---

## Opciones de Encoding
{{% fragment %}}UTF-8{{% /fragment %}}
{{% fragment %}}ASCII{{% /fragment %}}
{{% fragment %}}Unicode{{% /fragment %}}

{{% note %}}
Existen varias opciones de codificación:
1. UTF-8: Versátil, soporta múltiples idiomas, es la más recomendada.
2. ASCII: Limitada a caracteres en inglés, pero muy eficiente.
3. Unicode: Incluye UTF-8, UTF-16, y UTF-32, soporta todos los caracteres.
Explica las ventajas y desventajas de cada una, y por qué UTF-8 es generalmente la mejor opción para la mayoría de los casos.
{{% /note %}}

---

## Asignación Múltiple
Asignar múltiples variables en una sola instrucción.

```python
a, b, c = 'casa', 244, False
```

{{% note %}}
La asignación múltiple en Python permite inicializar varias variables en una sola línea. En este ejemplo, `a` se asigna a 'casa' (string), `b` a 244 (integer), y `c` a False (boolean). Esta técnica puede hacer el código más conciso, pero debe usarse con cuidado para mantener la legibilidad. Muestra cómo esto sería en múltiples líneas y compara la legibilidad.
{{% /note %}}

---

## Estructuras de Control
{{% fragment %}}Secuenciales{{% /fragment %}}
{{% fragment %}}Selectivas{{% /fragment %}}
{{% fragment %}}Iterativas{{% /fragment %}}

{{% note %}}
Las estructuras de control en programación se dividen en tres tipos:
1. Secuenciales: Ejecución línea por línea.
2. Selectivas: Ejecución basada en condiciones (if-else).
3. Iterativas: Repetición de código (bucles).
Explica cómo estas estructuras se combinan para crear programas complejos y cómo cada una contribuye a la lógica del programa.
{{% /note %}}

---

## Estructuras de Control Condicionales
Permiten tomar decisiones basadas en condiciones.

{{% note %}}
Las estructuras de control condicionales son fundamentales en programación. Permiten que el programa tome diferentes caminos basados en condiciones específicas. Esto hace que los programas sean dinámicos y capaces de responder a diferentes situaciones. Prepara ejemplos de situaciones cotidianas donde se usan decisiones condicionales.
{{% /note %}}

---

## ¿Qué es una Bifurcación?
Instrucción que permite tomar una decisión.

{{% note %}}
Una bifurcación en programación es un punto donde el flujo del programa puede tomar diferentes caminos basados en una condición. Es fundamental para la lógica de programación y se implementa mediante estructuras como if-else. Las bifurcaciones permiten que los programas sean flexibles y capaces de manejar diferentes escenarios. Menciona cómo las bifurcaciones se usan en algoritmos más complejos y en la toma de decisiones en inteligencia artificial.
{{% /note %}}

---

## Ejemplo de Estructura Condicional

```python
if x > 7:
    print("x es mayor que 7")
else:
    print("x es menor o igual que 7")
```

{{% note %}}
Este ejemplo muestra una estructura condicional básica en Python:
- La condición `x > 7` se evalúa primero.
- Si es verdadera, se ejecuta el primer bloque de código.
- Si es falsa, se ejecuta el bloque después de `else`.
Explica cómo esto permite que el programa responda de manera diferente según el valor de x. Proporciona ejemplos de cómo esto podría usarse en una aplicación real.
{{% /note %}}

---

## Operadores Relacionales
Utilizados para comparar dos valores.

{{% note %}}
Los operadores relacionales son cruciales para crear condiciones en estructuras de control. Comparan dos valores y devuelven un resultado booleano (True o False). Estos operadores son la base para tomar decisiones en el código. Explica cómo estos operadores se usan en la vida cotidiana para tomar decisiones.
{{% /note %}}

---

## Tipos de Operadores Relacionales

| Operador | Descripción |
|----------|-------------|
| <        | Menor que   |
| >        | Mayor que   |
| <=       | Menor o igual que |
| >=       | Mayor o igual que |
| ==       | Igual que   |
| !=       | Distinto que |

{{% note %}}
Explica cada operador:
- < y >: Comparan si un valor es estrictamente menor o mayor que otro.
- <= y >=: Incluyen la igualdad en la comparación.
- ==: Comprueba si dos valores son iguales (no confundir con =, que es asignación).
- !=: Comprueba si dos valores son diferentes.
Proporciona ejemplos de uso para cada operador y cómo se utilizan en condiciones reales.
{{% /note %}}

---

## Ejemplo de Operadores Relacionales

```python
a = 10
b = 5

print(a > b)   # True
print(a < b)   # False
print(a == b)  # False
print(a != b)  # True
```

{{% note %}}
Este ejemplo muestra cómo se utilizan los operadores relacionales:
- `a > b` es True porque 10 es mayor que 5.
- `a < b` es False porque 10 no es menor que 5.
- `a == b` es False porque 10 no es igual a 5.
- `a != b` es True porque 10 es diferente de 5.
Explica cómo estos operadores se pueden usar en estructuras condicionales para tomar decisiones en el programa.
{{% /note %}}

---

## Estructuras Selectivas
Sirven para evaluar el valor de una variable o condición establecida.

{{% note %}}
Las estructuras selectivas son la base de la toma de decisiones en programación. Permiten que el programa ejecute diferentes bloques de código basados en condiciones específicas. Esto hace que los programas sean dinámicos y capaces de responder a diferentes situaciones. Prepara ejemplos de cómo estas estructuras se usan en aplicaciones del mundo real.
{{% /note %}}

---

## Clasificación de Estructuras Selectivas
{{% fragment %}}Selectivas simples{{% /fragment %}}
{{% fragment %}}Selectivas dobles{{% /fragment %}}
{{% fragment %}}Selectivas múltiples o anidadas{{% /fragment %}}

{{% note %}}
Explica cada tipo de estructura selectiva:
1. Selectivas simples: Ejecutan un bloque de código si se cumple una condición (if).
2. Selectivas dobles: Ejecutan un bloque si se cumple la condición y otro si no (if-else).
3. Selectivas múltiples o anidadas: Manejan múltiples condiciones o condiciones dentro de otras (if-elif-else, if anidados).
Proporciona ejemplos de situaciones donde cada tipo sería más apropiado.
{{% /note %}}

---

## Ejemplo de Selectiva Simple

```python
x = 10

if x > 5:
    print("x es mayor que 5")
```

{{% note %}}
En este ejemplo de selectiva simple:
- Se evalúa la condición `x > 5`.
- Si es verdadera, se ejecuta el bloque indentado.
- Si es falsa, no se hace nada.
Explica que este tipo de estructura es útil cuando solo necesitamos ejecutar código en caso de que se cumpla una condición, sin necesidad de una alternativa.
{{% /note %}}

---

## Ejemplo de Selectiva Doble

```python
x = 10

if x > 5:
    print("x es mayor que 5")
else:
    print("x es menor o igual que 5")
```

{{% note %}}
En este ejemplo de selectiva doble:
- Se evalúa la condición `x > 5`.
- Si es verdadera, se ejecuta el primer bloque.
- Si es falsa, se ejecuta el bloque después de `else`.
Explica que esta estructura es útil cuando necesitamos manejar dos casos mutuamente excluyentes.
{{% /note %}}

---

## Ejemplo de Selectiva Múltiple/Anidada

```python
x = 10

if x > 10:
    print("x es mayor que 10")
elif x == 10:
    print("x es igual a 10")
else:
    print("x es menor que 10")

if x > 7:
    if x % 2 == 0:
        print("x es mayor que 7 y par")
    else:
        print("x es mayor que 7 e impar")
else:
    print("x es menor o igual que 7")
```

{{% note %}}
Este ejemplo muestra dos tipos de estructuras selectivas múltiples:
1. Usando `elif` para manejar múltiples condiciones.
2. Usando `if` anidados para condiciones más complejas.
Explica cómo estas estructuras permiten manejar casos más complejos y tomar decisiones más específicas. Menciona que aunque son poderosas, el uso excesivo de anidación puede hacer el código difícil de leer.
{{% /note %}}

---

## Estructuras de Control Iterativas
Permiten ejecutar un código repetidamente.

{{% note %}}
Las estructuras de control iterativas, también conocidas como bucles, son fundamentales en programación. Permiten repetir un bloque de código múltiples veces, lo que es esencial para procesar listas de datos, realizar cálculos complejos, o cualquier tarea que requiera repetición. En Python, los dos tipos principales de bucles son 'for' y 'while'. Explica cómo estos bucles pueden hacer que los programas sean más eficientes y poderosos.
{{% /note %}}

---

## Ejemplo de Bucle For

```python
for i in range(5):
    print(i)
```

{{% note %}}
Este ejemplo muestra un bucle 'for' básico en Python:
- `range(5)` genera una secuencia de números del 0 al 4.
- El bucle se ejecuta 5 veces, con 'i' tomando cada valor en la secuencia.
- En cada iteración, se imprime el valor actual de 'i'.
Explica cómo este tipo de bucle es útil cuando se conoce de antemano el número de iteraciones. Proporciona ejemplos de uso real, como procesar una lista de elementos.
{{% /note %}}

---

## Solución 3: Factorial con While Loop

```python
def factorial(n):
    result = 1
    while n > 0:
        result *= n
        n -= 1
    return result

numero = 5
print(f"El factorial de {numero} es {factorial(numero)}")
```

{{% note %}}
Este programa calcula el factorial de un número usando un bucle while:
- Inicializamos 'result' en 1 (el factorial de 0 es 1).
- Mientras n sea mayor que 0, multiplicamos 'result' por n y decrementamos n.
- El bucle continúa hasta que n llega a 0.
- Finalmente, retornamos el resultado.
Explica cómo este método es una implementación iterativa del cálculo factorial, en contraste con una implementación recursiva.
{{% /note %}}

---

## Ejemplo de Bucle While

```python
i = 0
while i < 5:
    print(i)
    i += 1
```

{{% note %}}
Este ejemplo ilustra un bucle 'while' en Python:
- La condición `i < 5` se evalúa antes de cada iteración.
- El bucle continúa mientras la condición sea verdadera.
- `i += 1` incrementa 'i' en cada iteración para evitar un bucle infinito.
Explica que los bucles 'while' son útiles cuando no se conoce de antemano el número de iteraciones. Advierte sobre la importancia de asegurar que la condición eventualmente se vuelva falsa para evitar bucles infinitos.
{{% /note %}}

---

### Ejercicio con While

- Migrar el código de factorial usando While.

---

## Sentencias Break y Continue
Controlan el flujo de los bucles.

{{% note %}}
Las sentencias 'break' y 'continue' son herramientas poderosas para controlar el flujo dentro de los bucles:
- 'break' termina el bucle inmediatamente.
- 'continue' salta al inicio de la siguiente iteración.
Estas sentencias permiten un control más fino sobre la ejecución del bucle, permitiendo salir temprano o saltar iteraciones basadas en condiciones específicas.
{{% /note %}}

---

## Ejemplo de Sentencia Break

```python
for i in range(10):
    if i == 5:
        break
    print(i)
```

{{% note %}}
En este ejemplo:
- El bucle está configurado para iterar de 0 a 9.
- Cuando 'i' llega a 5, la sentencia 'break' se ejecuta.
- El bucle termina inmediatamente, sin completar las iteraciones restantes.
- La salida será: 0, 1, 2, 3, 4
Explica cómo 'break' es útil para salir de un bucle cuando se cumple una cierta condición, como encontrar un elemento específico en una lista.
{{% /note %}}

---

## Ejemplo de Sentencia Continue

```python
for i in range(10):
    if i % 2 == 0:
        continue
    print(i)
```

{{% note %}}
En este ejemplo:
- El bucle itera de 0 a 9.
- Para números pares (cuando i % 2 == 0), 'continue' salta al inicio de la siguiente iteración.
- Solo se imprimen los números impares: 1, 3, 5, 7, 9
Explica cómo 'continue' es útil para saltar ciertas iteraciones basadas en una condición, sin terminar el bucle por completo.
{{% /note %}}

---

## Ejemplo de otra salida abrupta de un bucle con return

```python
def es_primo(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

def primer_primo_mayor(n):
    num = n + 1
    while True:
        if es_primo(num):
            return num
        num += 1

print(primer_primo_mayor(20))
```

{{% note %}}
Este programa encuentra el primer número primo mayor que un número dado:
- La función 'es_primo' verifica si un número es primo.
- 'primer_primo_mayor' usa un bucle while para buscar el próximo primo.
- El bucle for dentro de 'es_primo' usa break implícitamente al retornar False.
Explica cómo este enfoque es eficiente al usar la raíz cuadrada como límite en 'es_primo'.
{{% /note %}}

---

## Bucles Anidados
Bucles dentro de bucles.

{{% note %}}
Los bucles anidados son bucles que se encuentran dentro de otros bucles. Son poderosos para trabajar con estructuras de datos multidimensionales o para realizar operaciones complejas que requieren múltiples niveles de iteración. Sin embargo, pueden ser computacionalmente costosos si no se usan con cuidado, ya que el número total de iteraciones es el producto de las iteraciones de cada bucle.
{{% /note %}}

---

## Ejemplo de Bucle Anidado

```python
for i in range(3):
    for j in range(3):
        print(i, j)
```

{{% note %}}
Este ejemplo muestra un bucle 'for' anidado:
- El bucle externo (i) se ejecuta 3 veces.
- Para cada iteración del bucle externo, el bucle interno (j) se ejecuta 3 veces.
- Se imprime cada combinación de i y j.
- La salida será: (0,0), (0,1), (0,2), (1,0), (1,1), (1,2), (2,0), (2,1), (2,2)
Explica cómo esto puede ser útil para trabajar con matrices o para generar todas las combinaciones posibles de dos conjuntos de elementos.
{{% /note %}}

---

## floop
Un bucle que se resulta útil para filtrar valores en una secuencia.

```python
for i in range(7):
    if i%2 != 0:
        print(i)
```

1, 3, 5

{{% note %}}
Este ejemplo muestra un patrón común en Python, a veces llamado "floop" (filtered loop):
- El bucle itera sobre un rango de 0 a 6.
- La condición `i%2 != 0` filtra los números impares.
- Solo se imprimen los números que cumplen la condición: 1, 3, 5
Explica cómo este patrón es útil para filtrar elementos de una secuencia basándose en una condición. Menciona que en Python moderno, esto a menudo se puede hacer de manera más concisa usando comprensiones de lista o la función filter().
{{% /note %}}

---

## Comprensiones de Lista
Una forma concisa de crear listas basadas en existentes.

```python
squares = [x**2 for x in range(10)]
print(squares)
```

{{% note %}}
Las comprensiones de lista son una característica poderosa de Python que permite crear nuevas listas de manera concisa:
- Este ejemplo crea una lista de los cuadrados de los números del 0 al 9.
- La sintaxis `[x**2 for x in range(10)]` es equivalente a un bucle for que crea una lista.
- Es más conciso y a menudo más eficiente que un bucle tradicional.
Explica cómo las comprensiones de lista pueden hacer el código más legible y eficiente, pero advierte que no deben usarse en exceso si comprometen la claridad.
{{% /note %}}

---

## Funciones map() y filter()
Funciones de orden superior para procesamiento de secuencias.

```python
# map()
squares = list(map(lambda x: x**2, range(10)))

# filter()
odds = list(filter(lambda x: x%2 != 0, range(10)))
```

{{% note %}}
`map()` y `filter()` son funciones de orden superior útiles para procesamiento de secuencias:
- `map()` aplica una función a cada elemento de una secuencia.
- `filter()` crea una nueva secuencia con elementos que cumplen una condición.
- Ambas funciones son útiles en programación funcional y pueden hacer el código más declarativo.
Explica cómo estas funciones pueden ser alternativas a los bucles tradicionales en ciertos casos, y cómo se relacionan con las comprensiones de lista.
{{% /note %}}

---

## Filtrar palabras largas

```python
def palabras_largas(lista):
    return list(filter(lambda x: len(x) > 5, lista))

palabras = ["casa", "elefante", "sol", "computadora", "luz", "teléfono"]
print(palabras_largas(palabras))
```

{{% note %}}
Esta solución usa filter() para encontrar palabras con más de 5 caracteres:
- La función lambda 'lambda x: len(x) > 5' es el criterio de filtrado.
- filter() aplica esta función a cada elemento de la lista 'palabras'.
- Convertimos el resultado de filter() a una lista para imprimirlo.
Explica cómo filter() es una alternativa concisa a un bucle for con una condición if.
{{% /note %}}

---

## Manejo de Excepciones
Gestionan errores durante la ejecución del programa.

```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error: División por cero")
finally:
    print("Esta línea siempre se ejecuta")
```

{{% note %}}
El manejo de excepciones es crucial para crear programas robustos:
- El bloque `try` contiene el código que puede generar una excepción.
- El bloque `except` maneja la excepción si ocurre.
- El bloque `finally` se ejecuta siempre, ocurra o no una excepción.
Explica cómo el manejo de excepciones permite que los programas respondan graciosamente a errores en lugar de fallar abruptamente. Menciona que Python tiene muchos tipos de excepciones incorporadas y que también se pueden crear excepciones personalizadas.
{{% /note %}}

---

## Generadores
Funciones que generan una secuencia de valores sobre tiempo.

```python
def countdown(n):
    while n > 0:
        yield n
        n -= 1

for i in countdown(5):
    print(i)
```

{{% note %}}
Los generadores son una poderosa característica de Python:
- Se definen como funciones, pero usan `yield` en lugar de `return`.
- Generan valores uno a la vez, bajo demanda, en lugar de crear toda la secuencia en memoria.
- Son útiles para trabajar con grandes conjuntos de datos o secuencias infinitas.
En este ejemplo, `countdown(5)` genera los números 5, 4, 3, 2, 1 uno a la vez. Explica cómo los generadores pueden ser más eficientes en memoria que las listas para grandes conjuntos de datos.
{{% /note %}}

---

## Generador de Fibonacci

```python
def fibonacci_generator(n):
    a, b = 0, 1
    count = 0
    while count < n:
        yield a
        a, b = b, a + b
        count += 1

for num in fibonacci_generator(10):
    print(num, end=" ")
```

{{% note %}}
Este generador produce la secuencia de Fibonacci:
- Usamos dos variables, 'a' y 'b', para mantener los dos últimos números.
- En cada iteración, yield devuelve 'a' y actualiza 'a' y 'b'.
- El generador se detiene después de producir 'n' números.
- El bucle for imprime los primeros 10 números de Fibonacci.
Explica cómo los generadores son eficientes en memoria, especialmente para secuencias largas o infinitas.
{{% /note %}}


---

## Decoradores
Modifican o mejoran funciones existentes sin cambiar su código.

```python
def uppercase_decorator(function):
    def wrapper():
        result = function()
        return result.upper()
    return wrapper

@uppercase_decorator
def greet():
    return "hello, world!"

print(greet())  # HELLO, WORLD!
```

{{% note %}}
Los decoradores son una característica avanzada de Python:
- Permiten modificar o extender el comportamiento de funciones o clases sin modificar su código.
- Se definen como funciones que toman una función como argumento y devuelven una nueva función.
- Se aplican usando la sintaxis `@` sobre la definición de una función.
En este ejemplo, `uppercase_decorator` modifica la función `greet` para que su resultado esté en mayúsculas. Explica cómo los decoradores son útiles para aspectos como logging, medición de rendimiento, o control de acceso.
{{% /note %}}

---

## Decorador de Precio de Café

```python
def cafe_base():
    return 5  # Precio base del café

def agregar_leche(func):
    def wrapper():
        return func() + 1  # Leche cuesta 1 adicional
    return wrapper

def agregar_cacao(func):
    def wrapper():
        return func() + 2  # Cacao cuesta 2 adicional
    return wrapper

def agregar_caramelo(func):
    def wrapper():
        return func() + 1.5  # Caramelo cuesta 1.5 adicional
    return wrapper

@agregar_caramelo
@agregar_cacao
@agregar_leche
def cafe_especial():
    return cafe_base()

print(f"El precio del café especial es: ${cafe_especial()}")
```

{{% note %}}
Este ejemplo usa decoradores para calcular el precio de un café con extras:
- cafe_base() establece el precio base del café.
- Cada decorador (leche, cacao, caramelo) añade un costo adicional.
- Los decoradores se aplican de abajo hacia arriba: primero leche, luego cacao, y finalmente caramelo.
- cafe_especial() retorna el precio total del café con todos los extras.
Explica cómo los decoradores permiten modificar el comportamiento de funciones de manera flexible y reutilizable.
{{% /note %}}

---

## ¿Preguntas?


