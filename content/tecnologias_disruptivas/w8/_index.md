+++
title = "Semana 8: Lenguaje de Programación - Parte III"
outputs = ["Reveal"]
+++

## Semana 8
Lenguaje de Programación: Parte III

{{% note %}}
En esta semana, exploraremos los fundamentos de las funciones en Python, cómo definirlas y cómo llamarlas. Las funciones son herramientas poderosas que permiten escribir código de manera concisa y organizada, a la vez que posibilitan crear código reutilizable que puede ser usado en múltiples aplicaciones.
{{% /note %}}

---

## ¿Qué es una Función Python?
Un bloque de código que realiza una tarea específica y puede ser reutilizado en otras partes de un programa.

{{% note %}}
Una función Python es un bloque de código que realiza una tarea específica y puede ser reutilizado en otras partes de un programa. Las funciones son una parte esencial de Python, ya que facilitan la escritura de un código más organizado, eficiente y fácil de leer. También facilitan la depuración de su código, ya que se puede probar una función a la vez en lugar de todo el programa.
{{% /note %}}

---

## Características de una Función
{{% fragment %}}Realizan una actividad específica{{% /fragment %}}
{{% fragment %}}Pueden devolver un resultado{{% /fragment %}}
{{% fragment %}}Se identifican con un nombre{{% /fragment %}}
{{% fragment %}}Admiten diversos parámetros{{% /fragment %}}

{{% note %}}
Las funciones tienen las siguientes características:
- Realizan una actividad específica
- Pueden devolver un resultado al desarrollar su actividad específica
- Se identifican con un nombre
- Admiten diversos parámetros para realizar su actividad específica

Los parámetros que intervienen como el resultado que se obtiene son opcionales, ya que pueden existir funciones sin datos y que devuelven resultados, funciones sin datos que no devuelven nada, funciones con datos que no devuelven resultados y funciones con datos que devuelven resultados.
{{% /note %}}

---

## Tipos de Funciones en Python

{{% fragment %}}Funciones incorporadas (built-in){{% /fragment %}}
{{% fragment %}}Funciones definidas por el usuario{{% /fragment %}}

{{% note %}}
Las funciones de Python pueden ser funciones incorporadas o funciones definidas por el usuario. 
Las funciones incorporadas son funciones que están incluidas en la biblioteca estándar de Python, como la función print(), que imprime una cadena en la salida.
Las funciones definidas por el usuario son funciones que crea el programador, y que se utilizan para realizar una tarea específica dentro del programa.
{{% /note %}}

---

## Ventajas de una Función
{{% fragment %}}Reusabilidad{{% /fragment %}}
{{% fragment %}}Modularidad{{% /fragment %}}
{{% fragment %}}Facilidad de lectura{{% /fragment %}}
{{% fragment %}}Flexibilidad{{% /fragment %}}
{{% fragment %}}Funciones lambda{{% /fragment %}}

{{% note %}}
Python es un lenguaje de programación muy popular y versátil que ofrece varias bondades en sus funciones:
- Reusabilidad: las funciones en Python permiten escribir un bloque de código una vez y reutilizarlo muchas veces en todo el programa.
- Modularidad: las funciones en Python ayudan a dividir el programa en módulos más pequeños y manejables.
- Facilidad de lectura: las funciones en Python son fáciles de leer y entender, lo que facilita la colaboración entre desarrolladores.
- Flexibilidad: Python ofrece una variedad de funciones integradas y permite la creación de funciones personalizadas.
- Funciones lambda: Python permite la creación de funciones lambda, que son funciones anónimas y pequeñas para tareas simples y rápidas.
{{% /note %}}

---

## ¿Cómo Definir una Función de Python?

```python
def nombre(param1, param2):
    # bloque de instrucciones
    return valor
```

{{% note %}}
La palabra clave "def" se usa para definir una función en Python. A continuación, se invoca la función usando el nombre de la misma.

La definición de la función incluye una lista de parámetros (que pueden estar vacíos) y termina con dos puntos. Después de los dos puntos, se incluye el cuerpo de la función con mayor sangría. Este cuerpo consta de un conjunto de instrucciones que se encapsulan en la función y le dan significado.

