+++
title = "Tecnologías Disruptivas - Análisis de Datos, BI y No-Code AI"
outputs = ["Reveal"]
+++

## Semana 3

### Análisis de Datos, Business Intelligence y Herramientas No-Code

{{% note %}}
Esta semana exploramos cómo los datos se convierten en información útil. Veremos conceptos de inteligencia de negocios (BI), aprendizaje automático (ML), deep learning y herramientas No-Code para trabajar con datos sin necesidad de programar.
{{% /note %}}

---

## Objetivos de la semana

{{% fragment class="bullet-point" %}} Comprender el ciclo de análisis de datos y su valor en la toma de decisiones {{% /fragment %}}
{{% fragment class="bullet-point" %}} Diferenciar entre BI, Machine Learning y Deep Learning {{% /fragment %}}
{{% fragment class="bullet-point" %}} Identificar herramientas No-Code para exploración y visualización de datos {{% /fragment %}}
{{% fragment class="bullet-point" %}} Aplicar análisis de datos mediante una herramienta práctica como Tableau {{% /fragment %}}

---

## Ciclo de vida del análisis de datos

{{% fragment class="bullet-point" %}} **Recolección**: sensores, encuestas, archivos, APIs {{% /fragment %}}
{{% fragment class="bullet-point" %}} **Limpieza**: manejo de datos faltantes, errores o duplicados {{% /fragment %}}
{{% fragment class="bullet-point" %}} **Exploración**: gráficas, estadísticas descriptivas, correlaciones {{% /fragment %}}
{{% fragment class="bullet-point" %}} **Modelado**: modelos predictivos o clasificadores {{% /fragment %}}
{{% fragment class="bullet-point" %}} **Visualización e informe**: dashboards, reportes, storytelling con datos {{% /fragment %}}

{{% note %}}
La mayor parte del trabajo está en preparar, explorar y visualizar. El modelo predictivo es solo una parte final.
{{% /note %}}

---

## Business Intelligence (BI)

{{% fragment class="bullet-point" %}} Estrategia para transformar datos en información accionable {{% /fragment %}}
{{% fragment class="bullet-point" %}} Combina herramientas, métricas y visualizaciones {{% /fragment %}}
{{% fragment class="bullet-point" %}} Enfocado en: KPIs, dashboards, reportes ejecutivos {{% /fragment %}}
{{% fragment class="bullet-point" %}} Se usa para: ventas, logística, salud, educación{{% /fragment %}}
{{% fragment class="bullet-point" %}} Ejemplos: Tableau, Power BI, Looker {{% /fragment %}}

{{% note %}}
BI es descriptivo y retrospectivo: resume lo que pasó y ayuda a monitorear lo que ocurre en el presente.
{{% /note %}}

---
## Demo

