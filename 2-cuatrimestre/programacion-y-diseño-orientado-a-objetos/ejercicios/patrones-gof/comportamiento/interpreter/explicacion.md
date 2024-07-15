# Interpreter

El patrón Interpreter es un patrón de diseño comportamental que define una gramática para interpretar el lenguaje y proporciona un intérprete para evaluar sentencias en esa gramática.

En este ejemplo:

Se implementa un intérprete para evaluar expresiones aritméticas simples.

- '**Expression**' es la interfaz que declara el método interpret.
- '**VariableExpression**' y ConstantExpression son clases concretas que implementan la interfaz '**Expression**' para evaluar variables y constantes, respectivamente.
- '**AddExpression**' y SubtractExpression son clases concretas que implementan la interfaz '**Expression**' para evaluar sumas y restas, respectivamente.
- '**Context**' es la clase que representa el contexto y contiene las variables con sus valores asociados.
- El cliente ('**InterpreterClient**') crea expresiones aritméticas complejas, define un contexto con valores para las variables y evalúa la expresión utilizando el intérprete.

Este patrón es útil cuando se tiene un lenguaje que necesita ser interpretado y evaluado, como puede ser el caso de lenguajes de consulta o expresiones matemáticas.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
