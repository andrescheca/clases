+++
title = "Introducción a Criptografía y Esteganografía en Computación Forense"
outputs = ["Reveal"]
+++

### Semana 2
Hoy exploraremos los fundamentos de la criptografía y la esteganografía, su importancia en la computación forense, y realizaremos ejercicios prácticos.

{{% note %}}
Objetivos de aprendizaje de la sesión:
- Comprender los conceptos fundamentales de criptografía y esteganografía
- Entender su relevancia en la computación forense
- Aprender técnicas básicas de cifrado y ocultamiento de información
- Practicar con herramientas reales usadas en el campo
- Analizar casos de estudio y aplicaciones prácticas
{{% /note %}}

---

### Importancia en Computación Forense

{{% fragment class="bullet-point" %}}La criptografía y la esteganografía son fundamentales en la computación forense:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Protección de evidencia digital{{% /fragment %}}
{{% fragment class="bullet-point" %}}Detección de información oculta{{% /fragment %}}
{{% fragment class="bullet-point" %}}Análisis de comunicaciones cifradas{{% /fragment %}}
{{% fragment class="bullet-point" %}}Verificación de integridad de datos{{% /fragment %}}

{{% note %}}
Desglose de la importancia en el contexto forense:

1. Protección de evidencia digital:
   - Asegura la integridad de la evidencia recolectada
   - Previene manipulación no autorizada
   - Mantiene cadena de custodia verificable
   - Permite validación independiente

2. Detección de información oculta:
   - Técnicas de escaneo de datos ocultos
   - Análisis de metadatos y espacios no utilizados
   - Identificación de patrones sospechosos
   - Recuperación de información eliminada

3. Análisis de comunicaciones:
   - Reconstrucción de comunicaciones cifradas
   - Identificación de protocolos y algoritmos
   - Análisis de tráfico y metadata
   - Correlación de comunicaciones

4. Verificación de integridad:
   - Uso de hashes criptográficos
   - Firma digital de evidencias
   - Timestamping de hallazgos
   - Documentación forense
{{% /note %}}

---

### Introducción a la Criptografía

{{% fragment class="bullet-point" %}}La criptografía es la práctica de asegurar la comunicación en presencia de terceros.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Objetivos principales: confidencialidad, integridad, autenticación y no repudio.{{% /fragment %}}

{{% note %}}
Fundamentos de criptografía:

1. Componentes básicos:
   - Mensaje original (plaintext)
   - Algoritmo de cifrado
   - Clave(s)
   - Mensaje cifrado (ciphertext)
   - Algoritmo de descifrado

2. Los objetivos en detalle:
   - Confidencialidad: Solo receptores autorizados pueden leer
   - Integridad: Detectar modificaciones no autorizadas
   - Autenticación: Verificar identidad del emisor
   - No repudio: Emisor no puede negar envío

3. Principios de diseño:
   - Principio de Kerckhoffs: seguridad basada en la clave
   - Principio de Shannon: redundancia mínima
   - Robustez matemática demostrable
   - Resistencia a ataques conocidos
{{% /note %}}

---

### Historia de la Criptografía

{{% fragment class="bullet-point" %}}Antigüedad: Cifrado César (ROT13){{% /fragment %}}
{{% fragment class="bullet-point" %}}Edad Media: Cifrado de sustitución{{% /fragment %}}
{{% fragment class="bullet-point" %}}Segunda Guerra Mundial: Máquina Enigma{{% /fragment %}}
{{% fragment class="bullet-point" %}}Era moderna: DES, AES, RSA{{% /fragment %}}

{{% note %}}
Evolución histórica detallada:

1. Cifrado César:
   - Desplazamiento del alfabeto por n posiciones
   - Usado en comunicaciones militares romanas
   - Vulnerable a análisis de frecuencia
   - Base para cifrados de sustitución posteriores

2. Cifrados medievales:
   - Desarrollo de cifrados polialfabéticos
   - Cipher de Vigenère (siglo XVI)
   - Uso de códigos y nomencladores
   - Primeros métodos de criptoanálisis

3. Enigma en WWII:
   - Sistema electromecánico de rotores
   - Cambio de configuración diario
   - Descifrado en Bletchley Park
   - Impacto crucial en la guerra

4. Criptografía moderna:
   - DES (1977): Primer estándar público
   - AES (2001): Reemplazo de DES
   - RSA (1978): Revolución asimétrica
   - Desarrollo de criptografía cuántica
{{% /note %}}

---

{{% section %}}

### Cifrado por Sustitución Simple

