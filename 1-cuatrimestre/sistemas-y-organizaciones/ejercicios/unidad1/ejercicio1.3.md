# 1.3. Reloj Analógico:

_**Ejercicio:**
Defina como sistema neutral por medio de las variables externas y su nivel de resolucion (1ra definicion) el objeto reloj analogico (con agujas), teniendo en cuenta que el
reloj s´olo indica horas y minutos. El objetivo del estudio es determinar el comportamiento
del objeto._

### 1. Definir las variables Externas:

- x<sub>1</sub> = Horas
- x<sub>2</sub> = Minutos

#### Defino el conjunto de Variables externas:

- X = { x<sub>1</sub>, x<sub>2</sub> }

### 2. Definir los estados registrables

- x&#772;<sub>1</sub> = { x &#8946; **R** / 0 &le; x &le; 12 }
- x&#772;<sub>2</sub> = { x &#8946; **R** / 0 &le; x &le; 59 }

#### Defino el conjunto de Estados Registrables

- X&#772; = { x&#772;<sub>1</sub>, x&#772;<sub>2</sub> }

### 3. Definimos el tiempo:

- t &#8756; cada vez que transcurren 60 segundos

#### Relizamos la tabla de tiempo:

|       t       | x<sub>1</sub> | x<sub>2</sub> |
| :-----------: | :-----------: | :-----------: |
| t<sub>0</sub> |      11       |      58       |
| t<sub>1</sub> |      11       |      59       |
| t<sub>2</sub> |      12       |       0       |
| t<sub>3</sub> |      12       |       1       |

#### Defino el conjunto de tiempos:

- T = { t<sub>0</sub>, t<sub>1</sub>, t<sub>2</sub>, t<sub>3</sub> }

### 4. Definimos el nivel de resolución:

- L = { T, x&#772;<sub>1</sub>, x&#772;<sub>2</sub> }

### 5. La primera ley de Klir:

- Z = { X, t, L }