{{% fragment class="bullet-point" %}} Datasets públicos en [Tableau Public](https://public.tableau.com/){{% /fragment %}}

{{% note %}}
Puedes compartir tu pantalla mostrando [Kaggle Datasets](https://www.kaggle.com/datasets) y subir uno pequeño para demostrar limpieza + gráfica.
Crear una visualización simple: gráfico de barras, línea de tiempo o mapa
{{% /note %}}

---

## Machine Learning vs Deep Learning

{{% fragment class="bullet-point" %}} **Machine Learning**: modelos que aprenden patrones de datos. Ej: regresión, árboles, SVM.{{% /fragment %}}
{{% fragment class="bullet-point" %}} **Deep Learning**: subcampo que usa redes neuronales profundas. Ej: CNNs, LSTMs.{{% /fragment %}}
{{% fragment class="bullet-point" %}} Deep Learning requiere más datos, más cómputo, y logra mayor complejidad.{{% /fragment %}}

{{% note %}}
ML puede funcionar bien con pocas variables e interpretabilidad. Deep Learning es potente pero más complejo y costoso.

SVM: [Support Vector Machine](https://en.wikipedia.org/wiki/Support_vector_machine)
{{% /note %}}

---

## Machine Learning

{{% fragment class="bullet-point" %}} Modelos que aprenden patrones a partir de datos{{% /fragment %}}
{{% fragment class="bullet-point" %}} Usos: predicción, clasificación, segmentación, detección de anomalías{{% /fragment %}}
{{% fragment class="bullet-point" %}} Ejemplos: regresión lineal, árboles de decisión, SVM, K-means{{% /fragment %}}

{{% note %}}
Demo en [https://teachablemachine.withgoogle.com/](https://teachablemachine.withgoogle.com/) (clasificador con webcam o imagen).
O usa [https://ml-playground.com](https://ml-playground.com/) para mostrar frontera de decisión de modelos.
{{% /note %}}

---

## Ejemplo 1: Regresión lineal

* Problema: predecir precio de casas según nº de habitaciones
* Visual: nubes de puntos + línea de mejor ajuste

{{% note %}}
Puedes usar [https://ml-playground.com](https://ml-playground.com/) para mostrar cómo el modelo ajusta la línea.
Es ideal para visualizar el error y explicar métricas como MAE o R2.
{{% /note %}}

---

## Ejemplo 2: Clasificación con árboles

* Problema: decidir si un email es spam
* Visual: diagrama de decisiones (ej: contiene "descuento"? -> spam)

{{% note %}}
Muestra [https://ml-playground.com](https://ml-playground.com/) en modo árbol para explicar decisiones ramificadas.
Pide a los estudiantes que inventen sus propias reglas si fueran un modelo.
{{% /note %}}

---

## Deep Learning

{{% fragment class="bullet-point" %}} Subcampo de ML que usa redes neuronales profundas{{% /fragment %}}
{{% fragment class="bullet-point" %}} Inspirado en el cerebro humano (capas de neuronas){{% /fragment %}}
{{% fragment class="bullet-point" %}} Necesita más datos y computación que ML clásico{{% /fragment %}}

---

## Ejemplo: CNNs (Convolutional Neural Networks)

* Aplicaciones: visión por computadora (detección de rostros, diagnóstico médico, autos autónomos)
* Aprende patrones espaciales: bordes, texturas, formas

{{% note %}}
Demuestra en vivo con [Teachable Machine](https://teachablemachine.withgoogle.com/) para clasificar gestos o sonidos.
Refuerza: ¿qué puede y qué no puede hacer este modelo? ¿qué pasa si cambio la luz o fondo?
{{% /note %}}

---

## Aplicaciones comunes del ML y DL

{{% fragment class="bullet-point" %}} Clasificación de imágenes (DL){{% /fragment %}}
{{% fragment class="bullet-point" %}} Predicción de ventas o demanda (ML){{% /fragment %}}
{{% fragment class="bullet-point" %}} Recomendadores de productos (ML + DL){{% /fragment %}}
{{% fragment class="bullet-point" %}} Análisis de sentimientos en redes sociales (ML){{% /fragment %}}

{{% note %}}
Muchos de estos modelos ya existen en APIs o plataformas No-Code. No es necesario programarlos desde cero.
{{% /note %}}

---

## Herramientas No-Code para análisis de datos

{{% fragment class="bullet-point" %}} Tableau: dashboards interactivos y visualización {{% /fragment %}}
{{% fragment class="bullet-point" %}} Power BI: integración con Excel y herramientas de Microsoft {{% /fragment %}}
{{% fragment class="bullet-point" %}} Google Looker Studio: gratuito, ideal para datos en la nube {{% /fragment %}}
{{% fragment class="bullet-point" %}} MonkeyLearn: clasificación de texto y análisis de sentimientos {{% /fragment %}}

{{% note %}}
Estas plataformas permiten hacer mucho sin escribir código: filtrar, combinar, analizar y visualizar. Ideal para usuarios de negocio.
{{% /note %}}


## En resumen

{{% fragment class="bullet-point" %}} El análisis de datos permite tomar decisiones con base en evidencia{{% /fragment %}}
{{% fragment class="bullet-point" %}} Machine Learning y Deep Learning detectan patrones complejos{{% /fragment %}}
{{% fragment class="bullet-point" %}} Hay herramientas accesibles para empezar sin saber programación{{% /fragment %}}

{{% note %}}
Puedes cerrar la sesión mostrando un dashboard real o modelo en vivo y conectar con su aplicación profesional.
{{% /note %}}

---

## Recursos recomendados

* [Tableau Public](https://public.tableau.com/)
* [Teachable Machine](https://teachablemachine.withgoogle.com/)
* [ML Playground](https://ml-playground.com/)
* [Kaggle Datasets](https://www.kaggle.com/datasets)
* [Curso gratuito de Google sobre visualización](https://datastudio.google.com/overview)
* [Machine Learning Crash Course - Google](https://developers.google.com/machine-learning/crash-course)
* [Uso de Tableau](https://www.youtube.com/watch?v=cYw8OvkwVVI)

---

## ¿Preguntas?