- Descifraremos el mensaje: "DLIZ PLX GLOCA"
- Usando la tabla de sustitución dada

{{% note %}}
El cifrado por sustitución simple es uno de los métodos más antiguos de cifrado:
- Cada letra se sustituye por otra letra fija
- La sustitución debe ser consistente
- Es un cifrado monoalfabético
- Fue usado extensivamente en comunicaciones históricas
{{% /note %}}

---

### Paso 1: Tabla de Sustitución

```
Alfabeto Original:  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z
                    ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓
Alfabeto Cifrado:   Z  E  B  R  A  S  C  D  F  G  H  I  J  K  L  M  N  O  P  Q  T  U  V  W  X  Y
```

{{% note %}}
Características de la tabla:
- Es una permutación del alfabeto
- Cada letra tiene una única correspondencia
- La sustitución es bidireccional
- Se puede representar como un mapeo uno a uno
- La tabla sirve tanto para cifrar como para descifrar
{{% /note %}}

---

### Paso 2: Proceso de Descifrado

Primera palabra "DLIZ":
```
D → H (buscamos D en alfabeto cifrado)
L → O (buscamos L en alfabeto cifrado)
I → L (buscamos I en alfabeto cifrado)
Z → A (buscamos Z en alfabeto cifrado)
```
Por lo tanto: DLIZ → HOLA

{{% note %}}
Proceso detallado:
1. Para cada letra del mensaje cifrado:
   - Localizar la letra en el alfabeto cifrado
   - Encontrar la letra correspondiente en el alfabeto original
2. Los espacios se mantienen igual
3. La sustitución es consistente en todo el mensaje
4. El proceso es reversible usando la misma tabla
{{% /note %}}

---

### Paso 3: Descifrando el Resto

Segunda palabra "PLX":
```
P → S (buscamos P en alfabeto cifrado)
L → O (buscamos L en alfabeto cifrado)
X → Y (buscamos X en alfabeto cifrado)
```
Por lo tanto: PLX → SOY

{{% note %}}
Observaciones del proceso:
- La letra L aparece múltiples veces y siempre se descifra como O
- Los espacios ayudan a identificar palabras
- El patrón de letras repetidas se mantiene
- La frecuencia de las letras se preserva
{{% /note %}}

---

### Paso 4: Palabra Final

Última palabra "GLOCA":

```
G → J (buscamos G en alfabeto cifrado)
L → O (buscamos L en alfabeto cifrado)
O → R (buscamos O en alfabeto cifrado)
C → G (buscamos C en alfabeto cifrado)
A → E (buscamos A en alfabeto cifrado)
```
Por lo tanto: GLOCA → JORGE

{{% note %}}
Proceso correcto de descifrado:
1. Para descifrar, siempre:
   - Ubicar la letra en la fila INFERIOR (alfabeto cifrado)
   - Ver qué letra está ARRIBA en el alfabeto original
   - Esa es la letra descifrada
2. Por ejemplo con 'G':
   - Encontramos G en fila inferior
   - Miramos directamente arriba
   - Vemos J
   - Por lo tanto G descifra como J
3. Es importante mantener este orden:
   - Primero fila inferior (cifrado)
   - Luego fila superior (original)
   - Nunca al revés
{{% /note %}}


---

### Resultado Final

```
Mensaje cifrado:   DLIZ PLX GLOCA
Mensaje original:  HOLA SOY JORGE
```

{{% note %}}
Análisis del resultado:
1. Características observadas:
   - Preservación de espacios
   - Consistencia en la sustitución
   - Mantenimiento de la estructura
   - Patrón de letras preservado

2. Vulnerabilidades:
   - Análisis de frecuencia posible
   - Patrones lingüísticos visibles
   - Estructura de palabras intacta
{{% /note %}}

---

### Consideraciones de Seguridad

1. Vulnerabilidades:
   - Análisis de frecuencia
   - Patrones lingüísticos
   - Solo 26! posibles claves

2. Fortalezas históricas:
   - Simple de implementar
   - Fácil de usar
   - No requiere herramientas especiales

{{% note %}}
Aspectos de seguridad importantes:
1. Análisis de frecuencia:
   - Las letras más comunes en español: E, A, O
   - Patrones de dobles letras: RR, LL
   - Palabras cortas comunes: DE, LA, EL
   
2. Mejoras posibles:
   - Usar múltiples alfabetos (Vigenère)
   - Combinar con transposición
   - Agregar caracteres nulos
{{% /note %}}


{{% /section %}}

---
### Otras sustituciones

