package es.fpsumma.dam2.torneos.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

//añado lo que falta en TorneoResponse para que coincida con los cambios en la entidad

public record TorneoResponse(
    Long id,
    String nombre,
    String juego,
    @JsonProperty("duracion_en_minutos") Integer duracionEnMinutos,
    @JsonProperty("participantes_inscritos") Integer participantesInscritos,
    String precio
) {}
