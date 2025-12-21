package es.fpsumma.dam2.torneos.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public record ParticipanteResponse(
    Long id,
    @JsonProperty("nombre_completo") String nombreCompleto,
    String pais,
    Integer edad
) {}