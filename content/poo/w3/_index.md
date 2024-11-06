+++
title = "Programación Orientada a Objetos - Semana 3"
subtitle = "Abstracción, Encapsulamiento y Composición"
outputs = ["Reveal"]
+++

## Programación Orientada a Objetos
### Semana 3: Abstracción, Encapsulamiento y Composición

---

### El plan para hoy

{{% fragment class="bullet-point" %}} Comprender la diferencia entre abstracción y encapsulamiento{{% /fragment %}}
{{% fragment class="bullet-point" %}} Dominar los modificadores de acceso en Java{{% /fragment %}}
{{% fragment class="bullet-point" %}} Entender el rol de la composición en el diseño OO{{% /fragment %}}
{{% fragment class="bullet-point" %}} Aplicar estos conceptos en diseños prácticos{{% /fragment %}}

---

### Recapitulando: Los 4 Pilares de POO

1. **Abstracción**: Ocultar complejidad, mostrar solo lo necesario
2. **Encapsulamiento**: Proteger datos, controlar acceso
3. **Herencia**: Reutilización y jerarquía de clases
4. **Polimorfismo**: Múltiples formas de comportamiento

---

### Abstracción vs Encapsulamiento

| Aspecto | Abstracción | Encapsulamiento |
|---------|-------------|-----------------|
| Enfoque | QUÉ hace algo | CÓMO proteger datos |
| Propósito | Manejar complejidad | Proteger integridad |
| Mecanismo | Métodos públicos simples | Modificadores de acceso |
| Resultado | Simplicidad | Seguridad |

---

### Abstracción: En Detalle

- Se centra en **ocultar complejidad**
- Muestra solo lo que el usuario necesita ver
- Define una interfaz clara y simple
- Se implementa mediante métodos públicos significativos

```java
// Ejemplo de abstracción
public class ControlRemoto {
    private int canal;
    private int volumen;
    private boolean encendido;
    
    // Métodos públicos simples que ocultan la complejidad
    public void encender() {
        // Oculta toda la complejidad de encender el TV
        inicializarSistema();
        cargarConfiguracion();
        encendido = true;
    }
    
    public void cambiarCanal(int nuevoCanal) {
        if (encendido && nuevoCanal > 0) {
            this.canal = nuevoCanal;
            sintonizarSenal();
            ajustarAntena();
        }
    }
    
    // Métodos privados que contienen la complejidad
    private void inicializarSistema() { /* ... */ }
    private void cargarConfiguracion() { /* ... */ }
    private void sintonizarSenal() { /* ... */ }
    private void ajustarAntena() { /* ... */ }
}
```

---

{{% section %}}

### Encapsulamiento: En Detalle

- Se centra en **proteger datos**
- Controla el acceso a los componentes
- Implementado mediante:
  - Modificadores de acceso
  - Getters y setters
  - Validación de datos

--- 

```java
public class CuentaBancaria {
    private double saldo;     // Dato protegido
    private String pin;       // Dato protegido
    
    public CuentaBancaria(String pin, double saldoInicial) {
        if (saldoInicial < 0) {
            throw new IllegalArgumentException("Saldo inicial no puede ser negativo");
        }
        this.pin = pin;
        this.saldo = saldoInicial;
    }
    
    public boolean retirar(double monto, String pinIngresado) {
        if (!validarPin(pinIngresado)) return false;
        if (monto <= saldo && monto > 0) {
            saldo -= monto;
            return true;
        }
        return false;
    }
    
    private boolean validarPin(String pinIngresado) {
        return this.pin.equals(pinIngresado);
    }
    
    public double consultarSaldo(String pinIngresado) {
        if (validarPin(pinIngresado)) {
            return saldo;
        }
        throw new SecurityException("PIN inválido");
    }
}
```
{{% /section %}}

---

{{% section %}}

### Modificadores de Acceso en Java

| Modificador | Clase | Paquete | Subclase (mismo paquete) | Subclase (otro paquete) | Mundo |
|-------------|-------|---------|-------------------------|----------------------|-------|
| `private`   | ✓     | ✗       | ✗                       | ✗                    | ✗     |
| `default`   | ✓     | ✓       | ✓                       | ✗                    | ✗     |
| `protected` | ✓     | ✓       | ✓                       | ✓                    | ✗     |
| `public`    | ✓     | ✓       | ✓                       | ✓                    | ✓     |

--- 

**Notas**:
- `default`: Es el modificador que se aplica cuando no se especifica ninguno
- `protected`: Da acceso a subclases sin importar el paquete, y a todas las clases en el mismo paquete
- Las subclases en el mismo paquete tienen acceso a miembros `default`

{{% /section %}}

---

{{% section %}}

### Composición: Concepto y Relación

La composición es útil para modularidad y reusabilidad, y facilita la **abstracción** al construir objetos complejos:
- Construye objetos complejos usando otros objetos
- Implementa relaciones "tiene-un" (has-a)
- Oculta detalles de implementación

---

```java
// Ejemplo de composición
public class Automovil {
    // Composición de partes
    private Motor motor;
    private Transmision transmision;
    private SistemaElectrico sistemaElectrico;
    
    public Automovil() {
        this.motor = new Motor();
        this.transmision = new Transmision();
        this.sistemaElectrico = new SistemaElectrico();
    }
    
    // Métodos públicos simples que usan la composición
    public void arrancar() {
        motor.encender();
        transmision.ponerEnNeutral();
        sistemaElectrico.activar();
    }
    
    public void acelerar() {
        if (motor.estaEncendido()) {
            motor.aumentarRPM();
            transmision.ajustarVelocidad();
        }
    }
}
```
{{% /section %}}

