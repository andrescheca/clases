+++
title = "Semana 7: Lenguaje de Programación - Parte II"
outputs = ["Reveal"]
+++

## Semana 7
Lenguaje de Programación: Parte II

{{% note %}}
En esta séptima semana incursionaremos en las sentencias de control que presenta Python, que permiten abstraer algoritmos o secuencias de instrucciones en un software para lograr su objetivo. Particularmente analizaremos las sentencias condicionales y las repetitivas.
{{% /note %}}

---

## ¿Qué son las Sentencias de Control?
Controlan el flujo de ejecución de un programa.

{{% fragment %}}Se dividen en dos categorías: selección e iteración.{{% /fragment %}}

{{% note %}}
Las sentencias de control en Python se usan para controlar el flujo de ejecución de un programa. Estas sentencias determinan cuándo y cómo se ejecuta el código. Las sentencias de control de Python se dividen en dos categorías: selección e iteración.
{{% /note %}}

---

## Tipos de Sentencias de Control
{{% fragment %}}**Selección**: if-else, condicionales{{% /fragment %}}
{{% fragment %}}**Iteración**: bucles for y while{{% /fragment %}}

{{% note %}}
Las sentencias de selección permiten al programador seleccionar una parte específica del código a ejecutar, mientras que las sentencias de iteración permiten al programador ejecutar una parte específica del código múltiples veces.
{{% /note %}}

---

## Sentencias de Selección
Permiten seleccionar una parte específica del código a ejecutar.

{{% fragment %}}**if-else**: Ejecuta código basándose en una condición{{% /fragment %}}

{{% note %}}
Las sentencias if-else permiten al programador ejecutar una parte del código basándose en una determinada condición, mientras que las sentencias switch-case permiten al programador elegir una determinada parte del código a ejecutar para cada valor de una determinada variable.
{{% /note %}}

---

## Sentencias de Iteración
Permiten ejecutar una parte específica del código múltiples veces.

{{% fragment %}}**Bucles for**: Para un número conocido de iteraciones{{% /fragment %}}
{{% fragment %}}**Bucles while**: Se ejecutan hasta que una condición sea falsa{{% /fragment %}}

{{% note %}}
Los bucles for permiten al programador ejecutar una cierta parte del código durante un cierto número de veces, mientras que los bucles while permiten al programador ejecutar una cierta parte del código hasta que se cumpla una cierta condición.
{{% /note %}}

---

## Bloques de Código
Conjunto de sentencias agrupadas lógicamente.

{{% note %}}
Los bloques de código son una parte fundamental de la programación estructurada. Son un conjunto de sentencias agrupadas lógicamente y que suelen comenzar con una palabra clave como if, while o for. Estos bloques de código contienen sentencias que se encuentran delimitadas por un inicio y un final. Esta forma de delimitación va a depender del lenguaje de programación que se esté utilizando.
{{% /note %}}

---

## Indentación en Python
Indica la estructura del código.

{{% note %}}
En un lenguaje informático, la indentación es similar a la sangría en un lenguaje humano escrito (en un nivel formal). Así como en un lenguaje formal se debe seguir cierta sangría, los lenguajes de programación requieren indentación. Aunque no todos los lenguajes de programación requieren esta sangría, se considera una buena práctica usarlo para mejorar la legibilidad del código fuente. En el caso de Python, la sangría es obligatoria, ya que de ella depende la estructura del código.
{{% /note %}}

---

## Ejemplo de Indentación

```python
if x > 7:
    print("x es mayor que 7")
    if x % 2 == 0:
        print("x es un número par")
```

{{% note %}}
En este ejemplo, vemos cómo la indentación marca la estructura del código. El primer print está indentado bajo el if principal, lo que indica que pertenece a ese bloque. El segundo if y su print están aún más indentados, formando un bloque anidado. Una sangría de cuatro espacios en blanco indica que las sentencias sangradas están anidadas dentro de la misma estructura de control.
{{% /note %}}

---

