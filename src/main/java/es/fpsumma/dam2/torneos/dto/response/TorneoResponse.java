package es.fpsumma.dam2.torneos.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public record TorneoResponse(
        Long id,
        String nombre,
        String juego,
        @JsonProperty("duracion_en_minutos")
        Integer duracionEnMinutos,
        Integer participantesInscritos,
        String precio) {

}