---

### Ejercicio 1: Sistema de Audio
**Objetivo**: Crear un sistema que demuestre abstracción y encapsulamiento

```java
public class ReproductorMusica {
    private int volumenActual;
    private boolean encendido;
    private String cancionActual;
    
    // Composición
    private Amplificador amplificador;
    private Parlantes parlantes;
    
    public ReproductorMusica() {
        this.amplificador = new Amplificador();
        this.parlantes = new Parlantes();
        this.volumenActual = 0;
        this.encendido = false;
    }
    
    public void encender() {
        encendido = true;
        amplificador.inicializar();
        parlantes.activar();
    }
    
    public void reproducir(String cancion) {
        if (encendido) {
            this.cancionActual = cancion;
            amplificador.procesarAudio(cancion);
            parlantes.emitirSonido();
        }
    }
    
    public void ajustarVolumen(int nivel) {
        if (nivel >= 0 && nivel <= 100) {
            this.volumenActual = nivel;
            amplificador.ajustarGanancia(nivel);
            parlantes.ajustarVolumen(nivel);
        }
    }
}
```

---

### Ejercicio 2: Sistema Bancario
**Objetivo**: Implementar un sistema seguro usando los conceptos aprendidos

```java
public class CuentaBancaria {
    // Encapsulamiento de datos
    private double saldo;
    private List<String> historialTransacciones;
    
    // Composición
    private SistemaSeguridad seguridad;
    private RegistradorTransacciones registrador;
    
    public CuentaBancaria(double saldoInicial) {
        this.saldo = saldoInicial;
        this.historialTransacciones = new ArrayList<>();
        this.seguridad = new SistemaSeguridad();
        this.registrador = new RegistradorTransacciones();
    }
    
    public boolean realizarTransaccion(double monto, String pin) {
        if (!seguridad.validarPin(pin)) {
            return false;
        }
        
        if (monto <= saldo && monto > 0) {
            saldo -= monto;
            registrador.registrarMovimiento(monto);
            return true;
        }
        return false;
    }
}
```

---

### Ejercicio Final Integrador: Sistema de Restaurante

**Objetivo**: Crear un sistema que demuestre los tres conceptos principales:
1. Abstracción de operaciones del restaurante
2. Encapsulamiento de datos sensibles
3. Composición de diferentes subsistemas

---

### Código Base del Sistema de Restaurante

```java
public class Pedido {
    // Encapsulamiento
    private int numeroOrden;
    private List<Plato> platos;
    private double total;
    private String estado;
    
    // Composición
    private Cocina cocina;
    private Facturacion facturacion;
    
    public Pedido(int numeroOrden) {
        this.numeroOrden = numeroOrden;
        this.platos = new ArrayList<>();
        this.estado = "NUEVO";
        this.cocina = new Cocina();
        this.facturacion = new Facturacion();
    }
    
    public void agregarPlato(Plato plato) {
        if (cocina.verificarDisponibilidad(plato)) {
            platos.add(plato);
            total += plato.getPrecio();
            cocina.prepararPlato(plato);
        }
    }
    
    public double generarCuenta() {
        return facturacion.calcularTotal(platos);
    }
}

public class Plato {
    private String nombre;
    private double precio;
    private List<Ingrediente> ingredientes;
    
    // Composición
    private RecetaPreparacion receta;
    
    public Plato(String nombre, double precio) {
        this.nombre = nombre;
        this.precio = precio;
        this.ingredientes = new ArrayList<>();
        this.receta = new RecetaPreparacion();
    }
    
    public void agregarIngrediente(Ingrediente ingrediente) {
        ingredientes.add(ingrediente);
    }
    
    public double getPrecio() {
        return precio;
    }
}
```

---

{{% section %}}

### Estructura del Sistema de Restaurante

1. **Gestión de Pedidos**

```java
   public class GestorPedidos {
       private List<Pedido> pedidosPendientes;
       private Cocina cocina;
       
       public void tomarPedido(Pedido pedido) {
           pedidosPendientes.add(pedido);
           cocina.notificarNuevoPedido(pedido);
       }
       
       public List<Pedido> obtenerPedidosPendientes() {
           return new ArrayList<>(pedidosPendientes);
       }
   }
```
---

2. **Gestión de Inventario**

```java
   public class Inventario {
       private Map<String, Integer> stockIngredientes;
       
       public boolean verificarStock(String ingrediente, int cantidad) {
           return stockIngredientes.getOrDefault(ingrediente, 0) >= cantidad;
       }
       
       public void actualizarStock(String ingrediente, int cantidad) {
           stockIngredientes.put(ingrediente, 
               stockIngredientes.getOrDefault(ingrediente, 0) - cantidad);
       }
   }
```
{{% /section %}}

---

### Conclusiones

1. **Abstracción**: Maneja la complejidad mostrando solo lo necesario
2. **Encapsulamiento**: Protege y controla el acceso a los datos
3. **Composición**: Construye objetos complejos usando otros objetos más simples

---

### ¿Preguntas?