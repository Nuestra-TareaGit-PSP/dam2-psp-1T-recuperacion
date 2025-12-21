package es.fpsumma.dam2.torneos.dto.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

//creo ParticipanteRequest para manejar las solicitudes de creación y actualización de participantes

public record ParticipanteRequest(
    @NotBlank(message = "El nombre es obligatorio")
    @Size(max = 100)
    String nombre,

    @NotBlank(message = "Los apellidos son obligatorios")
    @Size(max = 150)
    String apellidos,

    @NotBlank(message = "El país es obligatorio")
    @Size(max = 50)
    String pais,

    @Min(0) @Max(120)
    Integer edad,

    @NotNull(message = "El ID del torneo es obligatorio")
    Long torneoId
) {}