## Ejercicio 1: Indentación

Corrige la indentación del siguiente código:

```python
x = 10
if x > 5:
print("x es mayor que 5")
    if x < 15:
        print("x es menor que 15")
print("Este código siempre se ejecuta")
```

{{% note %}}
Solución:
```python
x = 10
if x > 5:
    print("x es mayor que 5")
    if x < 15:
        print("x es menor que 15")
print("Este código siempre se ejecuta")
```
{{% /note %}}

---

## Codificación de Texto
Indicación de la codificación de caracteres utilizada en el archivo.

{{% note %}}
El encoding es una indicación que se coloca al inicio de un archivo Python, a efectos de indicarle al sistema la codificación de caracteres que se va a utilizar en el archivo. Si no se le indicara a Python esta codificación, el resultado de la ejecución del código fuente podría resultar erróneo.
{{% /note %}}

---

## Ejemplo de Codificación de Texto

```python
# -*- coding: utf-8 -*-
print("El niño juntó leños")
```

{{% note %}}
En este ejemplo, se utiliza la codificación UTF-8, que es la más utilizada. Se usa para almacenar caracteres unicode, lo que significa que puede almacenar cualquier carácter de cualquier idioma. Si no se utiliza la sentencia anterior, al ejecutar el código fuente imprimirá un mensaje de error de sintaxis debido a los caracteres no ASCII.
{{% /note %}}

---

## Opciones de Encoding
{{% fragment %}}**UTF-8**: Más utilizada, soporta todos los idiomas{{% /fragment %}}
{{% fragment %}}**ASCII**: Limitada a 128 caracteres{{% /fragment %}}
{{% fragment %}}**Unicode**: Flexible, soporta hasta 65,536 caracteres{{% /fragment %}}

{{% note %}}
La codificación más utilizada es UTF-8. ASCII es otra codificación popular pero es una codificación de 7 bits, lo que significa que sólo puede almacenar hasta 128 caracteres. Unicode es una codificación que puede almacenar cualquier carácter de cualquier idioma y es una codificación de 16 bits, lo que significa que puede almacenar hasta 65.536 caracteres.
{{% /note %}}

---

## Ejercicio 2: Encoding

¿Qué salida produciría el siguiente código y por qué?

```python
# Sin declaración de encoding
print("España")
```

{{% note %}}
Respuesta: En Python 3, la codificación por defecto es UTF-8, por lo que se mostraría "España" correctamente. Sin embargo, en Python 2 sin declaración de encoding, daría un error de sintaxis porque el carácter 'ñ' no es ASCII.
{{% /note %}}

---

## Asignación Múltiple
Asignar múltiples variables en una sola instrucción.

```python
a, b, c = 'casa', 244, False
```

{{% note %}}
Python también presenta la posibilidad de asignar múltiples variables en una sola instrucción. En este ejemplo, tenemos una sola instrucción y valores asignados a tres variables diferentes: a recibe 'casa' (string), b recibe 244 (entero) y c recibe False (booleano).
{{% /note %}}

---

## Ejemplo con Tupla y Lista

```python
# Con tupla
ejemplo_tupla = ('Título', 2023) 
texto, anio = ejemplo_tupla 

# Con lista
ejemplo_lista = ['león', 'África'] 
animal, continente = ejemplo_lista 
```

{{% note %}}
También puede utilizarse una tupla o una lista para realizar la asignación múltiple de variables. En el primer ejemplo, los valores de la tupla se asignan a las variables texto y anio. En el segundo ejemplo, los valores de la lista se asignan a las variables animal y continente.
{{% /note %}}

---

## Ejercicio 3: Asignación Múltiple

Escribe una línea de código que asigne los valores 10, 20, 30 a las variables x, y, z respectivamente.

{{% note %}}
Solución:
```python
x, y, z = 10, 20, 30
```
{{% /note %}}

---

