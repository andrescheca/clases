+++
title = "Programación Orientada a Objetos - Herencia, Polimorfismo e Interfaces"
outputs = ["Reveal"]
+++

## Semana 4

- Herencia, Polimorfismo e Interfaces

---

### Herencia

{{% fragment class="bullet-point small-text-size" %}}La herencia es un mecanismo que permite crear una nueva clase a partir de una existente.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}La nueva clase (subclase) hereda atributos y métodos de la clase existente (superclase).{{% /fragment %}}

---

### Beneficios de la Herencia

{{% fragment class="bullet-point small-text-size" %}}Promueve la reutilización de código.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Facilita la creación de una jerarquía de clases.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Permite extender y personalizar el comportamiento de las clases existentes.{{% /fragment %}}

---

### Polimorfismo

{{% fragment class="bullet-point small-text-size" %}}El polimorfismo permite que una misma operación se ejecute de diferentes formas en distintas clases.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Se logra principalmente a través de métodos sobrescritos y sobrecargados.{{% /fragment %}}

---

### Beneficios del Polimorfismo

{{% fragment class="bullet-point small-text-size" %}}Facilita la extensión y mantenimiento del código.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Permite tratar objetos de diferentes clases de manera uniforme.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Mejora la flexibilidad y la escalabilidad del software.{{% /fragment %}}

---

### Ejemplo de Herencia

```java
// Clase base
public class CuentaBancaria {
    protected double saldo;

    public CuentaBancaria(double saldoInicial) {
        this.saldo = saldoInicial;
    }

    public void depositar(double cantidad) {
        this.saldo += cantidad;
    }

    public void retirar(double cantidad) {
        if (cantidad <= saldo) {
            this.saldo -= cantidad;
        } else {
            System.out.println("Fondos insuficientes");
        }
    }

    public double consultarSaldo() {
        return this.saldo;
    }
}

// Clase derivada
public class CuentaAhorros extends CuentaBancaria {
    private double tasaInteres;

    public CuentaAhorros(double saldoInicial, double tasaInteres) {
        super(saldoInicial);
        this.tasaInteres = tasaInteres;
    }

    public void aplicarInteres() {
        double interes = saldo * tasaInteres;
        depositar(interes);
    }
}

// Otra clase derivada
public class CuentaCorriente extends CuentaBancaria {
    private double limiteSobregiro;

    public CuentaCorriente(double saldoInicial, double limiteSobregiro) {
        super(saldoInicial);
        this.limiteSobregiro = limiteSobregiro;
    }

    @Override
    public void retirar(double cantidad) {
        if (cantidad <= saldo + limiteSobregiro) {
            saldo -= cantidad;
        } else {
            System.out.println("Límite de sobregiro excedido");
        }
    }
}

public class PruebaCuentas {
    public static void main(String[] args) {
        CuentaBancaria miCuentaAhorros = new CuentaAhorros(1000, 0.05);
        CuentaBancaria miCuentaCorriente = new CuentaCorriente(500, 300);

        miCuentaAhorros.depositar(200);
        miCuentaCorriente.retirar(600);

        System.out.println("Saldo cuenta de ahorros: " + miCuentaAhorros.consultarSaldo());
        System.out.println("Saldo cuenta corriente: " + miCuentaCorriente.consultarSaldo());
    }
}
```
---
### Interfaces

{{% fragment class="bullet-point small-text-size" %}}Una interfaz define un conjunto de métodos que una clase debe implementar, sin proporcionar la implementación de estos métodos.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Las interfaces permiten definir un comportamiento común que puede ser implementado por clases no relacionadas.{{% /fragment %}}

---
### Diferencias entre Herencia e Interfaces (1/2)
- **Herencia**:
  {{% fragment class="bullet-point small-text-size" %}}Permite extender una clase existente.{{% /fragment %}}
  {{% fragment class="bullet-point small-text-size" %}}Una clase solo puede heredar de una superclase.{{% /fragment %}}
  {{% fragment class="bullet-point small-text-size" %}}Hereda tanto la implementación como la interfaz (métodos).{{% /fragment %}}

---
### Diferencias entre Herencia e Interfaces (2/2)
- **Interfaces**:
  {{% fragment class="bullet-point small-text-size" %}}Define un contrato que las clases deben cumplir.{{% /fragment %}}
  {{% fragment class="bullet-point small-text-size" %}}Una clase puede implementar múltiples interfaces.{{% /fragment %}}
  {{% fragment class="bullet-point small-text-size" %}}No proporciona implementación de métodos, solo las firmas.{{% /fragment %}}

---
### Ejemplo de Interface

```java
// Definición de la interfaz
public interface Transaccion {
    void ejecutar(double cantidad);
}

// Implementación de la interfaz en una clase
public class Deposito implements Transaccion {
    @Override
    public void ejecutar(double cantidad) {
        System.out.println("Depósito de: " + cantidad + " realizado");
    }
}

// Implementación de la interfaz en otra clase
public class Retiro implements Transaccion {
    @Override
    public void ejecutar(double cantidad) {
        System.out.println("Retiro de: " + cantidad + " realizado");
    }
}

public class PruebaInterfaces {
    public static void main(String[] args) {
        Transaccion miDeposito = new Deposito();
        Transaccion miRetiro = new Retiro();

        miDeposito.ejecutar(1000); // Salida: Depósito de: 1000 realizado
        miRetiro.ejecutar(500);    // Salida: Retiro de: 500 realizado
    }
}
```

---
### Ejercicio en clase (1/3)
***Herencia, Polimorfismo e Interfaces con Clases de Figuras Geométricas***
{{% fragment class="bullet-point small-text-size" %}}Crea una clase base llamada `Figura` con un método `calcularArea()`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Deriva dos clases de `Figura`: `Circulo` y `Rectangulo`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}En cada subclase, implementa el método `calcularArea()` de manera específica.{{% /fragment %}}

---
### Ejercicio en clase (2/3)
{{% fragment class="bullet-point small-text-size" %}}Crea una interfaz llamada `Dibujable` con un método `dibujar()`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Implementa la interfaz `Dibujable` en las clases `Circulo` y `Rectangulo`.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Crea una clase `PruebaFiguras` donde se creen instancias de `Circulo` y `Rectangulo`, y se muestre el área calculada de cada figura.{{% /fragment %}}

---
### Ejercicio en clase (3/3)
{{% fragment class="bullet-point small-text-size" %}}Demuestra el uso del polimorfismo creando un arreglo de objetos `Figura` y llamando al método `calcularArea()` en un bucle.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Muestra cómo se puede tratar a objetos de diferentes subclases de manera uniforme gracias al polimorfismo.{{% /fragment %}}
{{% fragment class="bullet-point small-text-size" %}}Muestra cómo se puede usar la interfaz `Dibujable` para dibujar diferentes figuras de manera uniforme.{{% /fragment %}}