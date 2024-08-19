+++
title = "Introducción a Criptografía y Esteganografía en Computación Forense"
outputs = ["Reveal"]
+++

### Semana 2
Hoy exploraremos los fundamentos de la criptografía y la esteganografía, su importancia en la computación forense, y realizaremos ejercicios prácticos.

---

### Importancia en Computación Forense

{{% fragment class="bullet-point" %}}La criptografía y la esteganografía son fundamentales en la computación forense:{{% /fragment %}}
{{% fragment class="bullet-point" %}}Protección de evidencia digital{{% /fragment %}}
{{% fragment class="bullet-point" %}}Detección de información oculta{{% /fragment %}}
{{% fragment class="bullet-point" %}}Análisis de comunicaciones cifradas{{% /fragment %}}
{{% fragment class="bullet-point" %}}Verificación de integridad de datos{{% /fragment %}}

---

### Introducción a la Criptografía

{{% fragment class="bullet-point" %}}La criptografía es la práctica de asegurar la comunicación en presencia de terceros.{{% /fragment %}}
{{% fragment class="bullet-point" %}}Objetivos principales: confidencialidad, integridad, autenticación y no repudio.{{% /fragment %}}

---

### Historia de la Criptografía

{{% fragment class="bullet-point" %}}Antigüedad: Cifrado César (ROT13){{% /fragment %}}
{{% fragment class="bullet-point" %}}Edad Media: Cifrado de sustitución{{% /fragment %}}
{{% fragment class="bullet-point" %}}Segunda Guerra Mundial: Máquina Enigma{{% /fragment %}}
{{% fragment class="bullet-point" %}}Era moderna: DES, AES, RSA{{% /fragment %}}

---

### Ejemplo de sustitución

| **Plaintext alphabet** | A B C D E F G H I J K L M N O P Q R S T U V W X Y Z |
|------------------------|----------------------------|
| **Ciphertext alphabet**| Z E B R A S C D F G H I J K L M N O P Q T U V W X Y |

Descifremos un mensaje:
DLIZ PLX GLOCA

---

### Otras sustituciones

{{< imgref src="/images/2024/08/substitution_example.png" alt="Otro ejemplo de sustitución" class="img">}}

---

### Tipos de Criptografía

1. Simétrica
   {{% fragment class="bullet-point" %}}Usa la misma clave para cifrar y descifrar{{% /fragment %}}
   {{% fragment class="bullet-point" %}}Ejemplos: AES, DES{{% /fragment %}}

2. Asimétrica
   {{% fragment class="bullet-point" %}}Usa un par de claves: pública y privada{{% /fragment %}}
   {{% fragment class="bullet-point" %}}Ejemplos: RSA, ECC{{% /fragment %}}

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

### Ejercicio para Estudiantes: Cifrado César

1. Implementa la función de descifrado César.
2. Cifra y descifra el mensaje: "CRYPTOGRAPHY IS FUN"
3. ¿Qué sucede si usas un desplazamiento de 26?

---

### Atacando cifrados

{{% fragment class="bullet-point" %}}Fuerza Bruta{{% /fragment %}}
{{% fragment class="bullet-point" %}}Criptoanálisis{{% /fragment %}}
{{% fragment class="bullet-point" %}}Diccionarios{{% /fragment %}}

---

### Ejemplo de un ataque con diccionario usando hashcat

Supongamos que tenemos este hash: 5a3e3cccff6330886e1d9b7b057a6116

```
hashcat -m 0 -a 0 5a3e3cccff6330886e1d9b7b057a6116 /usr/share/wordlists/rockyou.txt
```

--- 

### Desglose del Comando Hashcat

{{% fragment class="bullet-point" %}}`hashcat`: El comando para ejecutar hashcat{{% /fragment %}}

{{% fragment class="bullet-point" %}}`-m 0`: Especifica el modo de hash. El modo 0 es para hashes MD5. Si tu hash no es MD5, necesitarás cambiar este valor.{{% /fragment %}}

{{% fragment class="bullet-point" %}}`-a 0`: Especifica el modo de ataque. El modo 0 es para un ataque directo con lista de palabras.{{% /fragment %}}

{{% fragment class="bullet-point" %}}`5a3e3cccff6330886e1d9b7b057a6116`: Este es el hash que se intentará crackear.{{% /fragment %}}

{{% fragment class="bullet-point" %}}`/usr/share/wordlists/rockyou.txt`: Esta es la ruta a la lista de palabras rockyou.txt.{{% /fragment %}}

---

### Introducción a la Esteganografía

- La esteganografía es el arte de ocultar información dentro de otros datos aparentemente inofensivos.
- Diferencia clave con la criptografía: la esteganografía oculta la existencia misma del mensaje.

---

### Historia de la Esteganografía

- Antigua Grecia: Mensajes ocultos en tablillas de cera
- Edad Media: Tinta invisible
- Segunda Guerra Mundial: Microfilms
- Era digital: Esteganografía en imágenes, audio y video

---

### Técnicas de Esteganografía Digital

1. Least Significant Bit (LSB)
   - Modifica los bits menos significativos de los píxeles en una imagen

2. Inyección de metadatos
   - Oculta información en los metadatos de archivos

3. Esteganografía de espectro ensanchado
   - Distribuye la información a lo largo de todo el espectro de frecuencias de una señal

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