{{< imgref src="/images/2024/08/substitution_example.png" alt="Otro ejemplo de sustitución" class="img">}}

{{% note %}}
Variantes de cifrados de sustitución:

1. Sustitución monoalfabética:
   - Cada letra tiene un único reemplazo
   - Se mantiene durante todo el mensaje
   - Ejemplos: Cifrado César, Atbash
   - 26! posibles claves en alfabeto inglés

2. Sustitución polialfabética:
   - Múltiples alfabetos de sustitución
   - Cambia según posición o palabra clave
   - Ejemplo: Cifrado Vigenère
   - Más resistente a análisis de frecuencia

3. Sustitución homofónica:
   - Una letra puede tener múltiples sustitutos
   - Compensa frecuencias del lenguaje
   - Usado en el cifrado del Asesino del Zodiaco
   - Más difícil de criptanalizar

4. Técnicas de análisis:
   - Frecuencia de letras
   - Patrones de palabras comunes
   - Análisis de bigramas/trigramas
   - Uso de estadísticas del lenguaje
{{% /note %}}

---

{{% section %}}

### Cifrado Vigenère - Ejemplo Práctico
- Cifraremos el mensaje "HOLA MUNDO"
- Usando la clave "CLAVE"

{{% note %}}
El cifrado Vigenère es un cifrado polialfabético que usa una clave para determinar múltiples alfabetos de sustitución. Ventajas:
- Más seguro que cifrado simple
- Múltiples alfabetos de sustitución
- Resistente a análisis de frecuencia básico
{{% /note %}}

---

### Paso 1: Alinear mensaje y clave

```
Mensaje:    H O L A M U N D O
Clave:      C L A V E C L A V
```

{{% note %}}
Aspectos importantes de la alineación:
- La clave se repite cíclicamente
- Los espacios en el mensaje se ignoran para la clave
- Mantener mayúsculas para consistencia
- Cada letra de la clave define un alfabeto diferente
{{% /note %}}

---

### Paso 2: Tabla de Vigenère
#### Tabla de Referencia

```
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
A   A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
B   B C D E F G H I J K L M N O P Q R S T U V W X Y Z A
C   C D E F G H I J K L M N O P Q R S T U V W X Y Z A B
D   D E F G H I J K L M N O P Q R S T U V W X Y Z A B C
E   E F G H I J K L M N O P Q R S T U V W X Y Z A B C D
F   F G H I J K L M N O P Q R S T U V W X Y Z A B C D E
G   G H I J K L M N O P Q R S T U V W X Y Z A B C D E F
H   H I J K L M N O P Q R S T U V W X Y Z A B C D E F G
I   I J K L M N O P Q R S T U V W X Y Z A B C D E F G H
J   J K L M N O P Q R S T U V W X Y Z A B C D E F G H I
```

{{% note %}}
Entendiendo la tabla Vigenère:

1. Estructura de la tabla:
   - Es una matriz de 26x26 letras (mostramos primeras 10 filas)
   - Primera fila y columna son el alfabeto normal
   - Cada fila siguiente rota el alfabeto una posición
   - Es simétrica en su uso (cifrado/descifrado)

2. Cómo usar la tabla:
   - Fila: determinada por letra de la CLAVE
   - Columna: determinada por letra del MENSAJE
   - Intersección: letra del texto cifrado
   - Para descifrar: 
     * Fila: letra de la CLAVE
     * Buscar letra cifrada en esa fila 
     * La columna donde está da la letra original

3. Propiedades importantes:
   - Es un cifrado polialfabético
   - Cada fila es un César diferente
   - La primera fila es el alfabeto sin rotar
   - Las filas posteriores rotan +1, +2, etc.

4. Ventajas del diseño:
   - Fácil de usar con la tabla
   - Múltiples alfabetos de sustitución
   - Rompe estadísticas de frecuencia
   - Más seguro que cifrado simple
{{% /note %}}

---

### Paso 3: Proceso de Cifrado

Para cada par de letras (mensaje, clave):
```
H + C = J  (fila C, columna H)
O + L = Z  (fila L, columna O)
L + A = L  (fila A, columna L)
A + V = V  (fila V, columna A)
M + E = Q  (fila E, columna M)
```

{{% note %}}
Proceso detallado:
1. Tomar letra de la clave → determina la fila
2. Tomar letra del mensaje → determina la columna
3. Intersección → letra del mensaje cifrado
4. Repetir para cada posición
5. Los espacios se mantienen sin cifrar
{{% /note %}}

---

### Paso 4: Completando el Cifrado

