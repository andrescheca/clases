+++
title = "Tecnologías Disruptivas - Innovación"
outputs = ["Reveal"]
+++


## Semana 2  
### Prompting e Inteligencia Artificial Generativa

{{% note %}}
Esta semana el objetivo es que los estudiantes entiendan qué es un prompt, cómo estructurarlo y cómo influye en la respuesta de un modelo de lenguaje. También discutiremos cómo funcionan los LLMs y sus aplicaciones reales.
{{% /note %}}

---

## Objetivos de la semana

{{% fragment class="bullet-point" %}} Comprender qué es un prompt y cómo se estructura {{% /fragment %}}
{{% fragment class="bullet-point" %}} Entender cómo interactuar con modelos de lenguaje como ChatGPT{{% /fragment %}}
{{% fragment class="bullet-point" %}} Explorar el funcionamiento general de los LLMs{{% /fragment %}}
{{% fragment class="bullet-point" %}} Reflexionar sobre el impacto de la IA generativa en la producción de texto, imagen, audio y video{{% /fragment %}}

---

## ¿Qué es un Prompt?

{{% fragment class="bullet-point" %}} Es una **instrucción o conjunto de instrucciones** que se le da a un modelo de IA para obtener una respuesta específica.{{% /fragment %}}
<div>
{{% fragment %}} Ejemplo básico: 
> “Resume el siguiente texto en 3 puntos clave...”
</div>
{{% /fragment %}}
{{% fragment class="bullet-point" %}} Un buen prompt puede marcar la diferencia entre una respuesta útil o ambigua.{{% /fragment %}}

{{% note %}}
Los prompts son el puente entre la intención humana y la salida generada por la IA. Cuanto más claro el prompt, más predecible y útil la respuesta.
{{% /note %}}

----

## Principios de un buen Prompt