## Estructuras de Control
{{% fragment %}}**Secuenciales**: Ejecución línea por línea{{% /fragment %}}
{{% fragment %}}**Selectivas**: Decisiones basadas en condiciones{{% /fragment %}}
{{% fragment %}}**Iterativas**: Repetición de código{{% /fragment %}}

{{% note %}}
Existen tres tipos de estructuras de control en programación:
1. Secuenciales: es la estructura básica de un programa, que permite que las instrucciones se ejecuten en el orden en que fueron escritas.
2. Selectivas: sirven cuando necesitamos evaluar el valor de una variable o de una condición establecida, para saber que se debe ejecutar en el paso siguiente.
3. Iterativas: son las que permiten ejecutar un mismo código de manera repetida mientras se cumpla una condición determinada.
{{% /note %}}

---

## Estructuras de Control Condicionales
Permiten tomar decisiones basadas en condiciones.

{{% note %}}
Las estructuras selectivas, de selección o condicionales sirven cuando necesitamos evaluar el valor de una variable o de una condición establecida, para saber qué se debe ejecutar en el paso siguiente. Se pueden clasificar en: selectivas simples, selectivas dobles y selectivas múltiples o anidadas.
{{% /note %}}

---

## ¿Qué es una Bifurcación?
Instrucción que permite tomar una decisión.

{{% note %}}
Una bifurcación en programación se refiere a una instrucción que permite tomar una decisión. Estas decisiones se basan en la evaluación de una o más condiciones previamente establecidas. Si se cumple la condición, se ejecuta un bloque de código. De lo contrario, se ejecuta otro bloque. Las bifurcaciones se utilizan para introducir condicionalidad en el flujo de ejecución de un programa.
{{% /note %}}

---

## Operadores Relacionales
Utilizados para comparar dos valores.

{{% note %}}
Los operadores relacionales se utilizan para comparar dos valores. Estos operadores permiten tomar decisiones basadas en la igualdad, desigualdad, mayor que, menor que, y otros aspectos relacionales de los valores. Si la comparativa es cierta devolverán TRUE, caso contrario devolverán FALSE.
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
Los operadores relacionales son: menor que (<), mayor que (>), menor o igual que (<=), mayor o igual que (>=), igual que (==) y distinto que (!=). Estos operadores se pueden usar para construir condiciones de decisión que permiten establecer el flujo de ejecución de un programa.
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
En este ejemplo, a = 10 y b = 5. La operación "a > b" devuelve True porque 10 es mayor que 5. "a < b" devuelve False porque 10 no es menor que 5. "a == b" devuelve False porque 10 no es igual a 5. "a != b" devuelve True porque 10 es distinto de 5.
{{% /note %}}

---

## Ejercicio 4: Operadores Relacionales

¿Qué valor devolverán estas expresiones?

```python
x = 15
y = 15
z = "15"

a = x == y
b = x == z
c = x > y
d = x >= y
```

{{% note %}}
Solución:
- a = True (x y y son iguales, ambos valen 15)
- b = False (x es un entero, z es una cadena, son tipos diferentes)
- c = False (x no es mayor que y, son iguales)
- d = True (x es mayor o igual que y, en este caso son iguales)
{{% /note %}}

---

## Operadores Lógicos
Para evaluar múltiples condiciones simultáneamente.

| Operador | Explicación |
|----------|-------------|
| and      | Verdadero si ambas condiciones son verdaderas |
| or       | Verdadero si al menos una condición es verdadera |
| xor      | Verdadero si solo una condición es verdadera |

{{% note %}}
Para poder evaluar más de una condición en forma simultánea se pueden utilizar los operadores lógicos. El operador "and" devuelve True solo si ambas condiciones son verdaderas. El operador "or" devuelve True si al menos una de las condiciones es verdadera. El operador "xor" devuelve True solo si una condición es verdadera y la otra es falsa.
{{% /note %}}

---

## Ejemplo de Operadores Lógicos

```python
a = 10
b = 5

print(a > 5 and b > 3)  # True
print(a > 15 or b > 3)  # True
print(a > 15 and b > 3) # False
```

