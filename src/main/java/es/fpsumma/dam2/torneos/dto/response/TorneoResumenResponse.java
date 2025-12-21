package es.fpsumma.dam2.torneos.dto.response;

public record TorneoResumenResponse(
        Long id,
        String nombre,
        String juego
) {}