{{% fragment class="bullet-point" %}} **Claro**: sin ambigüedades{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Contextual**: aporta detalles importantes{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Específico**: delimita lo que se espera{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Iterativo**: puede ajustarse con retroalimentación{{% /fragment %}}
<div>
{{% fragment %}}
> Fuente: [BabelTeam](https://blog-es.babelteam.com/principios-basicos-para-crear-prompts-efectivos/)
{{% /fragment %}}
</div>

{{% note %}}
Un prompt básico puede volverse mucho más claro y potente si añadimos contexto, tono y estructura.  
Cuando indicamos quién es el público o el formato que queremos, la IA comprende mejor nuestra intención.  
Por eso vale la pena experimentar, ajustar y comparar resultados hasta lograr la respuesta más útil.
{{% /note %}}

---

## Ejemplo: Prompt Simple vs. Mejorado
<div>
{{% fragment %}}**Prompt simple:**
> ¿Qué es el cambio climático?
{{% /fragment %}}
</div>
<div>
{{% fragment %}}**Prompt mejorado:**
> Explica el cambio climático en lenguaje sencillo para estudiantes de secundaria, usando ejemplos de América Latina.
{{% /fragment %}}

{{% note %}}
El segundo prompt funciona mejor porque define un tono, un público y un contexto concretos.  
Esto demuestra que la precisión del lenguaje guía la calidad de la respuesta.  
Vale la pena comparar ambos para notar cómo pequeños cambios producen resultados muy distintos.
{{% /note %}}

---

## ¿Qué son los LLMs?

{{% fragment class="bullet-point" %}} “Large Language Models” o **Modelos de Lenguaje de Gran Escala**{{% /fragment %}}
{{% fragment class="bullet-point" %}} Entrenados con miles de millones de palabras{{% /fragment %}}
<div>
{{% fragment%}} Capaces de:
 - Generar texto
 - Traducir idiomas
 - Resumir contenido
 - Contestar preguntas
 - Escribir código
{{% /fragment %}}
</div>
{{% note %}}
los LLMs no son chatbots simples. Son modelos complejos con múltiples capacidades, útiles en muchos sectores.
{{% /note %}}

---

## ¿Cómo funciona un LLM (Large Language Model)?

{{% fragment class="bullet-point" %}} Aprenden patrones estadísticos en el lenguaje{{% /fragment %}}
{{% fragment class="bullet-point" %}} No “entienden” como los humanos, pero **predicen tokens**{{% /fragment %}}
{{% fragment class="bullet-point" %}} Se entrenan con **transformers** y GPUs en grandes infraestructuras{{% /fragment %}}

<div>
{{% fragment %}}
> Fuente: [IBM](https://www.ibm.com/es-es/think/topics/large-language-models)
{{% /fragment %}}

{{% note %}}
Los LLM no tienen comprensión semántica. Lo que hacen es aprender probabilidades de ocurrencia de secuencias de tokens.  
Su "inteligencia" está en la escala y los patrones que pueden capturar.
{{% /note %}}

---

### Representación de palabras mediante vectores

{{% fragment class="bullet-point" %}} Las palabras no se tratan como cadenas de letras (“gato”, “cat”) sino como **vectores de decenas o miles de dimensiones**.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Ejemplo: “cat” podría estar representado como [0.0074, 0.0030, -0.0105, …] en un espacio vectorial.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Esto permite razonar sobre similitud: “dog” está cerca de “cat”, “kitten” está cerca de “cat”.{{% /fragment %}}

{{% note %}}
Analogía visual: imagina un espacio 3D donde cada palabra tiene una coordenada. Si “gato” y “perro” están cerca, el modelo los relaciona.  
Esto es lo que permite que la IA entienda sinónimos o relaciones semánticas.
{{% /note %}}

---

### El contexto importa: polisemia y homónimos

{{% fragment class="bullet-point" %}} Una palabra como *“banco”* puede referirse a institución financiera o asiento junto al río.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Los LLM pueden representar la misma palabra con **vectores distintos dependiendo del contexto**.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Esto es lo que permite que los modelos distingan significados en función de la frase.{{% /fragment %}}

{{% note %}}
Esto muestra por qué los LLM superan a los modelos anteriores: ahora pueden adaptar el significado de una palabra al contexto en el que aparece.
{{% /note %}}

---

### Arquitectura básica: Transformers

{{% fragment class="bullet-point" %}} Los LLM usan la arquitectura de **transformer** (introducida en 2017) como componente principal.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Cada capa del modelo toma los vectores de entrada y produce nuevos vectores de “estado oculto” que capturan información de contexto.{{% /fragment %}}
<div>
{{% fragment %}} Dentro de cada capa hay dos fases clave:
 1. **Attention** (cabezas de atención): palabras “buscan” otras palabras relevantes en el contexto.
 2. **Feed‑forward network**: cada palabra, ya con contexto, “piensa” de forma independiente y se prepara para la predicción de la siguiente palabra.
{{% /fragment %}}
</div>

{{% note %}}
Atención es el componente más revolucionario: permite que cada token decida cuáles otros son importantes para su predicción.
{{% /note %}}

---

### Escala y entrenamiento

{{% fragment class="bullet-point" %}} Por ejemplo: GPT‑3 tenía 96 capas, vectores de ~12 288 dimensiones, ~175 000 millones de parámetros.{{% /fragment %}}
{{% fragment class="bullet-point" %}} El entrenamiento: no requieren etiquetas humanas explícitas; se entrenan con el objetivo de **predecir la siguiente palabra/token** en el texto.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Con esto aprenden patrones de lenguaje que luego permiten generar contenido coherente.{{% /fragment %}}

{{% note %}}
No se les enseña directamente, sino que aprenden observando texto y prediciendo lo que viene.
Ese entrenamiento es lo que les permite responder con "conocimiento" aprendido.
{{% /note %}}

---

### División del trabajo interno

{{% fragment class="bullet-point" %}} Las capas de atención recuperan información del “prompt” o contexto dado.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Las capas feed‑forward “recuerdan” información aprendida durante el entrenamiento (datos externos al prompt) y la aplican.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Ejemplo: un modelo puede predecir “Varsovia” como capital de Polonia aunque no aparezca explícitamente en el prompt, porque “Aprendió” esa relación durante el entrenamiento.{{% /fragment %}}

{{% note %}}
Este concepto es clave para entender por qué a veces los modelos "saben" cosas que no están en el texto que les damos.
Distinguir entre memoria de entrenamiento y contexto inmediato es esencial.
{{% /note %}}

---

## Aplicaciones de la IA Generativa

{{% fragment class="bullet-point" %}} **Texto**: redacción, resúmenes, correos, artículos{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Imagen**: generación de arte, diseño, simulación{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Audio**: síntesis de voz, música, doblaje{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Video**: edición automatizada, generación por IA{{% /fragment %}}

{{% note %}}
Muestra herramientas reales si tienes tiempo: ChatGPT para texto, DALL·E o Midjourney para imágenes, Suno para música, Veo 3 o Runway para video.  
La clave es que el estudiante entienda que el “prompting” no es solo para texto: es un paradigma transversal.
{{% /note %}}

---

## Riesgos y consideraciones

{{% fragment class="bullet-point" %}} **Desinformación**{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Alucinaciones (respuestas falsas)**{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Privacidad y sesgos**{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Dependencia tecnológica**{{% /fragment %}}

{{% note %}}
"Alucinación" no es error técnico, sino una predicción que suena plausible pero no es verdadera.  
Ejemplos: inventar autores, artículos, leyes, o explicaciones falsas con confianza total.  
Invita a los estudiantes a usar la IA con escepticismo razonado y validación crítica.
{{% /note %}}

---

## Aplicaciones de la IA Generativa: Herramientas y ejemplos

{{% note %}}
La IA generativa no es solo teoría, sino un ecosistema de herramientas aplicables en distintas áreas: texto, imagen, audio y video.  
¿Qué herramientas conocen o han utilizado?
{{% /note %}}

---

### Texto: generación, resumen, código

{{% fragment class="bullet-point" %}} Herramientas como ChatGPT o Claude generan ensayos, respuestas y diálogos.{{% /fragment %}}
{{% fragment class="bullet-point" %}} También pueden escribir bloques de código, generar pruebas o traducir entre lenguajes.{{% /fragment %}}

{{% note %}}
Demo de ChatGPT: Escriba un pequeño script y luego que lo documente o lo resuma.  
Refuerza la idea de que el valor está en saber guiar el modelo con prompts bien estructurados.
{{% /note %}}

---

### Imagen y diseño gráfico

{{% fragment class="bullet-point" %}} Gen AI para texto‑a‑imagen: por ejemplo, Adobe Firefly permite generar imágenes a partir de prompts. {{% /fragment %}}
{{% fragment class="bullet-point" %}} También hay herramientas que permiten edición inteligente, “relleno generativo” y variaciones estilísticas.{{% /fragment %}}

{{% note %}}
Ejemplos visuales generados con Midjourney, Firefly o DALL·E.  
Comenta cómo el prompting visual comparte principios con el textual: contexto, estilo, formato y tono.
{{% /note %}}

---

### Audio y video

{{% fragment class="bullet-point" %}} **Audio:** modelos que generan música, voz o efectos de sonido a partir de texto o prompts.{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Video:** herramientas emergentes de texto‑a‑video o imagen‑a‑video como Veo 3 de Google DeepMind.{{% /fragment %}}

{{% note %}}
https://builtin.com/artificial-intelligence/generative-ai-tools
Audio: Suno
Video: Veo3
La IA generativa audiovisual está avanzando rápidamente: en pocos años veremos integración en cine, publicidad y educación.  
Ejemplo: generación automática de videos explicativos o comerciales a partir de texto.
{{% /note %}}

---

### Sectores y casos de uso

{{% fragment class="bullet-point" %}} **Marketing:** creación automática de imágenes, textos y contenido para campañas.{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Finanzas:** redacción de reportes, análisis de regulaciones, atención al cliente personalizada.{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Desarrollo de software:** autogeneración de código, casos de prueba, revisión automatizada.{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Entretenimiento/medios:** efectos especiales, compilados deportivos, narrativas interactivas.{{% /fragment %}}

{{% note %}}
Puedes abrir debate rápido: ¿en qué sector creen que la IA tendrá más impacto positivo y en cuál más riesgo?  
Apunta ejemplos de sus carreras para hacerlo relevante.
{{% /note %}}

---

### Buenas prácticas y limitaciones

{{% fragment class="bullet-point" %}} Aunque muy potentes, estos modelos no “entienden” como humanos, sino que **predicen** lo que estadísticamente sigue.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Riesgos: sesgos en datos, “alucinaciones”, propiedad intelectual, privacidad, uso malicioso.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Es esencial la **supervisión humana**, validación y ética en su aplicación.{{% /fragment %}}

{{% note %}}
El criterio humano sigue siendo indispensable.  
La inteligencia artificial no reemplaza la inteligencia: la amplifica.  
Su verdadero valor aparece cuando sabemos preguntar bien, validar resultados y aplicarlos con responsabilidad.
{{% /note %}}

---

## En resumen

{{% fragment class="bullet-point" %}} Un LLM transforma texto en vectores, usa capas de atención + feed‑forward, entrena a gran escala para predecir tokens.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Las aplicaciones van más allá del texto: imagen, audio, video, diseño, software.{{% /fragment %}}
{{% fragment class="bullet-point" %}} No es magia: hay límites, y el prompt sigue siendo esencial para guiar el modelo.{{% /fragment %}}

{{% note %}}
¿cuál de estas ideas les parece más útil para aplicar?
{{% /note %}}

---

## Recursos recomendados

- [Guía básica de prompting – Nucleoo](https://www.nucleoo.com/es/introduccion-al-prompting-y-su-importancia-en-la-ia/)
- [YouTube: Prompt Engineering explicado](https://www.youtube.com/watch?v=Rbws9lbVNAM)
- [BabelTeam: Cómo crear prompts efectivos](https://blog-es.babelteam.com/principios-basicos-para-crear-prompts-efectivos/)
- [IBM: Qué es un LLM](https://www.ibm.com/es-es/think/topics/large-language-models)
- [Understanding AI: ¿Qué hacen los LLM?](https://www.understandingai.org/p/grandes-modelos-de-lenguaje-llm-una)
- [Prompt writing – Substack](https://extensioneinnovacion.substack.com/p/guia-basica-para-escribir-un-prompt)

{{% note %}}
Si hay tiempo, abrir uno de estos recursos en vivo.
{{% /note %}}

---

## Preguntas para reflexionar

{{% fragment class="bullet-point" %}} ¿Qué hace que un prompt sea efectivo?{{% /fragment %}}
{{% fragment class="bullet-point" %}} ¿Hasta qué punto confías en lo que produce una IA generativa?{{% /fragment %}}
{{% fragment class="bullet-point" %}} ¿Qué aplicaciones de esta tecnología imaginas en tu carrera?{{% /fragment %}}

{{% note %}}
Lluvia de ideas o mini debate.
{{% /note %}}

---

## ¿Preguntas?