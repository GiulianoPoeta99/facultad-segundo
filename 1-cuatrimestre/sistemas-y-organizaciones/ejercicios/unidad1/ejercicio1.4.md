# 1.4. Plancha a Vapor:

_**Ejercicio:**
Defina como sistema controlado por medio de las variables externas y su nivel de
resolucion (1ra definicion) el objeto plancha con vapor. El objetivo del estudio es
determinar el comportamiento del objeto. Considere que la plancha cuenta con un regulador de temperatura, un deposito de agua, un botón para que la plancha expulse agua
en espray, y que a determinadas temperaturas expulsa vapor automáticamente._

### 1. Definir las variables Externas:

- x<sub>1</sub> = Regulador de temperatura en grados Celsius
- x<sub>2</sub> = Cantidad de agua en el deposito en mililitros
- x<sub>3</sub> = Botón del disparador de agua en spray
- x<sub>4</sub> = Temperaturas a la que la plancha expulsa vapor automáticamente
- x<sub>5</sub> = Expulción de vapor automático
- x<sub>6</sub> = Tiempo en que la plancha expulsa vapor automaticamente en segundos

#### Defino el conjunto de Variables externas:

- X = { x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, x<sub>6</sub> }

### 2. Definir los estados registrables

- x&#772;<sub>1</sub> = { x &#8946; **R** / 0 &le; x &le; 100 }
- x&#772;<sub>2</sub> = { x &#8946; **R** / 0 &le; x &le; 500 }
- x&#772;<sub>3</sub> = { PRENDIDO, APAGADO }
- x&#772;<sub>4</sub> = { x &#8946; **R** / x &ge; 50 }
- x&#772;<sub>5</sub> = { x &#8946; **R** / SI, NO}
- x&#772;<sub>6</sub> = { x &#8946; **R** / 0 &le; x &le; 6 }

#### Defino el conjunto de Estados Registrables

- X&#772; = { x&#772;<sub>1</sub>, x&#772;<sub>2</sub>, x&#772;<sub>3</sub>, x&#772;<sub>4</sub>, x&#772;<sub>5</sub> , x&#772;<sub>6</sub>}

### 3. Definimos el tiempo:

- t &#8756; cada vez que la temperatura de la plancha cambia.

#### Relizamos la tabla de tiempo:

|       t       | x<sub>1</sub> | x<sub>2</sub> | x<sub>3</sub> | x<sub>4</sub> | x<sub>5</sub> | x<sub>6</sub> |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| t<sub>0</sub> |      20       |      150      |    APAGADO    |      50       |      NO       |       0       |
| t<sub>1</sub> |      50       |      300      |   PRENDIDO    |      50       |      SI       |       5       |
| t<sub>2</sub> |      80       |      230      |   PRENDIDO    |      50       |      SI       |       6       |
| t<sub>3</sub> |      28       |      100      |    APAGADO    |      50       |      NO       |       0       |
| t<sub>4</sub> |      40       |      350      |   PRENDIDO    |      50       |      NO       |       0       |

#### Defino el conjunto de tiempos:

- T = { t<sub>0</sub>, t<sub>1</sub>, t<sub>2</sub>, t<sub>3</sub>, t<sub>4</sub> }

### 4. Definimos el nivel de resolución:

- L = { T, x&#772;<sub>1</sub>, x&#772;<sub>2</sub>, x&#772;<sub>3</sub>, x&#772;<sub>4</sub>, x&#772;<sub>5</sub>, x&#772;<sub>6</sub> }

### 5. La primera ley de Klir:

- Z = { X, t, L }
