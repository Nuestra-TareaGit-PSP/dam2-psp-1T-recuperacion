package es.fpsumma.dam2.torneos.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;

//actualizo TorneoRequest para que coincida con los cambios en la entidad

public record TorneoRequest(
    @NotBlank @Size(max = 255) 
    String nombre,

    @NotBlank @Size(max = 100) 
    String juego,

    @Min(30)
    @Max(6000)
    @JsonProperty("duracion_en_minutos")
    Integer duracionEnMinutos,

    @PositiveOrZero
    Double precio
) {}