```
U + C = W  (fila C, columna U)
N + L = Y  (fila L, columna N)
D + A = D  (fila A, columna D)
O + V = J  (fila V, columna O)
```

Resultado final:
```
Original:  HOLA MUNDO
Clave:     CLAV ECLAV
Cifrado:   JZLV QWYDJ
```

{{% note %}}
Verificación del proceso:
- Cada letra tiene su propia sustitución
- El proceso es reversible
- Se necesita la clave para descifrar
- Los patrones del mensaje original quedan ocultos
- La misma letra puede cifrarse a diferentes valores
{{% /note %}}

---

### Ventajas de Vigenère

1. Polialfabético
   - Cada letra puede cifrarse de diferentes formas
   - Rompe patrones de frecuencia

2. Clave Variable
   - Longitud de clave flexible
   - Mayor longitud = mayor seguridad

3. Histórico
   - Considerado "le chiffre indéchiffrable"
   - Usado por más de 300 años

{{% note %}}
Importancia histórica:
- Desarrollado en el siglo XVI
- Primer cifrado polialfabético práctico
- Resistente a técnicas de la época
- Base para cifrados modernos
- Ejemplo de evolución criptográfica
{{% /note %}}

{{% /section %}}

---

### Tipos de Criptografía

1. Simétrica
   {{% fragment class="bullet-point" %}}Usa la misma clave para cifrar y descifrar{{% /fragment %}}
   {{% fragment class="bullet-point" %}}Ejemplos: AES, DES{{% /fragment %}}

2. Asimétrica
   {{% fragment class="bullet-point" %}}Usa un par de claves: pública y privada{{% /fragment %}}
   {{% fragment class="bullet-point" %}}Ejemplos: RSA, ECC{{% /fragment %}}

{{% note %}}
Detalles técnicos de los tipos de criptografía:

1. Criptografía Simétrica:
   a) Operación:
      - Misma clave para cifrar y descifrar
      - Operaciones rápidas (XOR principalmente)
      - Bloques o flujo de datos
      - Requiere clave compartida segura

   b) Algoritmos principales:
      AES:
      - Tamaños de bloque: 128 bits
      - Claves: 128, 192, 256 bits
      - Rondas: 10, 12, 14
      - Operaciones: SubBytes, ShiftRows, MixColumns, AddRoundKey

      DES:
      - Tamaño de bloque: 64 bits
      - Clave: 56 bits
      - 16 rondas de procesamiento
      - Considerado obsoleto por longitud de clave

2. Criptografía Asimétrica:
   a) Funcionamiento:
      - Par de claves matemáticamente relacionadas
      - Lo cifrado con una solo se descifra con la otra
      - Basado en problemas matemáticos complejos
      - Permite firma digital y distribución de claves

   b) Algoritmos principales:
      RSA:
      - Basado en factorización de números primos
      - Claves típicas: 2048-4096 bits
      - Operaciones: exponenciación modular
      - Usado en SSL/TLS, PGP

      ECC (Elliptic Curve):
      - Basado en curvas elípticas sobre campos finitos
      - Claves más cortas que RSA
      - Más eficiente computacionalmente
      - Popular en dispositivos móviles

3. Comparación práctica:
   - Simétrica: Mejor para grandes volúmenes de datos
   - Asimétrica: Mejor para intercambio de claves
   - Uso híbrido común en práctica
   - Consideraciones de rendimiento importantes
{{% /note %}}

---

### Ejercicio Guiado: Cifrado César

```python
def cifrado_cesar(texto, desplazamiento):
    resultado = ""
    for char in texto:
        if char.isalpha():
            ascii_offset = 65 if char.isupper() else 97
            resultado += chr((ord(char) - ascii_offset + desplazamiento) % 26 + ascii_offset)
        else:
            resultado += char
    return resultado

mensaje = "HELLO WORLD"
cifrado = cifrado_cesar(mensaje, 3)
print(f"Mensaje original: {mensaje}")
print(f"Mensaje cifrado: {cifrado}")
```

{{% note %}}
Análisis detallado del código:

1. Función cifrado_cesar:
   - Parámetros:
     * texto: cadena a cifrar
     * desplazamiento: número de posiciones a mover

   - Procesamiento:
     * Recorre cada carácter del texto
     * Determina si es letra (isalpha())
     * Preserva mayúsculas/minúsculas
     * Mantiene espacios y símbolos