La instrucción con la palabra clave return se agrega para devolver un resultado (opcional).
{{% /note %}}

---

## Sintaxis de una Función

{{< imgref src="/images/2025/03/funcion_python.svg" alt="Funciones en Python" class="img">}}

{{% note %}}
Cuando se define una función en Python, es necesario seguir una sintaxis específica:
- def: palabra clave que define una función.
- nombre: identificación que recibe la función. Debe ser lo más descriptivo posible.
- parámetros: son los elementos de entrada que tiene la función. Su número es optativo.
- dos puntos: indica el final de la definición de la función.
- bloque de instrucciones: es el bloque de código que realiza la ejecución de la función.
- return: es la palabra que ejecuta el retorno de datos que utiliza la función. Este retorno no es obligatorio.
- valor: datos que devuelve la ejecución de la función.
{{% /note %}}

---

## Ejercicio para Enseñar: Definir una Función Simple

```python
# Definir la función
def saludo():
    print("Buenos días, ¿cómo estás?")

# Llamar a la función
print("Primer saludo: ", end=" ")
saludo()
print("Segundo saludo: ", end="")
saludo()
```

{{% note %}}
Este código define una función simple llamada "saludo" que imprime un mensaje. Se llama a la función dos veces para demostrar la reutilización.

El resultado será:
Primer saludo: Buenos días, ¿cómo estás?
Segundo saludo: Buenos días, ¿cómo estás?

Observen cómo podemos reutilizar la misma función múltiples veces.
{{% /note %}}

---

## Ejemplo de una Función Sin Retorno de Valores (Sin Parámetros)

```python
def saludo():
    print("Buen día")

saludo()  # Muestra: Buen día
```

{{% note %}}
Este es un ejemplo sencillo donde:
- Se define una función "saludo" sin parámetros
- La función simplemente imprime "Buen día"
- Al llamar a la función con saludo(), se ejecuta y muestra el mensaje
{{% /note %}}

---

## Función con un Parámetro

```python
def saludopersonalizado(name):
    print("Buen día " + name)

saludopersonalizado("Clara")  # Muestra: Buen día Clara
```

{{% note %}}
En este ejemplo:
- Se define una función que acepta un parámetro "name"
- La función utiliza ese parámetro para personalizar el mensaje
- Al llamar a la función con el argumento "Clara", el resultado es "Buen día Clara"
{{% /note %}}

---

## Función con Varios Parámetros y Retorno

```python
def multiplica(val1, val2, val3):
    return val1 * val2 * val3

resultado = multiplica(2, 3, 4)
print(resultado)  # Muestra: 24
```

{{% note %}}
Este ejemplo muestra:
- Una función que acepta tres parámetros
- La función multiplica estos valores y devuelve el resultado
- Al llamar a la función con los valores 2, 3 y 4, el resultado es 24
- El valor retornado se almacena en la variable "resultado" y luego se imprime
{{% /note %}}

---

## Ejercicio para Estudiantes: Crear una Función para Calcular el Área de un Rectángulo

Escriba una función llamada `area_rectangulo` que:
1. Reciba dos parámetros: `base` y `altura`
2. Calcule el área del rectángulo (base × altura)
3. Devuelva el resultado

Luego, use la función para calcular el área de un rectángulo con base 5 y altura 3.

{{% note %}}
Solución:

```python
def area_rectangulo(base, altura):
    return base * altura

# Ejemplo de uso
area = area_rectangulo(5, 3)
print("El área del rectángulo es:", area)  # Mostrará: El área del rectángulo es: 15
```

Los estudiantes deben entender que:
1. La función recibe dos parámetros
2. Realiza un cálculo simple: multiplicar base por altura
3. Devuelve el resultado usando "return"
4. Al llamar a la función, el valor retornado se puede asignar a una variable
{{% /note %}}

---

## Tipos de Funciones en Python
{{% fragment %}}Funciones de primera clase{{% /fragment %}}
{{% fragment %}}Funciones de orden superior{{% /fragment %}}
{{% fragment %}}Funciones anónimas (lambda){{% /fragment %}}