{{% note %}}
En este ejemplo: "a > 5 and b > 3" devuelve True porque ambas condiciones son verdaderas (10 > 5 y 5 > 3). "a > 15 or b > 3" devuelve True porque al menos una condición es verdadera (5 > 3). "a > 15 and b > 3" devuelve False porque no se cumplen ambas condiciones (10 no es mayor que 15).
{{% /note %}}

---

## Clasificación de Estructuras Selectivas
{{% fragment %}}**Selectivas simples**: Ejecutan código si se cumple una condición{{% /fragment %}}
{{% fragment %}}**Selectivas dobles**: Alternativa entre dos bloques de código{{% /fragment %}}
{{% fragment %}}**Selectivas múltiples**: Combinan varias condiciones{{% /fragment %}}

{{% note %}}
Las estructuras selectivas se clasifican en:
1. Selectivas simples: cuando dada una condición establecen los pasos a seguir si se cumple dicha condición.
2. Selectivas dobles: determinan los pasos a seguir en caso de cumplirse la condición dada así como las instrucciones a ejecutar en caso de no cumplirse.
3. Selectivas múltiples o anidadas: son las que permiten combinar los diferentes tipos de selectivas, simples y dobles, para crear condiciones más complejas.
{{% /note %}}

---

## Sentencias if / elif / else
Ejecutan código basado en condiciones.

{{% note %}}
La sentencia if en Python se utiliza para ejecutar un bloque de código si una condición dada es verdadera. Esta sentencia es una poderosa herramienta que permite controlar el flujo de un programa basado en ciertas condiciones. También se utiliza para controlar la iteración de un bucle y para comprobar la condición de una variable o una expresión.
{{% /note %}}

---

## Sintaxis de la Sentencia If

```python
if condición:
    # bloque de código 1
```

{{% note %}}
La sintaxis de la sentencia if es bastante simple. Consiste en una expresión booleana seguida de un bloque de código. La expresión booleana se evalúa y si devuelve True, entonces se ejecuta el bloque de código.
{{% /note %}}

---

## Sintaxis de la Sentencia If-Else

```python
if condición:
    # bloque de código 1
else:
    # bloque de código 2
```

{{% note %}}
La sintaxis de una sentencia if también puede incluir una cláusula else. Esta cláusula se utiliza para ejecutar un bloque de código diferente si la condición dada no es verdadera. Si la condición es True, entonces se ejecuta el bloque de código 1. Si la condición es False, entonces se ejecuta el bloque de código 2.
{{% /note %}}

---

## Sintaxis de la Sentencia If-Elif-Else

```python
if condición1:
    # bloque de código 1
elif condición2:
    # bloque de código 2
else:
    # bloque de código 3
```

{{% note %}}
La sintaxis de la sentencia if también puede incluir una cláusula elif. Esta cláusula se utiliza para comprobar múltiples condiciones. Si la condición1 es Verdadero, entonces se ejecuta el bloque de código 1. Si la condición2 es Verdadero, entonces se ejecuta el bloque de código 2. Si ninguna de las condiciones es Verdadero, entonces se ejecuta el bloque de código 3.
{{% /note %}}

---

## Ejemplo de Selectiva Simple

```python
x = 10

if x > 5:
    print("x es mayor que 5")
```

{{% note %}}
En este ejemplo, si el valor de x es mayor que 5, se ejecutará la sentencia print("x es mayor que 5"). Como x vale 10, esta condición se cumple y se mostrará el mensaje.
{{% /note %}}

---

## Ejemplo de Selectiva Doble

```python
x = 10

if x > 15:
    print("x es mayor que 15")
else:
    print("x es menor o igual que 15")
```

{{% note %}}
En este ejemplo, si x es mayor que 15, se mostrará "x es mayor que 15". De lo contrario, se mostrará "x es menor o igual que 15". Como x vale 10, se ejecutará el bloque else y se mostrará "x es menor o igual que 15".
{{% /note %}}

---