2. Aspectos técnicos:
   - ascii_offset:
     * 65 para mayúsculas (ASCII 'A')
     * 97 para minúsculas (ASCII 'a')
     * Permite manejar ambos casos

   - Fórmula de cifrado:
     * ord(char): convierte carácter a ASCII
     * -ascii_offset: normaliza a 0-25
     * +desplazamiento: aplica el cifrado
     * %26: mantiene en rango alfabético
     * +ascii_offset: vuelve a rango ASCII

3. Consideraciones prácticas:
   - Modularidad del código
   - Manejo de casos especiales
   - Facilidad de modificación
   - Base para cifrados más complejos

4. Ejercicios sugeridos:
   - Implementar descifrado
   - Manejar caracteres especiales
   - Agregar validación de entrada
   - Optimizar el código
{{% /note %}}

---

### Ejercicio para Estudiantes: Cifrado César

1. Implementa la función de descifrado César.
2. Cifra y descifra el mensaje: "CRYPTOGRAPHY IS FUN"
3. ¿Qué sucede si usas un desplazamiento de 26?

{{% note %}}
Guía detallada para ejercicios:

1. Implementación del descifrado:
   - Opciones de implementación:
     * Reutilizar cifrado con desplazamiento negativo
     * Crear función específica de descifrado
     * Implementar cifrado bidireccional
   
   - Pseudocódigo sugerido:
     ```python
     def descifrado_cesar(texto_cifrado, desplazamiento):
         return cifrado_cesar(texto_cifrado, -desplazamiento)
     ```

2. Proceso paso a paso:
   a) Cifrado de "CRYPTOGRAPHY IS FUN":
      - Aplicar desplazamiento a cada letra
      - Mantener espacios intactos
      - Verificar resultado esperado
   
   b) Descifrado:
      - Aplicar desplazamiento inverso
      - Confirmar recuperación del mensaje
      - Validar resultado

3. Análisis del desplazamiento 26:
   - Efecto matemático:
     * (x + 26) % 26 = x
     * Vuelve al texto original
     * Demuestra naturaleza cíclica
   
   - Implicaciones:
     * Periodicidad del cifrado
     * Limitaciones de seguridad
     * Importancia del módulo 26

4. Extensiones sugeridas:
   - Agregar soporte para números
   - Implementar cifrado con clave
   - Análisis de frecuencia
   - Ataque por fuerza bruta
{{% /note %}}

---

### Atacando cifrados

{{% fragment class="bullet-point" %}}Fuerza Bruta{{% /fragment %}}
{{% fragment class="bullet-point" %}}Criptoanálisis{{% /fragment %}}
{{% fragment class="bullet-point" %}}Diccionarios{{% /fragment %}}

{{% note %}}
Métodos detallados de ataque:

1. Fuerza Bruta:
   a) Características:
      - Prueba todas las combinaciones posibles
      - Garantiza encontrar la solución
      - Costoso computacionalmente
      - Tiempo proporcional al espacio de claves

   b) Implementación:
      - Automatización del proceso
      - Paralelización posible
      - Optimizaciones específicas
      - Criterios de terminación

2. Criptoanálisis:
   a) Técnicas:
      - Análisis de frecuencia
      - Patrones en el texto cifrado
      - Vulnerabilidades conocidas
      - Ataques de canal lateral

   b) Herramientas:
      - Análisis estadístico
      - Programas especializados
      - Bases de datos de patrones
      - Recursos computacionales

3. Ataques por Diccionario:
   a) Metodología:
      - Uso de palabras comunes
      - Variaciones predecibles
      - Reglas de mutación
      - Optimización de búsqueda

   b) Ventajas/Desventajas:
      - Más rápido que fuerza bruta
      - Limitado a claves en diccionario
      - Eficaz contra contraseñas débiles
      - Requiere buenos diccionarios

4. Consideraciones prácticas:
   - Limitaciones legales
   - Recursos necesarios
   - Tiempo disponible
   - Contramedidas existentes
{{% /note %}}

---

### Ejemplo de un ataque con diccionario usando hashcat

Supongamos que tenemos este hash: 5a3e3cccff6330886e1d9b7b057a6116

```
hashcat -m 0 -a 0 5a3e3cccff6330886e1d9b7b057a6116 /usr/share/wordlists/rockyou.txt
```

{{% note %}}
Análisis detallado de hashcat:

1. Componentes del comando:
   a) hashcat:
      - Software líder en cracking de hashes
      - Soporte GPU para aceleración
      - Múltiples algoritmos soportados
      - Altamente configurable

   b) Parámetros:
      - -m 0: Modo MD5 (algoritmos comunes)
        * 0: MD5
        * 100: SHA1
        * 1000: NTLM
        * 1800: sha512crypt
      
      - -a 0: Ataque tipo diccionario
        * 0: Straight (diccionario)
        * 1: Combinación
        * 3: Brute force
        * 6: Híbrido

