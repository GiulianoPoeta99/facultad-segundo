# 1.2. Reloj Digital

_**Ejercicio:**
Defina como sistemas neutral por medio de las variables externas y su nivel de resolución (1ra definici´on) el objeto reloj digital teniendo en cuenta que el reloj solo indica
horas y minutos. El objetivo del estudio es determinar el comportamiento del objeto.
Asuma las siguientes variantes:_

1. _Horas y minutos en formato 24hs._
2. _Horas y minutos en formato 12hs (AM/PM)._

## Formato 24h:

### 1. Definir las variables Externas:

- x<sub>1</sub> = Horas
- x<sub>2</sub> = Minutos

#### Defino el conjunto de Variables externas:

- X = { x<sub>1</sub>, x<sub>2</sub> }

### 2. Definir los estados registrables

- x&#772;<sub>1</sub> = { x &#8946; **R** / 0 &le; x &le; 23 }
- x&#772;<sub>2</sub> = { x &#8946; **R** / 0 &le; x &le; 59 }

#### Defino el conjunto de Estados Registrables

- X&#772; = { x&#772;<sub>1</sub>, x&#772;<sub>2</sub> }

### 3. Definimos el tiempo:

- t &#8756; cada vez que transcurren 60 segundos

#### Relizamos la tabla de tiempo:

|       t       | x<sub>1</sub> | x<sub>2</sub> |
| :-----------: | :-----------: | :-----------: |
| t<sub>0</sub> |      23       |      58       |
| t<sub>1</sub> |      23       |      59       |
| t<sub>2</sub> |       0       |       0       |
| t<sub>3</sub> |       0       |       1       |

#### Defino el conjunto de tiempos:

- T = { t<sub>0</sub>, t<sub>1</sub>, t<sub>2</sub>, t<sub>3</sub> }

### 4. Definimos el nivel de resolución:

- L = { T, x&#772;<sub>1</sub>, x&#772;<sub>2</sub> }

### 5. La primera ley de Klir:

- Z = { X, t, L }

---

## Formato 12h:

### 1. Definir las variables Externas:

- x<sub>1</sub> = Horas
- x<sub>2</sub> = Minutos
- x<sub>3</sub> = Formatos

#### Defino el conjunto de Variables externas:

- X = { x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub> }

### 2. Definir los estados registrables

- x&#772;<sub>1</sub> = { x &#8946; **R** / 0 &le; x &le; 23 }
- x&#772;<sub>2</sub> = { x &#8946; **R** / 0 &le; x &le; 59 }
- x&#772;<sub>3</sub> = { AM, PM }

#### Defino el conjunto de Estados Registrables

- X&#772; = { x&#772;<sub>1</sub>, x&#772;<sub>2</sub>, x&#772;<sub>3</sub> }

### 3. Definimos el tiempo:

- t &#8756; cada vez que transcurren 60 segundos

#### Relizamos la tabla de tiempo:

|       t       | x<sub>1</sub> | x<sub>2</sub> | x<sub>3</sub> |
| :-----------: | :-----------: | :-----------: | :-----------: |
| t<sub>0</sub> |      11       |      58       |      PM       |
| t<sub>1</sub> |      11       |      59       |      PM       |
| t<sub>2</sub> |      12       |       0       |      AM       |
| t<sub>3</sub> |      12       |       1       |      AM       |

#### Defino el conjunto de tiempos:

- T = { t<sub>0</sub>, t<sub>1</sub>, t<sub>2</sub>, t<sub>3</sub> }

### 4. Definimos el nivel de resolución:

- L = { T, x&#772;<sub>1</sub>, x&#772;<sub>2</sub>, x&#772;<sub>3</sub> }

### 5. La primera ley de Klir:

- Z = { X, t, L }