## Ejemplo de Selectiva Múltiple

```python
x = 10

if x > 15:
    print("x es mayor que 15")
elif x > 5:
    print("x es mayor que 5 pero menor o igual que 15")
else:
    print("x es menor o igual que 5")
```

{{% note %}}
En este ejemplo, se evalúan múltiples condiciones. Como x vale 10, no es mayor que 15, así que se pasa a la siguiente condición. Como x es mayor que 5, se ejecuta el bloque de código correspondiente y se muestra "x es mayor que 5 pero menor o igual que 15".
{{% /note %}}

---

## Ejercicio 5: Estructura If

Escribe un programa que determine si un número es positivo, negativo o cero.

{{% note %}}
Solución:
```python
numero = int(input("Ingresa un número: "))

if numero > 0:
    print("El número es positivo")
elif numero < 0:
    print("El número es negativo")
else:
    print("El número es cero")
```
{{% /note %}}

---

## Ejercicio 6: Calificaciones

Escribe un programa que califique una nota de 0 a 100 en:
- Excelente (90-100)
- Muy Bueno (80-89)
- Bueno (70-79)
- Regular (60-69)
- Insuficiente (0-59)

{{% note %}}
Solución:
```python
nota = int(input("Ingresa la calificación (0-100): "))

if nota >= 90 and nota <= 100:
    print("Excelente")
elif nota >= 80 and nota <= 89:
    print("Muy Bueno")
elif nota >= 70 and nota <= 79:
    print("Bueno")
elif nota >= 60 and nota <= 69:
    print("Regular")
elif nota >= 0 and nota <= 59:
    print("Insuficiente")
else:
    print("Nota fuera de rango")
```
{{% /note %}}

---

## Estructuras If Anidadas

```python
x = 10

if x > 7:
    if x % 2 == 0:
        print("x es mayor que 7 y par")
    else:
        print("x es mayor que 7 e impar")
else:
    print("x es menor o igual que 7")
```

{{% note %}}
Las estructuras if anidadas se utilizan para comprobar múltiples condiciones dentro de una única sentencia. En este ejemplo, si x es mayor que 7 (lo cual es verdadero), se comprueba si x es par. Como 10 es divisible por 2, se muestra "x es mayor que 7 y par".
{{% /note %}}

---

## Ejercicio 7: Año Bisiesto

Escribe un programa que determine si un año es bisiesto. Un año es bisiesto si:
- Es divisible por 4
- No es divisible por 100, a menos que sea divisible por 400

{{% note %}}
Solución:
```python
año = int(input("Ingresa un año: "))

if (año % 4 == 0 and año % 100 != 0) or (año % 400 == 0):
    print(f"{año} es un año bisiesto")
else:
    print(f"{año} no es un año bisiesto")
```
{{% /note %}}

---

## Estructuras de Control Iterativas
Permiten ejecutar un código repetidamente.

{{% note %}}
Los bucles en Python son un tipo de estructura de flujo de control que permite ejecutar un conjunto de instrucciones varias veces. Son útiles para realizar tareas repetitivas y simplificar el proceso de codificación. Hay dos tipos de bucles en Python - el bucle for y el bucle while.
{{% /note %}}

---

## Bucles For
Para iterar sobre una secuencia conocida.

```python
for i in range(5):
    print(i)
```

{{% note %}}
El bucle for se utiliza para ejecutar un conjunto de instrucciones un número fijo de veces. Se utiliza cuando se conoce el número exacto de veces que se desea repetir el conjunto de instrucciones. En este ejemplo, el bucle imprimirá los números del 0 al 4.
{{% /note %}}

---

## Función Range()
Genera secuencias numéricas.

```python
# range(parada)
for i in range(5):
    print(i)  # 0, 1, 2, 3, 4

# range(inicio, parada)
for i in range(2, 5):
    print(i)  # 2, 3, 4

# range(inicio, parada, paso)
for i in range(0, 10, 2):
    print(i)  # 0, 2, 4, 6, 8
```