2. Rockyou.txt:
   - Diccionario popular de contraseñas
   - Originado de una brecha real
   - Contiene millones de contraseñas
   - Organizado por frecuencia

3. Optimizaciones:
   - Uso de GPU:
     * CUDA para NVIDIA
     * OpenCL para AMD
     * Procesamiento paralelo
   
   - Reglas de mutación:
     * best64.rule
     * T0XlC.rule
     * leetspeak.rule
     * Personalizadas

4. Mejores prácticas:
   - Verificar integridad del hash
   - Usar reglas apropiadas
   - Monitorear rendimiento
   - Documentar resultados
{{% /note %}}

---

### Desglose del Comando Hashcat

{{% fragment class="bullet-point" %}}`hashcat`: El comando para ejecutar hashcat{{% /fragment %}}

{{% fragment class="bullet-point" %}}`-m 0`: Especifica el modo de hash. El modo 0 es para hashes MD5. Si tu hash no es MD5, necesitarás cambiar este valor.{{% /fragment %}}

{{% fragment class="bullet-point" %}}`-a 0`: Especifica el modo de ataque. El modo 0 es para un ataque directo con lista de palabras.{{% /fragment %}}

{{% fragment class="bullet-point" %}}`5a3e3cccff6330886e1d9b7b057a6116`: Este es el hash que se intentará crackear.{{% /fragment %}}

{{% fragment class="bullet-point" %}}`/usr/share/wordlists/rockyou.txt`: Esta es la ruta a la lista de palabras rockyou.txt.{{% /fragment %}}

{{% note %}}
Detalles técnicos del comando hashcat:

1. Modos de hash (-m):
   - Formatos comunes:
     * MD5: -m 0
     * SHA1: -m 100
     * SHA256: -m 1400
     * SHA512: -m 1700
     * bcrypt: -m 3200
     * WPA/WPA2: -m 2500

2. Modos de ataque (-a):
   a) Diccionario (-a 0):
      - Lee palabras del archivo
      - Sin modificaciones
      - Útil para contraseñas comunes

   b) Combinación (-a 1):
      - Combina dos diccionarios
      - Útil para frases
      - Mayor cobertura

   c) Fuerza bruta (-a 3):
      - Genera todas las combinaciones
      - Definir charset
      - Especificar longitud

   d) Híbrido (-a 6, -a 7):
      - Combina diccionario y brute force
      - Mayor flexibilidad
      - Personalizable

3. Formatos de hash:
   - Verificación automática
   - Sensible a mayúsculas
   - Debe ser exacto
   - Sin espacios extras

4. Consideraciones de rendimiento:
   - Tamaño del diccionario
   - Capacidad de GPU
   - Memoria disponible
   - Tiempo de ejecución
{{% /note %}}

---

### Introducción a la Esteganografía

- La esteganografía es el arte de ocultar información dentro de otros datos aparentemente inofensivos.
- Diferencia clave con la criptografía: la esteganografía oculta la existencia misma del mensaje.

{{% note %}}
Fundamentos de esteganografía:

1. Conceptos básicos:
   a) Componentes:
      - Mensaje a ocultar
      - Medio portador (carrier)
      - Algoritmo de ocultamiento
      - Clave (opcional)
      - Mensaje estego resultante

   b) Tipos de medios:
      - Imágenes (más común)
      - Audio
      - Video
      - Texto
      - Protocolos de red

2. Técnicas principales:
   a) Sustitución:
      - LSB (Least Significant Bit)
      - Bits de color en imágenes
      - Coeficientes de transformada
      - Metadata

   b) Inyección:
      - Datos después de EOF
      - Espacios reservados
      - Campos no utilizados
      - Headers extendidos

3. Propiedades deseables:
   - Imperceptibilidad
   - Capacidad adecuada
   - Robustez
   - Seguridad

4. Aplicaciones:
   a) Legítimas:
      - Marcas de agua digitales
      - Comunicación segura
      - Protección de copyright
      - Autenticación

   b) Consideraciones forenses:
      - Detección
      - Extracción
      - Análisis
      - Documentación
{{% /note %}}

---

### Historia de la Esteganografía

- Antigua Grecia: Mensajes ocultos en tablillas de cera
- Edad Media: Tinta invisible
- Segunda Guerra Mundial: Microfilms
- Era digital: Esteganografía en imágenes, audio y video