{{% note %}}
En Python se pueden utilizar, para la escritura de los códigos, tres tipos de funciones:
- Funciones de primera clase: se encuentran definidas por cómo el lenguaje de programación se relaciona con las mismas. Pueden tratarse como datos primitivos y asociarse a variables o estructuras de datos.
- Funciones de orden superior: pueden actuar como resultados o parámetros de otras funciones.
- Funciones anónimas: son funciones sin nombre que se pueden utilizar para asociarlas directamente a variables y para insertarse a otras funciones.
{{% /note %}}

---

## Funciones de Primera Clase - Ejemplo

```python
def saludo(texto):
    return texto.upper() + "!"

print(saludo("Buen día"))  # Muestra: BUEN DÍA!

# Asignar función a una variable
gritando = saludo
print(gritando("Buen día"))  # También muestra: BUEN DÍA!
```

{{% note %}}
En este ejemplo, la función definida es un dato que está asociado con una variable dada, que en este caso es "gritando". La función se ejecuta primero con el nombre original de la función (saludo), mientras que luego se ejecuta con la variable que apunta a la función. Por lo tanto, una función es de primera clase cuando puede tener diferentes nombres si se le asignan diferentes variables.
{{% /note %}}

---

## Funciones Lambda - Ejemplo

```python
# Función lambda para calcular el cuadrado de un número
cuadrado = lambda x: x * x

# Uso de la función lambda
print(cuadrado(5))  # Muestra: 25
```

{{% note %}}
En la función anónima encontramos la instrucción de lambda, que puede definirse como una serie de parámetros sin paréntesis separados por comas. La lambda sólo admite una instrucción y nunca se utiliza el return. Las funciones lambda son útiles para operaciones simples y pequeñas.
{{% /note %}}

---

## Ejercicio para Enseñar: Funciones de Orden Superior

```python
# Función que aplica otra función a un valor
def aplicar_funcion(f, valor):
    return f(valor)

# Funciones para usar con la función de orden superior
def duplicar(x):
    return x * 2

def cuadrado(x):
    return x * x

# Aplicar las funciones
print(aplicar_funcion(duplicar, 5))  # Muestra: 10
print(aplicar_funcion(cuadrado, 5))  # Muestra: 25
```

{{% note %}}
Este ejemplo muestra una función de orden superior "aplicar_funcion" que:
1. Recibe una función y un valor como parámetros
2. Aplica la función recibida al valor
3. Devuelve el resultado

Usamos esta función con dos funciones diferentes ("duplicar" y "cuadrado") para mostrar su flexibilidad.
{{% /note %}}

---

## Funciones Incorporadas en Python (Built-in)

Python cuenta con una librería de funciones y tipos predefinidos:

{{% fragment %}}print() - para imprimir en pantalla{{% /fragment %}}
{{% fragment %}}input() - para recibir datos del usuario{{% /fragment %}}
{{% fragment %}}len() - para obtener la longitud de una lista o cadena{{% /fragment %}}
{{% fragment %}}str() - para convertir a cadena{{% /fragment %}}
{{% fragment %}}int() - para convertir a entero{{% /fragment %}}
{{% fragment %}}float() - para convertir a número decimal{{% /fragment %}}

{{% note %}}
Python cuenta con una librería de funciones y tipos que ya vienen incluidos en él, por lo tanto siempre están disponibles para ser utilizados por los programadores. Se denominan funciones built-in. Estas funciones proporcionan una gran cantidad de funcionalidades útiles, como la conversión de tipos de datos, la gestión de cadenas de caracteres, el trabajo con listas y diccionarios, la manipulación de archivos, entre otras.
{{% /note %}}

---

## Ejemplo: Función print()

```python
print("Buen día")
```

Resultado:
```
Buen día
```

{{% note %}}
La función print() es una de las más básicas y usadas en Python. Permite mostrar información en la consola o terminal. Puede recibir múltiples argumentos y mostrarlos uno tras otro.
{{% /note %}}

---

## Ejemplo: Función input()

```python
saludo = input("¿Cuál es tu nombre?")
print("Hola", saludo, "¿cómo estás?")
```