{{% note %}}
La función range() permite generar secuencias numéricas. Puede tomar de 1 a 3 argumentos:
- Con un argumento: range(parada) genera números desde 0 hasta parada-1.
- Con dos argumentos: range(inicio, parada) genera números desde inicio hasta parada-1.
- Con tres argumentos: range(inicio, parada, paso) genera números desde inicio hasta parada-1, incrementando de paso en paso.
{{% /note %}}

---

## Ejercicio 8: Suma con For

Escribe un programa que sume todos los números del 1 al 10 usando un bucle for.

{{% note %}}
Solución:
```python
suma = 0
for i in range(1, 11):
    suma += i
print(f"La suma de los números del 1 al 10 es: {suma}")
```
{{% /note %}}

---

## Bucles While
Se ejecutan mientras una condición sea verdadera.

```python
i = 0
while i < 5:
    print(i)
    i += 1
```

{{% note %}}
El bucle while se utiliza cuando no sabes el número exacto de veces que quieres repetir el conjunto de instrucciones. Ejecutará el conjunto de instrucciones hasta que se cumpla una determinada condición. En este ejemplo, el bucle se ejecutará mientras i sea menor que 5, imprimiendo los números del 0 al 4.
{{% /note %}}

---

## Ejercicio 9: Factorial con While

Escribe un programa que calcule el factorial de un número usando un bucle while.

{{% note %}}
Solución:
```python
numero = int(input("Ingresa un número para calcular su factorial: "))
factorial = 1
contador = 1

while contador <= numero:
    factorial *= contador
    contador += 1

print(f"El factorial de {numero} es {factorial}")
```
{{% /note %}}

---

## Sentencias Break y Continue
Controlan el flujo dentro de los bucles.

{{% note %}}
Las sentencias break y continue se utilizan para controlar el flujo del bucle. La sentencia break se utiliza para terminar el bucle y la sentencia continue se utiliza para saltar la iteración actual del bucle y pasar a la siguiente iteración.
{{% /note %}}

---

## Ejemplo de Break

```python
for i in range(10):
    if i == 5:
        break
    print(i)
```

{{% note %}}
En este ejemplo, el bucle for itera de 0 a 9. Cuando i llega a 5, la sentencia break termina el bucle inmediatamente. Por lo tanto, solo se imprimirán los números del 0 al 4.
{{% /note %}}

---

## Ejemplo de Continue

```python
for i in range(10):
    if i % 2 == 0:
        continue
    print(i)
```

{{% note %}}
En este ejemplo, el bucle for itera de 0 a 9. Para los números pares (cuando i % 2 == 0), la sentencia continue salta a la siguiente iteración sin ejecutar el resto del código en el bucle. Por lo tanto, solo se imprimirán los números impares: 1, 3, 5, 7, 9.
{{% /note %}}

---

## Ejercicio 10: Números Primos

Escribe un programa que imprima todos los números primos entre 1 y 20.

{{% note %}}
Solución:
```python
for num in range(2, 21):
    es_primo = True
    for i in range(2, num):
        if num % i == 0:
            es_primo = False
            break
    if es_primo:
        print(num, end=" ")
```
{{% /note %}}

---

## Bucles Anidados
Bucles dentro de bucles.

```python
for i in range(3):
    for j in range(3):
        print(f"({i}, {j})")
```

{{% note %}}
Los bucles anidados son bucles dentro de bucles. Se utilizan para iterar sobre múltiples secuencias de valores y ejecutar un conjunto de instrucciones para cada combinación de valores. En este ejemplo, para cada valor de i (0, 1, 2), el bucle interno itera sobre cada valor de j (0, 1, 2), generando 9 combinaciones en total.
{{% /note %}}

---

## Ejemplo Práctico: Tabla de Multiplicación

```python
for i in range(1, 6):
    for j in range(1, 6):
        print(f"{i} x {j} = {i * j}")
    print()  # Línea en blanco entre tablas
```

