+++
title = "Conceptos introductorios al Hacking Ético"
outputs = ["Reveal"]
+++

<div class="deck-cover">
  <div class="eyebrow">Hacking Ético · Semana 1</div>
  <h1 class="deck-cover__title">Método, alcance y criterio</h1>
  <p class="deck-cover__subtitle">La seguridad ofensiva profesional no empieza con una herramienta. Empieza con una pregunta: qué está autorizado, qué riesgo se quiere demostrar y cómo se va a comunicar.</p>
  <div class="deck-cover__meta">
    <span class="deck-cover__chip">CIA</span>
    <span class="deck-cover__chip">PTES</span>
    <span class="deck-cover__chip">Ética</span>
  </div>
</div>

---

<div class="statement-slide">
  <div class="eyebrow">Tesis de la clase</div>
  <div class="statement">La diferencia entre prueba y abuso no está en la técnica. Está en el permiso.</div>
  <p class="statement-note">Un profesional puede usar herramientas ofensivas, pero trabaja dentro de alcance, evidencia y responsabilidad.</p>
</div>

---

### Qué vamos a construir hoy

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Lenguaje</strong>
      <span>Confidencialidad, integridad y disponibilidad.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Proceso</strong>
      <span>Cómo se estructura una prueba profesional.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Riesgo</strong>
      <span>Qué impacto real tiene un hallazgo.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Responsabilidad</strong>
      <span>Qué límites no se cruzan.</span>
    </div>
  </div>
</div>

---

### Incidentes: el patrón se repite

<div class="case-strip">
  <div class="case-tile">
    <strong>Equifax</strong>
    <span>Parcheo, visibilidad y respuesta tardía.</span>
  </div>
  <div class="case-tile">
    <strong>Yahoo!</strong>
    <span>Escala masiva y gestión de identidad.</span>
  </div>
  <div class="case-tile">
    <strong>Sony</strong>
    <span>Impacto técnico, operativo y reputacional.</span>
  </div>
  <div class="case-tile">
    <strong>SolarWinds</strong>
    <span>Cadena de suministro y confianza rota.</span>
  </div>
</div>

<div class="takeaway">
  <strong>Lectura</strong>
  Un incidente serio rara vez es solo una vulnerabilidad. Suele ser una cadena de decisiones débiles.
</div>

---

### La tríada CIA

<div class="big-word-grid">
  <div class="big-word">
    <strong>Confidencialidad</strong>
    <span>Solo accede quien debe acceder.</span>
  </div>
  <div class="big-word">
    <strong>Integridad</strong>
    <span>El dato sigue siendo correcto y confiable.</span>
  </div>
  <div class="big-word">
    <strong>Disponibilidad</strong>
    <span>El servicio funciona cuando importa.</span>
  </div>
</div>

---

<div class="visual-split">
  <div class="visual-copy">
    <div class="eyebrow">Cómo pensar un hallazgo</div>
    <h2>No preguntes si “hay seguridad”.</h2>
    <p class="lead">Pregunta qué dimensión de CIA se rompe, cuánto impacto tiene y quién lo sufriría.</p>
  </div>
  <div class="visual-panel">
    <div class="concept-map">
      <div class="concept-node">
        <strong>Divulgación</strong>
        <span>Se rompe confidencialidad.</span>
      </div>
      <div class="concept-node">
        <strong>Alteración</strong>
        <span>Se rompe integridad.</span>
      </div>
      <div class="concept-node">
        <strong>Disrupción</strong>
        <span>Se rompe disponibilidad.</span>
      </div>
    </div>
  </div>
</div>

---

### PTES como mapa de trabajo

<ol class="step-list">
  <li><div><strong>Pre-engagement</strong><br>Alcance, reglas y autorización.</div></li>
  <li><div><strong>Reconocimiento</strong><br>Información útil antes de tocar sistemas.</div></li>
  <li><div><strong>Análisis</strong><br>Hipótesis, vulnerabilidades y priorización.</div></li>
  <li><div><strong>Explotación</strong><br>Demostración controlada de impacto.</div></li>
  <li><div><strong>Reporte</strong><br>Evidencia, explicación y remediación.</div></li>
</ol>

---

<div class="statement-slide">
  <div class="eyebrow">Regla operativa</div>
  <div class="statement">Si no puedes reportarlo con evidencia limpia, no lo hiciste profesionalmente.</div>
</div>

---

### Kill Chain en una frase

<div class="concept-map">
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Reconocer</strong>
      <span>Entender el objetivo.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Entrar</strong>
      <span>Aprovechar una debilidad.</span>
    </div>
  </div>
  <div class="concept-map__row">
    <div class="concept-node">
      <strong>Permanecer</strong>
      <span>Mantener acceso o control.</span>
    </div>
    <div class="concept-arrow">→</div>
    <div class="concept-node">
      <strong>Lograr objetivo</strong>
      <span>Exfiltrar, alterar o interrumpir.</span>
    </div>
  </div>
</div>

---

### Ética práctica

<div class="axis">
  <div class="axis__line"></div>
  <div class="axis__labels">
    <div>
      <strong>Autorizado</strong>
      <span>Alcance escrito, evidencia, límites y reporte.</span>
    </div>
    <div>
      <strong>No autorizado</strong>
      <span>Curiosidad técnica, daño, ocultamiento o beneficio indebido.</span>
    </div>
  </div>
</div>

<div class="takeaway">
  <strong>Frontera</strong>
  Una puerta abierta no es una invitación.
</div>

---

### Habilidades del curso

<div class="big-word-grid">
  <div class="big-word">
    <strong>Reconocer</strong>
    <span>OSINT, servicios, versiones y superficie expuesta.</span>
  </div>
  <div class="big-word">
    <strong>Validar</strong>
    <span>Separar ruido de vulnerabilidades con impacto.</span>
  </div>
  <div class="big-word">
    <strong>Explicar</strong>
    <span>Convertir hallazgos técnicos en riesgo comprensible.</span>
  </div>
</div>

---

### Reglas del laboratorio

<ul class="checklist">
  <li>Trabajar solo en entornos autorizados por la clase.</li>
  <li>Detenerse si una técnica sale del alcance definido.</li>
  <li>Documentar pasos, evidencia e impacto.</li>
  <li>Priorizar aprendizaje y criterio sobre “hacer explotar algo”.</li>
</ul>

---

<div class="statement-slide">
  <div class="eyebrow">Cierre</div>
  <div class="statement">El valor no está en encontrar algo raro. Está en demostrar riesgo con criterio.</div>
</div>