Si el usuario ingresa "Carlos":
```
¿Cuál es tu nombre? Carlos
Hola Carlos ¿cómo estás?
```

{{% note %}}
La función input() se utiliza para recibir datos de entrada del usuario a través del teclado. El argumento que se le pasa a input() se muestra como un mensaje o prompt para el usuario. El valor introducido por el usuario se devuelve como una cadena de texto (string).
{{% /note %}}

---

## Ejemplo: Función len()

```python
# Longitud de una cadena
print(len("Buen día"))  # Muestra: 8

# Longitud de una lista
print(len(["uno", "dos", "tres"]))  # Muestra: 3
```

{{% note %}}
La función len() devuelve el número de elementos en un objeto. Cuando el objeto es una cadena, devuelve el número de caracteres. Cuando es una lista, tupla, conjunto o diccionario, devuelve el número de elementos.
{{% /note %}}

---

## Ejemplo: Función str()

```python
# Convertir un número a una cadena
numero = 42
texto = str(numero)
print(texto, type(texto))  # "42" <class 'str'>

# Convertir un booleano a una cadena
verdadero = True
texto_bool = str(verdadero)
print(texto_bool, type(texto_bool))  # "True" <class 'str'>

# Convertir una lista a una cadena
mi_lista = [1, 2, 3]
texto_lista = str(mi_lista)
print(texto_lista, type(texto_lista))  # "[1, 2, 3]" <class 'str'>
```

{{% note %}}
La función str() se utiliza para convertir diferentes tipos de datos (números, booleanos, listas, etc.) a cadenas de texto (strings). Esto es útil cuando necesitamos representar cualquier tipo de objeto como texto, por ejemplo, para mostrarlo al usuario o para concatenarlo con otras cadenas.
{{% /note %}}

---

## Ejemplo: Función int()

```python
b = int(12.5)
print(b)  # Muestra: 12
```

{{% note %}}
La función int() convierte un número o una cadena a un entero (números positivos o negativos sin decimales). Si se convierte un número flotante, se trunca la parte decimal (no se redondea).
{{% /note %}}

---

## Ejemplo: Función float()

```python
a = float(True)
b = float(5)
print(a, type(a))  # Muestra: 1.0 <class 'float'>
print(b, type(b))  # Muestra: 5.0 <class 'float'>
```

{{% note %}}
La función float() permite representar números reales (números positivos o negativos con decimales). Puede convertir enteros o booleanos a números flotantes.
{{% /note %}}

---

## Más Funciones Built-in

{{% fragment %}}abs() - devuelve el valor absoluto{{% /fragment %}}
{{% fragment %}}max() - devuelve el valor más grande{{% /fragment %}}
{{% fragment %}}min() - devuelve el valor más pequeño{{% /fragment %}}
{{% fragment %}}sum() - suma los elementos de una lista{{% /fragment %}}
{{% fragment %}}round() - redondea un número{{% /fragment %}}
{{% fragment %}}open() - abre un archivo{{% /fragment %}}

{{% note %}}
Python ofrece muchas más funciones incorporadas que son muy útiles para diversas tareas. Algunas de ellas son:
- abs(): devuelve el valor absoluto de un número
- max(): devuelve el valor más grande de los argumentos presentes
- min(): devuelve el menor valor de los argumentos presentes
- sum(): suma los elementos de una lista, tupla o conjunto
- round(): redondea un número a un número determinado de decimales
- open(): abre un archivo y devuelve el objeto correspondiente
{{% /note %}}

---

## Ejemplo: Función abs()

```python
print(abs(23))    # Muestra: 23
print(abs(-23))   # Muestra: 23
```

{{% note %}}
La función abs() devuelve el valor absoluto de un número, es decir, su valor sin signo. Si el número es positivo, devuelve el mismo número. Si es negativo, devuelve el número con signo opuesto (positivo).
{{% /note %}}

---

## Ejemplo: Funciones max() y min()

```python
print(max(23, 44, 10))  # Muestra: 44
print(min(23, 44, 10))  # Muestra: 10
```

{{% note %}}
La función max() devuelve el valor más grande de los argumentos presentes, mientras que min() devuelve el valor más pequeño.
{{% /note %}}

