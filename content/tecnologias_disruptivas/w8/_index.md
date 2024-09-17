+++
title = "Semana 8: Lenguaje de Programación - Parte III"
outputs = ["Reveal"]
+++

## Semana 8
Lenguaje de Programación: Parte III

{{% note %}}
En esta semana, exploraremos los fundamentos de las funciones en Python, cómo definirlas y cómo llamarlas. Las funciones permiten escribir código de manera concisa y organizada, facilitando la reutilización en múltiples aplicaciones. Prepárate para explicar cómo las funciones son una herramienta fundamental para estructurar y modularizar el código Python.
{{% /note %}}

---

## ¿Qué es una Función Python?
Un bloque de código que realiza una tarea específica y puede ser reutilizado en otras partes de un programa.

{{% note %}}
Las funciones son esenciales en Python porque facilitan la escritura de código organizado, eficiente y fácil de leer. También facilitan la depuración, ya que se puede probar una función a la vez en lugar de todo el programa. Enfatiza cómo las funciones promueven el principio DRY (Don't Repeat Yourself) en programación.
{{% /note %}}

---

## Características de una Función
{{% fragment %}}Realizan una actividad específica{{% /fragment %}}
{{% fragment %}}Pueden devolver un resultado{{% /fragment %}}
{{% fragment %}}Se identifican con un nombre{{% /fragment %}}
{{% fragment %}}Admiten diversos parámetros{{% /fragment %}}

{{% note %}}
Las funciones pueden tener parámetros y pueden devolver resultados. Sin embargo, también pueden existir funciones sin parámetros que no devuelvan resultados. Explica cada característica:
1. Actividad específica: Una función debe tener un propósito claro y bien definido.
2. Retorno de resultado: Aunque no es obligatorio, muchas funciones devuelven un valor.
3. Identificación por nombre: El nombre de la función debe ser descriptivo de su propósito.
4. Parámetros: Permiten que la función sea más flexible y reutilizable.
{{% /note %}}

---

## Ventajas de las Funciones en Python
{{% fragment %}}Reusabilidad{{% /fragment %}}
{{% fragment %}}Modularidad{{% /fragment %}}
{{% fragment %}}Facilidad de lectura{{% /fragment %}}
{{% fragment %}}Flexibilidad{{% /fragment %}}
{{% fragment %}}Funciones lambda{{% /fragment %}}

{{% note %}}
Las funciones en Python ofrecen numerosas ventajas:
1. Reusabilidad: Escribir código una vez y usarlo muchas veces.
2. Modularidad: Dividir el programa en partes más pequeñas y manejables.
3. Facilidad de lectura: El código se vuelve más organizado y comprensible.
4. Flexibilidad: Las funciones pueden adaptarse a diferentes situaciones mediante parámetros.
5. Funciones lambda: Permiten crear funciones anónimas para tareas simples.
Explica cómo estas ventajas contribuyen a un código más eficiente y mantenible.
{{% /note %}}

---

## ¿Cómo Definir una Función en Python?

```python
def nombre(param1, param2):
    # bloque de instrucciones
    return valor
```

{{% note %}}
La palabra clave "def" se usa para definir una función en Python. Explica cada parte de la definición:
- "def" indica el inicio de la definición de la función.
- "nombre" es el identificador de la función.
- "param1, param2" son los parámetros (pueden ser ninguno, uno o varios).
- El bloque de instrucciones está indentado.
- "return" (opcional) especifica el valor que la función devuelve.
Menciona que el cuerpo de la función debe estar indentado, generalmente con 4 espacios.
{{% /note %}}

---

## Ejemplo de una Función Simple

```python
def saludo():
    print("Buenos días")
```

{{% note %}}
Este ejemplo muestra una función simple llamada "saludo" que imprime "Buenos días". Puntos a destacar:
- No tiene parámetros (los paréntesis están vacíos).
- No devuelve ningún valor explícitamente (no hay declaración 'return').
- Su único propósito es imprimir un mensaje.
Explica cómo se llamaría esta función (saludo()) y qué sucedería cuando se llama.
{{% /note %}}

---

## Funciones con Parámetros

```python
def saludo_personalizado(nombre):
    print("Buen día " + nombre)

saludo_personalizado("Clara")
```

{{% note %}}
Este ejemplo muestra una función con un parámetro:
- "nombre" es el parámetro que la función espera recibir.
- La función usa este parámetro para personalizar el mensaje.
- Se llama a la función con el argumento "Clara".
Explica la diferencia entre parámetros y argumentos, y cómo los argumentos proporcionan valores a los parámetros cuando se llama a la función.
{{% /note %}}

---

## Funciones con Retorno de Valores

```python
def multiplica(val1, val2, val3):
    return val1 * val2 * val3

resultado = multiplica(2, 3, 4)
print(resultado)
```

{{% note %}}
Este ejemplo muestra una función que devuelve un valor:
- La función "multiplica" toma tres parámetros.
- Usa "return" para devolver el producto de los tres valores.
- El valor devuelto se asigna a la variable "resultado".
- Finalmente, se imprime el resultado.
Explica la importancia de la declaración "return" y cómo permite que las funciones produzcan resultados que pueden ser utilizados en otras partes del programa.
{{% /note %}}

---

## Parámetros de una Función
Los parámetros son variables que se definen en la declaración de una función.

```python
def saludar(nombre):
    print("Hola, " + nombre)
```

{{% note %}}
En este ejemplo:
- "nombre" es un parámetro de la función "saludar".
- Los parámetros son como variables locales dentro de la función.
- Actúan como marcadores de posición para los valores que se pasarán a la función.
Explica que los parámetros permiten que las funciones sean más flexibles y reutilizables, ya que pueden trabajar con diferentes valores cada vez que se llaman.
{{% /note %}}

---

## Argumentos de una Función
Los argumentos son los valores reales que se pasan a la función cuando se llama.

```python
saludar("Clara")
```

{{% note %}}
En este ejemplo:
- "Clara" es un argumento pasado a la función "saludar".
- Los argumentos son los valores concretos que se utilizan cuando se llama a la función.
- Proporcionan los datos reales que los parámetros utilizarán dentro de la función.
Enfatiza que los argumentos deben coincidir en número y tipo con los parámetros definidos en la función, a menos que se usen parámetros opcionales o con valores por defecto.
{{% /note %}}

---

## Diferencia Clave
**Parámetros**: Definidos en la declaración de la función.

**Argumentos**: Proporcionados al llamar la función.

{{% note %}}
La diferencia clave entre parámetros y argumentos es:
- Parámetros: Se definen cuando se declara la función. Son como variables locales dentro de la función.
- Argumentos: Se proporcionan cuando se llama a la función. Son los valores reales que se pasan a la función.
Usa el ejemplo anterior para ilustrar: "nombre" es el parámetro, "Clara" es el argumento. Esta distinción es importante para entender cómo las funciones reciben y procesan datos.
{{% /note %}}

---

## Ejemplo Completo

```python
# Definición de la función con parámetro
def saludar(nombre):
    print("Hola, " + nombre)

# Llamada a la función con argumento
saludar("Clara")
```

{{% note %}}
Este ejemplo completo muestra tanto la definición como el uso de una función:
1. Se define la función "saludar" con un parámetro "nombre".
2. Se llama a la función con el argumento "Clara".
3. Dentro de la función, el parámetro "nombre" toma el valor del argumento "Clara".
Explica cómo este flujo permite que las funciones sean flexibles y reutilizables con diferentes valores.
{{% /note %}}

---

## Tipos de Funciones en Python
{{% fragment %}}Funciones de primera clase{{% /fragment %}}
{{% fragment %}}Funciones de orden superior{{% /fragment %}}
{{% fragment %}}Funciones anónimas (lambda){{% /fragment %}}

{{% note %}}
Python soporta varios tipos avanzados de funciones:
1. Funciones de primera clase: Pueden ser tratadas como cualquier otro tipo de dato.
2. Funciones de orden superior: Pueden aceptar otras funciones como argumentos o devolverlas.
3. Funciones lambda: Funciones anónimas para tareas simples y rápidas.
Explica cómo estos tipos de funciones proporcionan flexibilidad y potencia adicionales al lenguaje Python.
{{% /note %}}

---

## Funciones de Primera Clase
Las funciones de primera clase pueden ser tratadas como cualquier otro dato: asignadas a variables, pasadas como argumentos y retornadas por otras funciones.

```python
# Asignar una función a una variable
def saludo():
    return "Hola, mundo!"

saludo_var = saludo
print(saludo_var())
```

{{% note %}}
Este ejemplo demuestra cómo las funciones son objetos de primera clase en Python:
1. Se define una función "saludo".
2. Se asigna esta función a la variable "saludo_var".
3. Se llama a la función a través de la variable.
Explica cómo esto permite una gran flexibilidad, como pasar funciones como argumentos o almacenarlas en estructuras de datos.
{{% /note %}}

---

## Funciones de Orden Superior
Las funciones de orden superior son funciones que aceptan otras funciones como argumentos o retornan funciones como resultados.

```python
# Función de orden superior que acepta una función como argumento
def aplicar_funcion(func, valor):
    return func(valor)

# Función que se pasará como argumento
def cuadrado(x):
    return x * x

resultado = aplicar_funcion(cuadrado, 5)
print(resultado)
```

{{% note %}}
Este ejemplo muestra una función de orden superior:
1. "aplicar_funcion" toma otra función como argumento.
2. "cuadrado" es una función que se pasa como argumento.
3. "aplicar_funcion" llama a la función pasada con el valor dado.
Explica cómo esto permite una gran flexibilidad y abstracción en el diseño de programas. Las funciones de orden superior son fundamentales en la programación funcional.
{{% /note %}}

---

## Función de Orden Superior que Retorna una Función

```python
# Función de orden superior que retorna una función
def crear_multiplicador(n):
    def multiplicar(x):
        return x * n
    return multiplicar

duplicar = crear_multiplicador(2)
triplicar = crear_multiplicador(3)

print(duplicar(5))
print(triplicar(5))
```

{{% note %}}
Este ejemplo muestra una función de orden superior que devuelve otra función:
1. "crear_multiplicador" es una función que devuelve otra función.
2. La función interna "multiplicar" usa el valor de "n" de la función externa.
3. Se crean dos nuevas funciones: "duplicar" y "triplicar".
4. Estas nuevas funciones se usan para multiplicar números.
Explica el concepto de clausura (closure) y cómo las funciones internas pueden "recordar" el entorno en el que fueron creadas.
{{% /note %}}

---

## Ejemplo de Función Lambda

```python
suma = lambda a, b: a + b
print(suma(2, 3))

def suma_funcion(a, b):
    return a + b
```

{{% note %}}
Este ejemplo compara una función lambda con una función regular:
1. La función lambda "suma" toma dos parámetros y devuelve su suma.
2. Se muestra una función regular equivalente para comparación.
Explica que las funciones lambda son útiles para operaciones simples y cuando se necesita una función rápida sin definirla formalmente. Sin embargo, para operaciones más complejas, las funciones regulares son más apropiadas.
{{% /note %}}

---

## Funciones Lambda con Funciones de Orden Superior

```python
# Uso de funciones lambda con funciones de orden superior
numeros = [1, 2, 3, 4, 5]
cuadrados = list(map(lambda x: x * x, numeros))
print(cuadrados)
```

{{% note %}}
Este ejemplo muestra cómo se pueden usar funciones lambda con funciones de orden superior:
1. Se usa la función "map" para aplicar una operación a cada elemento de una lista.
2. La función lambda `lambda x: x * x` calcula el cuadrado de cada número.
3. El resultado se convierte de nuevo a una lista.
Explica cómo esta combinación de funciones lambda y funciones de orden superior permite operaciones concisas y poderosas sobre colecciones de datos.
{{% /note %}}

---

## Funciones Incorporadas en Python
También reconocidas como built-in

{{% fragment %}}print(){{% /fragment %}}
{{% fragment %}}input(){{% /fragment %}}
{{% fragment %}}len(){{% /fragment %}}
{{% fragment %}}str(){{% /fragment %}}
{{% fragment %}}int(){{% /fragment %}}
{{% fragment %}}open(){{% /fragment %}}

{{% note %}}
Python incluye muchas funciones incorporadas que proporcionan funcionalidades útiles:
- print(): Muestra información en la consola.
- input(): Recibe entrada del usuario.
- len(): Devuelve la longitud de un objeto.
- str(): Convierte un objeto a string.
- int(): Convierte a entero.
- open(): Abre un archivo y devuelve un objeto de archivo.
Explica que estas funciones están siempre disponibles sin necesidad de importar módulos adicionales, y son fundamentales para muchas operaciones básicas en Python.
{{% /note %}}

---

## Ejemplo de Función Incorporada

```python
nombre = input("¿Cuál es tu nombre?")
print("Hola, " + nombre)
```

{{% note %}}
Este ejemplo ilustra el uso de dos funciones incorporadas fundamentales:
1. input(): Muestra el mensaje "¿Cuál es tu nombre?" y espera la entrada del usuario.
2. print(): Muestra un saludo personalizado usando el nombre ingresado.
Explica cómo estas funciones permiten la interacción básica con el usuario. Destaca que aunque son simples, forman la base para construir interfaces de usuario más complejas en programas de consola.
{{% /note %}}

---

## Funciones con Argumentos por Defecto

```python
def saludar(nombre="Invitado"):
    print(f"Hola, {nombre}!")

saludar()  # Imprime: Hola, Invitado!
saludar("Ana")  # Imprime: Hola, Ana!
```

{{% note %}}
Los argumentos por defecto permiten definir valores predeterminados para los parámetros:
- Si no se proporciona un argumento al llamar la función, se usa el valor por defecto.
- Esto hace que las funciones sean más flexibles y fáciles de usar.
- Es útil para parámetros opcionales o para proporcionar comportamientos predeterminados.
Explica que los argumentos por defecto deben ser valores inmutables para evitar comportamientos inesperados.
{{% /note %}}

---

## Funciones con Número Variable de Argumentos

```python
def suma(*args):
    total = 0
    for num in args:
        total += num
    return total

print(suma(1, 2, 3))  # 6
print(suma(1, 2, 3, 4, 5))  # 15
```

{{% note %}}
El asterisco (*) antes del parámetro permite que la función acepte cualquier número de argumentos posicionales:
- *args recoge todos los argumentos en una tupla.
- Esto permite crear funciones muy flexibles que pueden manejar un número variable de entradas.
- Es útil cuando no se sabe de antemano cuántos argumentos se pasarán a la función.
Menciona que aunque el nombre 'args' es convencional, se puede usar cualquier nombre válido después del asterisco.
{{% /note %}}

---

## Funciones con Argumentos de Palabra Clave Variables

```python
def imprimir_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

imprimir_info(nombre="Ana", edad=30, ciudad="Madrid")
```

{{% note %}}
El doble asterisco (**) permite que la función acepte cualquier número de argumentos de palabra clave:
- **kwargs recoge todos los argumentos de palabra clave en un diccionario.
- Cada argumento se convierte en un par clave-valor en el diccionario.
- Esto es útil para funciones que necesitan manejar múltiples parámetros nombrados de forma flexible.
Explica cómo esto se puede usar para crear funciones que aceptan configuraciones o opciones personalizables.
{{% /note %}}

---

## Docstrings en Funciones

```python
def area_circulo(radio):
    """
    Calcula el área de un círculo.
    
    :param radio: El radio del círculo
    :return: El área del círculo
    """
    import math
    return math.pi * radio ** 2

print(area_circulo.__doc__)
```

{{% note %}}
Los docstrings son cadenas de documentación que describen lo que hace una función:
- Se colocan justo después de la definición de la función.
- Pueden ser accedidos mediante el atributo __doc__ de la función.
- Ayudan a otros programadores (y a ti mismo) a entender cómo usar la función.
- Pueden ser utilizados por herramientas de generación de documentación automática.
Enfatiza la importancia de documentar las funciones para mejorar la mantenibilidad del código.
{{% /note %}}

---

## Funciones como Objetos

```python
def saludar(nombre):
    return f"Hola, {nombre}!"

# Asignar la función a una variable
mi_funcion = saludar

# Usar la función a través de la variable
print(mi_funcion("Carlos"))  # Imprime: Hola, Carlos!
```

{{% note %}}
En Python, las funciones son objetos de primera clase:
- Pueden ser asignadas a variables.
- Pueden ser pasadas como argumentos a otras funciones.
- Pueden ser retornadas por otras funciones.
Este concepto es fundamental para entender características avanzadas de Python como decoradores y programación funcional. Explica cómo esto permite una gran flexibilidad en el diseño de programas.
{{% /note %}}

---

## Funciones Anidadas

```python
def outer_function(x):
    def inner_function(y):
        return x + y
    return inner_function

add_five = outer_function(5)
result = add_five(3)
print(result)  # Imprime: 8
```

{{% note %}}
Las funciones anidadas son funciones definidas dentro de otras funciones:
- Tienen acceso al ámbito de la función exterior.
- Pueden ser utilizadas para crear "closures" (cierres).
- Son útiles para encapsular lógica y crear funciones especializadas.
Este ejemplo demuestra cómo una función interna puede "recordar" el valor de la función externa. Explica el concepto de cierre y cómo se relaciona con el ámbito de las variables.
{{% /note %}}

---

## Decoradores

```python
def mi_decorador(func):
    def wrapper():
        print("Algo antes de la función")
        func()
        print("Algo después de la función")
    return wrapper

@mi_decorador
def saludar():
    print("¡Hola!")

saludar()
```

{{% note %}}
Los decoradores son una forma poderosa de modificar o extender el comportamiento de las funciones:
- Un decorador es una función que toma otra función y extiende su comportamiento.
- Se aplican usando el símbolo @ seguido del nombre del decorador.
- Permiten añadir funcionalidad antes y/o después de la función decorada.
- Son útiles para logging, medición de rendimiento, control de acceso, etc.
Explica cómo los decoradores aprovechan el concepto de funciones de orden superior y cómo pueden hacer el código más limpio y modular.
{{% /note %}}

---

## Generadores

```python
def contador(max):
    n = 0
    while n < max:
        yield n
        n += 1

for i in contador(5):
    print(i)
```

{{% note %}}
Los generadores son funciones especiales que generan una secuencia de valores:
- Usan la palabra clave 'yield' en lugar de 'return'.
- Mantienen su estado entre llamadas, permitiendo reanudar donde se quedaron.
- Son eficientes en memoria, ya que no calculan todos los valores de una vez.
- Son útiles para trabajar con grandes conjuntos de datos o secuencias infinitas.
Explica cómo los generadores difieren de las funciones normales y cómo pueden mejorar el rendimiento en ciertos escenarios.
{{% /note %}}

---

## Funciones Recursivas

```python
def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n-1)

print(factorial(5))  # Imprime: 120
```

{{% note %}}
Las funciones recursivas son aquellas que se llaman a sí mismas:
- Deben tener un caso base que detenga la recursión.
- Son útiles para problemas que pueden descomponerse en subproblemas similares.
- Pueden hacer que ciertos algoritmos sean más claros y concisos.
- Sin embargo, pueden ser menos eficientes que las soluciones iterativas para algunos problemas.
Explica la importancia del caso base y cómo la recursión funciona "desenrollándose" hasta llegar al caso base. Advierte sobre los peligros de la recursión infinita.
{{% /note %}}

---

## Resumen y Mejores Prácticas

- Escribir funciones con un propósito claro y único
- Usar nombres descriptivos para funciones y parámetros
- Documentar las funciones con docstrings
- Manejar errores y excepciones dentro de las funciones
- Evitar efectos secundarios no deseados
- Preferir funciones puras cuando sea posible

{{% note %}}
Repasa los puntos clave sobre las mejores prácticas al escribir funciones:
- Claridad de propósito: Cada función debe hacer una cosa y hacerla bien.
- Nomenclatura: Los nombres deben indicar claramente qué hace la función.
- Documentación: Los docstrings ayudan a entender cómo usar la función.
- Manejo de errores: Las funciones deben manejar situaciones inesperadas.
- Efectos secundarios: Minimizar los cambios no esperados fuera de la función.
- Funciones puras: Preferir funciones que no modifiquen el estado global.
Enfatiza que seguir estas prácticas lleva a un código más legible, mantenible y menos propenso a errores.
{{% /note %}}

---

## ¿Preguntas?


