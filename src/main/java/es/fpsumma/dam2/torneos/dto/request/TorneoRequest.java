package es.fpsumma.dam2.torneos.dto.request;


import jakarta.validation.constraints.Size;

public record TorneoRequest(
        @Size(min = 1, max = 255)
        String nombre,

        String juego,

        Integer duracionEnMinutos,
        Double precio) {
}