---

## Ejemplo: Función sum()

```python
numeros = [5, 10, 2, 40]
suma = sum(numeros)
print("La suma de los números de la lista es:", suma)  # Muestra: 57
```

{{% note %}}
La función sum() se utiliza para sumar los elementos de una lista, tupla o conjunto. Toma un iterable como argumento y devuelve la suma de sus elementos.
{{% /note %}}

---

## Ejemplo: Función round()

```python
# Redondear a 2 decimales
numero = 23.4589
redondeado = round(numero, 2)
print(redondeado)  # Muestra: 23.46

# Redondear al entero más cercano
numero = 17.8
redondeado = round(numero)
print(redondeado)  # Muestra: 18
```

{{% note %}}
La función round() se utiliza para redondear un número a un número determinado de decimales. Si no se especifica el número de decimales, redondea al entero más cercano.
{{% /note %}}

---

## Ejercicio para Estudiantes: Calculadora Simple

Cree una función llamada `calculadora` que:
1. Reciba tres parámetros: `num1`, `num2` y `operacion`
2. Realice la operación indicada (suma, resta, multiplicación o división)
3. Devuelva el resultado

Pruebe la función con varias operaciones.

{{% note %}}
Solución:

```python
def calculadora(num1, num2, operacion):
    if operacion == "suma":
        return num1 + num2
    elif operacion == "resta":
        return num1 - num2
    elif operacion == "multiplicacion":
        return num1 * num2
    elif operacion == "division":
        if num2 != 0:  # Evitar división por cero
            return num1 / num2
        else:
            return "Error: División por cero"
    else:
        return "Operación no válida"

# Pruebas
print(calculadora(10, 5, "suma"))           # 15
print(calculadora(10, 5, "resta"))          # 5
print(calculadora(10, 5, "multiplicacion")) # 50
print(calculadora(10, 5, "division"))       # 2.0
print(calculadora(10, 0, "division"))       # Error: División por cero
print(calculadora(10, 5, "potencia"))       # Operación no válida
```

Esta función demuestra:
1. El uso de parámetros
2. Toma de decisiones con if-elif-else
3. Manejo de casos especiales (división por cero)
4. Retorno de diferentes tipos de valores (números o strings)
{{% /note %}}

---

## Uso de Parámetros y Argumentos en una Función Python

**Parámetros**: Nombres especificados en la definición de la función.

**Argumentos**: Valores que se pasan a la función cuando es llamada.

{{% note %}}
En Python (y en la mayoría de los lenguajes de programación), los términos "parámetros" y "argumentos" se refieren a diferentes cosas.

Un parámetro es un nombre que se especifica en la definición de una función y que se utiliza para referirse a un valor que pasará a la función cuando sea llamada.

Cuando llamamos a la función y le pasamos valores para los parámetros, estos valores se convierten en los argumentos de la función.
{{% /note %}}

---

## Ejemplo de Parámetros y Argumentos

```python
# Definición de función con parámetros
def sumar(a, b):
    return a + b

# Llamada a la función con argumentos
resultado = sumar(2, 3)
print(resultado)  # Muestra: 5
```

{{% note %}}
En este ejemplo:
- a y b son los parámetros de la función sumar().
- 2 y 3 son los argumentos que se pasan a la función sumar() cuando es llamada.
- La función toma estos valores y los utiliza para calcular y devolver el resultado.
{{% /note %}}

---

## Optimización de Funciones Python

{{% fragment %}}Mantener el código organizado y legible{{% /fragment %}}
{{% fragment %}}Utilizar los tipos y estructuras de datos correctos{{% /fragment %}}
{{% fragment %}}Usar la sintaxis correcta{{% /fragment %}}
{{% fragment %}}Probar el código{{% /fragment %}}

{{% note %}}
Es importante optimizar las funciones de Python para obtener la máxima eficiencia:
1. Mantener el código organizado y fácil de leer mediante la sangría correcta y nombres significativos.
2. Utilizar los tipos y estructuras de datos correctos para cada tarea.
3. Utilizar la sintaxis correcta al escribir funciones Python.
4. Probar el código ejecutándolo y comprobando la salida para asegurar que funciona como se espera.
{{% /note %}}