{{% note %}}
Evolución histórica detallada:

1. Antigua Grecia:
   a) Técnicas clásicas:
      - Tablillas de cera:
        * Escribir en madera y cubrir con cera
        * Mensaje oculto bajo escritura visible
        * Usado para comunicaciones militares
      
      - Tatuajes en esclavos:
        * Mensaje tatuado en cuero cabelludo
        * Esperar crecimiento del cabello
        * Método de Histieo (según Heródoto)

2. Edad Media:
   a) Tintas invisibles:
      - Jugos orgánicos (limón, leche)
      - Revelado por calor
      - Sales metálicas
      - Reactivos químicos

   b) Técnicas físicas:
      - Marcas microscópicas
      - Papel perforado
      - Dobleces específicos
      - Posición de sellos

3. Segunda Guerra Mundial:
   a) Microfilms:
      - Reducción fotográfica
      - Ocultamiento en objetos cotidianos
      - Puntos micropunto
      - Sistemas de microfotografía

   b) Métodos químicos:
      - Tintas especiales
      - Películas fotosensibles
      - Reveladores específicos
      - Códigos en periódicos

4. Era Digital:
   a) Técnicas modernas:
      - LSB en imágenes
      - Marcas de agua digitales
      - Esteganografía de red
      - Covert channels

   b) Aplicaciones actuales:
      - Protección de derechos de autor
      - Comunicaciones seguras
      - Autenticación digital
      - Privacidad de datos
{{% /note %}}

---

### Ejemplo - Secuestrados por las FARC

<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/184253099&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/michael-zelenko" title="Michael Zelenko" target="_blank" style="color: #cccccc; text-decoration: none;">Michael Zelenko</a> · <a href="https://soundcloud.com/michael-zelenko/better-days-by-natalia-gutierrez-y-angelo" title="&quot;Better Days&quot; by Natalia Gutierrez Y Angelo" target="_blank" style="color: #cccccc; text-decoration: none;">&quot;Better Days&quot; by Natalia Gutierrez Y Angelo</a></div>

[Artículo](https://www.theverge.com/2015/1/7/7483235/the-code-colombian-army-morsecode-hostages) de The Verge

{{% note %}}
Análisis del caso FARC:

1. Contexto histórico:
   a) Situación:
      - Secuestros en Colombia
      - Necesidad de comunicación secreta
      - Uso de radio pública
      - Limitaciones técnicas

   b) Desafíos:
      - Comunicación unidireccional
      - Vigilancia constante
      - Recursos limitados
      - Necesidad de disimulo

2. Técnica empleada:
   a) Código Morse en música:
      - Inserción en canciones populares
      - Patrones rítmicos específicos
      - Frecuencias seleccionadas
      - Timing preciso

   b) Características:
      - Imperceptible para oyentes casuales
      - Resistente a interferencias
      - Fácil de decodificar por destinatarios
      - Difícil de detectar sin conocimiento previo

3. Implicaciones forenses:
   a) Detección:
      - Análisis de espectro
      - Patrones temporales
      - Correlación con eventos
      - Metadata de transmisión

   b) Documentación:
      - Registros de transmisión
      - Análisis de contenido
      - Patrones de comunicación
      - Evidencia técnica

4. Lecciones aprendidas:
   - Importancia de canales creativos
   - Uso de medios cotidianos
   - Balance seguridad/disimulo
   - Adaptación a limitaciones
{{% /note %}}

---

### Técnicas de Esteganografía Digital

1. Least Significant Bit (LSB)
   - Modifica los bits menos significativos de los píxeles en una imagen

2. Inyección de metadatos
   - Oculta información en los metadatos de archivos

3. Esteganografía de espectro ensanchado
   - Distribuye la información a lo largo de todo el espectro de frecuencias de una señal

{{% note %}}
Análisis detallado de técnicas digitales:

1. LSB (Least Significant Bit):
   a) Funcionamiento:
      - Modificación sutil de bits
      - Impacto visual mínimo
      - Alta capacidad de datos
      - Implementación simple

   b) Consideraciones técnicas:
      - Selección de bits a modificar
      - Patrones de inserción
      - Compresión posterior
      - Detección estadística

2. Inyección de metadatos:
   a) Técnicas:
      - Campos EXIF en imágenes
      - ID3 tags en audio
      - Campos personalizados
      - Headers extendidos

   b) Ventajas/Desventajas:
      - Fácil implementación
      - Capacidad limitada
      - Vulnerable a limpieza
      - Preservación en copias

