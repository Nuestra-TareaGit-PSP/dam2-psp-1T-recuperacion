package es.fpsumma.dam2.torneos.mapper;

import es.fpsumma.dam2.torneos.dto.response.ParticipanteResponse;
import es.fpsumma.dam2.torneos.jpa.entity.ParticipanteEntity;

public class ParticipanteMapper {

    public static ParticipanteResponse toResponse(ParticipanteEntity e) {
        return new ParticipanteResponse(
            e.getId(),
            e.getNombre() + " " + e.getApellidos(),
            e.getPais(),
            e.getEdad()
        );
    }
    
}