---

## Tipos de Errores en las Funciones de Python

{{% fragment %}}Errores de sintaxis{{% /fragment %}}
{{% fragment %}}Errores de tiempo de ejecución{{% /fragment %}}
{{% fragment %}}Errores de lógica{{% /fragment %}}
{{% fragment %}}Errores de tipo{{% /fragment %}}
{{% fragment %}}Errores de importación{{% /fragment %}}

{{% note %}}
Los errores en las funciones de Python pueden ser de diferentes tipos:
- Errores de sintaxis: ocurren cuando se ha escrito una línea de código incorrecta.
- Errores de tiempo de ejecución: ocurren durante la ejecución del programa (ej. división por cero).
- Errores de lógica: ocurren cuando la lógica de la función está mal escrita.
- Errores de tipo: ocurren cuando se espera un tipo de datos específico y se recibe otro.
- Errores de importación: ocurren cuando se intenta importar un módulo inexistente.
{{% /note %}}

---

## Ejercicio Final para Estudiantes: Validador de Contraseñas

Cree una función llamada `validar_contraseña` que:
1. Reciba una contraseña como parámetro
2. Verifique si cumple con los requisitos:
   - Al menos 8 caracteres
   - Al menos una letra mayúscula
   - Al menos un número
   - Al menos un carácter especial (@, #, $, %, &, *)
3. Devuelva True si cumple todos los requisitos, o False en caso contrario

{{% note %}}
Solución:

```python
def validar_contraseña(contraseña):
    # Verificar longitud mínima
    if len(contraseña) < 8:
        return False
    
    # Verificar al menos una mayúscula
    tiene_mayuscula = False
    for char in contraseña:
        if char.isupper():
            tiene_mayuscula = True
            break
    if not tiene_mayuscula:
        return False
    
    # Verificar al menos un número
    tiene_numero = False
    for char in contraseña:
        if char.isdigit():
            tiene_numero = True
            break
    if not tiene_numero:
        return False
    
    # Verificar al menos un carácter especial
    caracteres_especiales = "@#$%&*"
    tiene_especial = False
    for char in contraseña:
        if char in caracteres_especiales:
            tiene_especial = True
            break
    if not tiene_especial:
        return False
    
    # Si pasa todas las verificaciones
    return True

# Pruebas
print(validar_contraseña("abc123"))              # False (muy corta)
print(validar_contraseña("abcdefgh"))            # False (sin mayúscula, número ni especial)
print(validar_contraseña("Abcdefgh1"))           # False (sin carácter especial)
print(validar_contraseña("Abcdefgh@"))           # False (sin número)
print(validar_contraseña("abcdefgh1@"))          # False (sin mayúscula)
print(validar_contraseña("Abcdefgh1@"))          # True (cumple todos los requisitos)
```

Esta función demuestra:
1. Uso de la función len() para verificar la longitud
2. Iteración a través de los caracteres de una cadena
3. Uso de métodos de string (isupper(), isdigit())
4. Verificación de pertenencia de un carácter a un conjunto
5. Retorno de valores booleanos basados en condiciones
{{% /note %}}

---

## Cierre

Las funciones son una parte integral del lenguaje Python:
- Permiten construir programas efectivos y modulares
- Son esenciales para la reutilización de código
- Facilitan la organización y mantenimiento del código
- Su dominio es fundamental para tener éxito en la programación

{{% note %}}
Saber cómo son las funciones de Python es una parte esencial de la comprensión de la estructura del lenguaje de programación. Sin un conocimiento profundo de cómo trabajan las funciones, sería imposible construir programas efectivos que sean capaces de completar tareas complejas.

Las funciones son una parte integral del lenguaje Python, por lo que ser capaz de reconocerlas y comprenderlas es un activo valioso. Saber cómo escribir funciones eficientes en Python puede ser la diferencia entre crear código sólido y escribir código ineficiente.

Por lo tanto, es importante saber cómo son las funciones de Python para tener éxito en la programación.
{{% /note %}}

---

## ¿Preguntas?