3. Espectro ensanchado:
   a) Metodología:
      - Distribución de señal
      - Modulación de frecuencia
      - Códigos de dispersión
      - Sincronización

   b) Aplicaciones:
      - Marcas de agua robustas
      - Comunicaciones seguras
      - Autenticación
      - Anti-jamming

4. Consideraciones forenses:
   - Métodos de detección
   - Herramientas de análisis
   - Preservación de evidencia
   - Documentación técnica
{{% /note %}}

---

### Esteganografía LSB con Herramientas de Kali (1)

1. Instalar steghide (si no está instalado):

```
sudo apt-get install steghide
```

2. Ocultar un mensaje en una imagen:

```
steghide embed -cf pikachu.jpg -ef mensaje.txt -sf imagen_secreta.jpg
```

--- 

### Esteganografía LSB con Herramientas de Kali (2)

Entendiendo el comando:

- `-cf`: archivo de cubierta (imagen original)
- `-ef`: archivo a ocultar
- `-sf`: archivo de salida (imagen con mensaje oculto)

---

### Extrayendo el mensaje

```
steghide extract -sf imagen_secreta.jpg -xf mensaje_extraido.txt
```

---

### Extrayendo el mensaje (2)

Entendiendo el comando: 

- `-sf`: archivo fuente (imagen con mensaje oculto)
- `-xf`: archivo de extracción (donde se guardará el mensaje)

---

### Criptografía vs Esteganografía: Objetivos Principales

{{% fragment class="bullet-point" %}}Criptografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Objetivo: Hacer el mensaje ilegible{{% /fragment %}}
{{% fragment class="bullet-point" %}}Se sabe que existe información secreta{{% /fragment %}}

{{% fragment class="bullet-point" %}}Esteganografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Objetivo: Ocultar la existencia del mensaje{{% /fragment %}}
{{% fragment class="bullet-point" %}}No se sabe que existe información secreta{{% /fragment %}}

---

### Criptografía vs Esteganografía: Métodos

{{% fragment class="bullet-point" %}}Criptografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Utiliza algoritmos matemáticos{{% /fragment %}}
{{% fragment class="bullet-point" %}}Transforma el contenido del mensaje{{% /fragment %}}

{{% fragment class="bullet-point" %}}Esteganografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Utiliza técnicas de ocultamiento{{% /fragment %}}
{{% fragment class="bullet-point" %}}Mantiene el contenido intacto, lo esconde{{% /fragment %}}

---

### Criptografía vs Esteganografía: Detección

{{% fragment class="bullet-point" %}}Criptografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}La presencia de datos cifrados es evidente{{% /fragment %}}
{{% fragment class="bullet-point" %}}Puede levantar sospechas{{% /fragment %}}

{{% fragment class="bullet-point" %}}Esteganografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Difícil de detectar sin técnicas específicas{{% /fragment %}}
{{% fragment class="bullet-point" %}}Puede pasar desapercibida{{% /fragment %}}

---

### Combinación de Criptografía y Esteganografía

{{% fragment class="bullet-point" %}}Cifrar el mensaje (Criptografía){{% /fragment %}}
{{% fragment class="bullet-point" %}}Ocultar el mensaje cifrado (Esteganografía){{% /fragment %}}
{{% fragment class="bullet-point" %}}Ventajas:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Doble capa de seguridad{{% /fragment %}}
{{% fragment class="bullet-point" %}}Protección contra múltiples tipos de ataques{{% /fragment %}}

---

### Implicaciones Forenses

{{% fragment class="bullet-point" %}}Criptografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Enfoque en romper o eludir el cifrado{{% /fragment %}}
{{% fragment class="bullet-point" %}}Análisis de patrones en datos cifrados{{% /fragment %}}

{{% fragment class="bullet-point" %}}Esteganografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Búsqueda de anomalías en archivos aparentemente normales{{% /fragment %}}
{{% fragment class="bullet-point" %}}Uso de herramientas de detección esteganográfica{{% /fragment %}}

---

### Desafíos Legales y Éticos

{{% fragment class="bullet-point" %}}Criptografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Debates sobre "puertas traseras" y acceso gubernamental{{% /fragment %}}
{{% fragment class="bullet-point" %}}Protección de privacidad vs seguridad nacional{{% /fragment %}}

{{% fragment class="bullet-point" %}}Esteganografía:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Potencial uso en actividades ilícitas{{% /fragment %}}
{{% fragment class="bullet-point" %}}Desafíos en la detección y regulación{{% /fragment %}}

---
### ¿Preguntas?
