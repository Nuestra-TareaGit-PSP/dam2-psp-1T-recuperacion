# API

## 1. Recurso TORNEOS

### 1.1. Modelo de datos (ya definido)

```
🧱 Tabla: torneos
	•	id        BIGSERIAL      (PK)
	•	nombre    VARCHAR(255)   NOT NULL
	•	juego     VARCHAR(100)   NOT NULL
	•	duracion  INTEGER        NULL
	•	precio    NUMERIC(10, 2) NULL
```

### 1.2. Listar torneos

**Endpoint:**

```
GET /torneos
```

**Requisitos:**

- Devuelve un listado de torneos usando el DTO TorneoResumenResponse.
- La lista debe venir de base de datos (no datos “a mano”).
- Debe permitir **ordenar** por los campos:
  - id, nombre, juego, duracionEnMinutos, precio
- La dirección de ordenación será:
  - asc (ascendente) o desc (descendente).

**Parámetros de consulta (query params):**

| **Parámetro** | **Obligatorio** | **Valores permitidos** | **Valor por defecto** |
| --- | --- | --- | --- |
| ordenarPor | No | id, nombre, juego, duracionEnMinutos, precio | nombre |
| direccion | No | asc, desc | asc |
- Si llega un valor **no permitido** en ordenarPor o direccion, puedes:
  - o bien usar los valores por defecto,
  - o manejarlo de forma controlada (pero nunca dejar que la app “reviente”).

**Ejemplos de URL:**

- GET /torneos
- GET /torneos?ordenarPor=juego&direccion=desc

**Ejemplo de respuesta (200 OK):**

```
[
  {
    "id": 1,
    "nombre": "Torneo 2v2 Rocket League",
    "juego": "Rocket League"
  },
  {
    "id": 2,
    "nombre": "Liga rápida de Valorant",
    "juego": "Valorant"
  }
]
```

---

### 1.3. Detalle de un torneo

**Endpoint:**

```
GET /torneos/{id}
```

**Requisitos:**

- Devuelve el detalle de un torneo usando TorneoResponse.
- El id del torneo se recibe en la URL.
- Si el torneo no se encuentra:
  - Debes lanzar TorneoNoEncontradoException.
  - El @RestControllerAdvice debe devolver **HTTP 404 NOT_FOUND** con un cuerpo de error razonable.

**Transformaciones en la respuesta:**

- duracion_en_minutos:
  - En el JSON se debe llamar así (duracion_en_minutos), aunque en Java se llame de otra forma.
- precio:
  - Se devuelve como **String**, añadiendo el símbolo “€” al valor numérico.
  - Ejemplo: si en BBDD el precio es 5.0, en la respuesta debe aparecer:

```
"precio": "5.0 €"
```

**Ejemplo de respuesta (200 OK):**

```json
{
  "id": 1,
  "nombre": "Torneo 2v2 Rocket League",
  "juego": "Rocket League",
  "duracion_en_minutos": 180,
  "participantes_inscritos": 42,
  "precio": "5.00 €"
}
```

> 🚨 El campo **participantes_inscritos** se podrá calcular más adelante cuando tengas el recurso de Participantes implementado. Si no llegas, puedes devolver temporalmente null o 0, pero es recomendable dejarlo preparado.
>

---

### 1.4. Crear un torneo

**Endpoint:**

```
POST /torneos
```

**Body (JSON de entrada):**

```
{
  "nombre": "Torneo 2v2 Rocket League",
  "juego": "Rocket League",
  "duracion_en_minutos": 180,
  "precio": 5.0
}
```

**Validaciones de TorneoRequest**

Estas validaciones deben estar implementadas con **Jakarta Bean Validation** en el DTO de entrada:

| **Campo** | **Obligatorio** | **Restricciones** |
| --- | --- | --- |
| nombre | Sí | No vacío. Longitud máxima 255 caracteres. |
| juego | Sí | No vacío. Longitud máxima 100 caracteres. |
| duracion_en_minutos | No | Si viene informado: como mínimo 30, como máximo 6000 |
| precio | No | Si viene informado: no puede ser negativo. |

> Ojo al nombre JSON: el atributo del body se llama duracion_en_minutos y en Java usarás probablemente duracionEnMinutos. Tendrás que usar las anotaciones de Jackson para mapearlo correctamente.
>

**Respuesta**

- Debe tener el mismo formato que “Detalle de un torneo” (TorneoResponse).
- Código HTTP: **201 CREATED**.

---

### **1.5. Actualizar un torneo**

**Endpoint:**

```
PUT /torneos/{id}
```

- Usa el mismo JSON de entrada y las mismas validaciones que en POST /torneos.
- Si el torneo no existe:
  - TorneoNoEncontradoException → 404.
- Respuesta: formato TorneoResponse.

---

### **1.6. Eliminar un torneo**

**Endpoint:**

```
DELETE /torneos/{id}
```

- El id se recibe en la URL.
- Si el torneo no existe:
  - TorneoNoEncontradoException → 404.
- Si se elimina correctamente:
  - Código HTTP **204 NO_CONTENT**, sin cuerpo.

---

## 2. Recurso PARTICIPANTES

En esta parte debes **diseñar e implementar todas las capas** para el recurso Participantes:

- Entidad JPA.
- Repositorio.
- DTOs (entrada y salida).
- Servicio.
- Controlador.

### 2.1. Modelo de datos (ya definido)

En base de datos tienes la tabla:

```
Tabla: participantes

- id         BIGSERIAL      (PK)
- nombre     VARCHAR(100)   NOT NULL
- apellidos  VARCHAR(150)   NOT NULL
- pais       VARCHAR(50)    NOT NULL
- edad       INTEGER        NULL
- torneo_id  BIGINT         NOT NULL (FK → torneos.id)
```

> 🚨**Ayuda** En Java deberás crear algo como ParticipanteEntity, con una relación hacia TorneoEntity (@ManyToOne o similar).


### 2.2. Listado de participantes de un torneo

**Endpoint recomendado:**

```
GET /torneos/{torneoId}/participantes
```

**Requisitos:**

- Devuelve el listado de participantes inscritos en el torneo torneoId.
- Si el torneo no existe:
  - TorneoNoEncontradoException → 404.

**Transformaciones en la respuesta:**

- nombre_completo:
  - Debe contener nombre + “ “ + apellidos.

**Ejemplo de respuesta (200 OK):**

```
[
  {
    "id": 1,
    "nombre_completo": "Manuel García López",
    "pais": "España",
    "edad": 25
  },
  {
    "id": 2,
    "nombre_completo": "Mary O'Donell",
    "pais": "Irlanda",
    "edad": 38
  }
]
```