{{% note %}}
Este ejemplo genera las tablas de multiplicar del 1 al 5. El bucle externo (i) recorre los números del 1 al 5, y para cada uno, el bucle interno (j) calcula y muestra el producto con los números del 1 al 5. El print() vacío al final de cada iteración del bucle externo añade una línea en blanco para separar las tablas.
{{% /note %}}

---

## Ejercicio 11: Patrón de Asteriscos

Escribe un programa que dibuje un triángulo de asteriscos:
```
*
**
***
****
*****
```

{{% note %}}
Solución:
```python
filas = 5
for i in range(1, filas + 1):
    print("*" * i)
```
{{% /note %}}

---

## Combinación de Estructuras
Usando condicionales dentro de bucles.

```python
for i in range(1, 11):
    if i % 2 == 0:
        print(f"{i} es un número par")
    else:
        print(f"{i} es un número impar")
```

{{% note %}}
Es común combinar diferentes estructuras de control. En este ejemplo, un bucle for itera sobre los números del 1 al 10, y para cada número, una estructura condicional determina si es par o impar. Esta combinación permite crear lógicas más complejas en los programas.
{{% /note %}}

---

## Ejercicio 12: FizzBuzz

Escribe un programa que imprima los números del 1 al 20, pero:
- Para múltiplos de 3, imprime "Fizz"
- Para múltiplos de 5, imprime "Buzz"
- Para múltiplos de ambos, imprime "FizzBuzz"

{{% note %}}
Solución:
```python
for i in range(1, 21):
    if i % 3 == 0 and i % 5 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)
```
{{% /note %}}

---

## Proyecto Final: Calculadora con Menú

Crea una calculadora que muestre un menú con las siguientes operaciones:
1. Suma
2. Resta
3. Multiplicación
4. División
5. Potencia
6. Salir

El programa debe pedir dos números y realizar la operación seleccionada.

{{% note %}}
Solución:
```python
# -*- coding: utf-8 -*-
while True:
    print("\nCalculadora")
    print("1. Suma")
    print("2. Resta")
    print("3. Multiplicación")
    print("4. División")
    print("5. Potencia")
    print("6. Salir")
    
    opcion = int(input("\nSelecciona una opción (1-6): "))
    
    if opcion == 6:
        print("¡Hasta luego!")
        break
        
    if opcion < 1 or opcion > 5:
        print("Opción no válida. Intenta de nuevo.")
        continue
        
    num1 = float(input("Ingresa el primer número: "))
    num2 = float(input("Ingresa el segundo número: "))
    
    if opcion == 1:
        resultado = num1 + num2
        print(f"Resultado: {num1} + {num2} = {resultado}")
    elif opcion == 2:
        resultado = num1 - num2
        print(f"Resultado: {num1} - {num2} = {resultado}")
    elif opcion == 3:
        resultado = num1 * num2
        print(f"Resultado: {num1} * {num2} = {resultado}")
    elif opcion == 4:
        if num2 == 0:
            print("Error: No se puede dividir entre cero")
        else:
            resultado = num1 / num2
            print(f"Resultado: {num1} / {num2} = {resultado}")
    elif opcion == 5:
        resultado = num1 ** num2
        print(f"Resultado: {num1} ^ {num2} = {resultado}")
```
{{% /note %}}

---

## Resumen
- Las sentencias de control permiten controlar el flujo de ejecución
- Estructuras selectivas: if, if-else, if-elif-else
- Estructuras iterativas: for, while
- Sentencias break y continue
- La indentación es crucial en Python para definir bloques
- Combinando estas estructuras podemos crear programas complejos

{{% note %}}
En esta semana hemos visto que las sentencias de control son un concepto esencial cuando se trata de programar con Python, ya que permiten al programador controlar el flujo de ejecución del programa posibilitándole, además, decidir qué parte del código ejecutar y qué código ignorar. Las estructuras selectivas y las iterativas nos dan el poder de crear programas dinámicos y flexibles.
{{% /note %}}

---

## Preguntas